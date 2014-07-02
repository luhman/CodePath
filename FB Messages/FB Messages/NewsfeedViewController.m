//
//  NewsfeedViewController.m
//  FB Messages
//
//  Created by David Luhman on 6/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "NewsfeedViewController.h"

@interface NewsfeedViewController ()
@property (weak, nonatomic) IBOutlet UIView *newsFeed;
@property (weak, nonatomic) IBOutlet UIScrollView *newsFeedScroll;
- (IBAction)onDarren:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *chatHead;
- (IBAction)onChatHeadPan:(UIPanGestureRecognizer *)sender;

@end

@implementation NewsfeedViewController

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
    
    // Set Values for Navbar
    self.title = @"News Feed";
    
    // Set Left Navbar Button
    UIImage *leftButtonImage = [[UIImage imageNamed:@"left_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:(UIBarButtonItemStylePlain) target:self action:nil];
    
    self.navigationItem.leftBarButtonItem = leftButton;
    
    // Set Right Navbar Button
    UIImage *rightButtonImage = [[UIImage imageNamed:@"right_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // Added @selector for the -(void) action
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:(UIBarButtonItemStylePlain) target:self action:@selector(onRightButton)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
    // Set Height for Newsfeed Scroll View
    self.newsFeedScroll.contentSize = CGSizeMake(320, 1200);
    
    
    // Move Newsfeeds over to left // back to original state
    self.newsFeed.center = CGPointMake(160, self.newsFeed.center.y);
    
    // Chat Head
    
    self.chatHead.hidden = YES;

    
    
}

- (void) onRightButton {
    NSLog(@"Tap Right button");
    
    // Moves the Newsfeed over on Tap
    if(self.newsFeed.center.x == 160){
        [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.newsFeed.center = CGPointMake(-110, self.newsFeed.center.y);
        } completion:nil];
    } else{
        [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.newsFeed.center = CGPointMake(160, self.newsFeed.center.y);
        } completion:nil];
    }

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDarren:(UIButton *)sender {
    NSLog(@"Don't tell Darren");
}
- (IBAction)onChatHeadPan:(UIPanGestureRecognizer *)sender {
    NSLog(@"Chat Head Panning");
    
}
@end
