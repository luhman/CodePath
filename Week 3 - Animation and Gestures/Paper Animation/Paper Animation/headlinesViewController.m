//
//  headlinesViewController.m
//  Paper Animation
//
//  Created by David Luhman on 6/25/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "headlinesViewController.h"

@interface headlinesViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *headlinesImageView;
@property (weak, nonatomic) IBOutlet UIImageView *trendingImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *trendingScrollview;
@property (nonatomic, assign) CGPoint originalState;
@property (weak, nonatomic) IBOutlet UIView *mainView;


@end

@implementation headlinesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // Initialize Pan Gesture Recognizer
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onCustomPan:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
    [self.view setUserInteractionEnabled:YES];
    
    // Initialize Scroll View
    [self.trendingScrollview setScrollEnabled:YES];
    [self.trendingScrollview setContentSize:CGSizeMake(1444, 253)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Pan action
- (void)onCustomPan:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint point = [panGestureRecognizer locationInView:self.view];
    CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
    
    // Calculate offset
    int difference = 0;
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        self.originalState = point;
    }
    else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        difference = self.originalState.y - point.y;
        self.originalState = point;
    }
    else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        difference = self.originalState.y - point.y;
    }
    
    // Set Offset
    self.mainView.center = CGPointMake(self.mainView.center.x, self.mainView.center.y - difference);
    
    // You hit the ceiling
    if (self.mainView.center.y < 284) {
        
        if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
            
            [UIView animateWithDuration: 2
                                  delay: 0
                 usingSpringWithDamping: .9
                  initialSpringVelocity: 5
                                options: 0
                             animations: ^
             {
                 self.mainView.center = CGPointMake(160, 284);
             }
                             completion: nil
             ];
            
        }
        else if(panGestureRecognizer.state == UIGestureRecognizerStateChanged && self.mainView.center.y < 244) {
            self.mainView.center = CGPointMake(160, 244);
        }
    }
    
    else if(self.mainView.center.y == 852) {
        self.mainView.center = CGPointMake(160, 812);
    }
    
    
    // Resting place
    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        if (self.mainView.center.y > 300 && velocity.y > 10) {
            [UIView animateWithDuration:.5 animations:^{
                self.mainView.center = CGPointMake(160, 812);
            }];
        }
        
        // Come back up here
        else if(self.mainView.center.y < 800 && velocity.y < -10) {
            [UIView animateWithDuration:.5 animations:^{
                self.mainView.center = CGPointMake(160, 284);
            }];
        }
    }
}


@end
