//
//  CanvasViewController.m
//  canvas
//
//  Created by David Luhman on 6/29/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "CanvasViewController.h"

@interface CanvasViewController ()

@property (weak, nonatomic) IBOutlet UIView *trayContainerView;
@property (weak, nonatomic) IBOutlet UIView *trayView;
@property (weak, nonatomic) IBOutlet UIImageView *cameralImageView;
@property (weak, nonatomic) IBOutlet UIImageView *footballImageView;
@property (weak, nonatomic) IBOutlet UIImageView *retroImageView;
@property (strong, nonatomic) UIImageView *tempImageView;
@property (assign, nonatomic) CGFloat scale;
@property (assign, nonatomic) CGFloat rotate;

- (IBAction)onChrome:(UIPanGestureRecognizer *)sender;
- (IBAction)onGmail:(UIPanGestureRecognizer *)sender;
- (IBAction)onSpotify:(UIPanGestureRecognizer *)sender;
- (IBAction)onTwitter:(UIPanGestureRecognizer *)sender;

@end

@implementation CanvasViewController


float revealedTrayCenter;
float hiddenTrayCenter;
float lastVal;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    revealedTrayCenter = self.trayContainerView.center.y;
    hiddenTrayCenter = self.trayContainerView.center.y;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTrayContainerDrag:(UIPanGestureRecognizer *)sender {
    
    CGPoint touchPosition = [sender locationInView:self.view];
    if(sender.state == UIGestureRecognizerStateBegan) {
        lastVal = touchPosition.y;
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        } else if (sender.state == UIGestureRecognizerStateEnded) {
        
            float half = (revealedTrayCenter + hiddenTrayCenter)/2;
        
        
        [UIView animateWithDuration:.2 delay:0 usingSpringWithDamping:2 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            if(self.trayContainerView.center.y < half) {
                
                self.trayContainerView.center = CGPointMake(self.trayContainerView.center.x, revealedTrayCenter);
                self.trayContainerView.backgroundColor = [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1.0f];
                
            } else {
                
                self.trayContainerView.center = CGPointMake(self.trayContainerView.center.x, hiddenTrayCenter);
                self.trayContainerView.backgroundColor = [UIColor colorWithRed:3/255.0f green:169/255.0f blue:244/255.0f alpha:1.0f];
                
            }
            
        } completion:nil
            
        ];
    }
    
}

- (IBAction)onChrome:(UIPanGestureRecognizer *)sender {
    
    CGPoint touchPosition = [sender locationInView:self.view];
    if(sender.state == UIGestureRecognizerStateBegan) {

        UIPanGestureRecognizer *imagePan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onImagePan:)];
        UIPinchGestureRecognizer *imagePinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onImagePinch:)];
        UIRotationGestureRecognizer *imageRotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(onImageRotation:)];
        
        imagePinch.delegate = self;
        
        [self.tempImageView addGestureRecognizer:imagePan];
        [self.tempImageView addGestureRecognizer:imagePinch];
        [self.tempImageView addGestureRecognizer:imageRotate];
        [self.view addSubview:self.tempImageView];
        
        
    } else if(sender.state == UIGestureRecognizerStateChanged) {
        self.tempImageView.center = CGPointMake(touchPosition.x, touchPosition.y);
        
        
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        if(touchPosition.y > self.view.frame.size.height - self.trayContainerView.frame.size.height) {
            [self.tempImageView removeFromSuperview];
        }
        
    }
    
}

- (IBAction)onGmail:(UIPanGestureRecognizer *)sender {
    CGPoint touchPosition = [sender locationInView:self.view];
    if(sender.state == UIGestureRecognizerStateBegan) {
        float posY = self.trayContainerView.frame.origin.y + self.trayView.frame.origin.y + self.cameralImageView.frame.origin.y;
        CGRect frame = CGRectMake(self.cameralImageView.frame.origin.x, posY, 44, 44);
        self.tempImageView = [[UIImageView alloc] initWithFrame:frame];
        self.tempImageView.image = self.cameralImageView.image;
        self.tempImageView.userInteractionEnabled = YES;
        UIPanGestureRecognizer *imagePan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onImagePan:)];
        UIPinchGestureRecognizer *imagePinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onImagePinch:)];
        UIRotationGestureRecognizer *imageRotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(onImageRotation:)];
        
        imagePinch.delegate = self;
        
        [self.tempImageView addGestureRecognizer:imagePan];
        [self.tempImageView addGestureRecognizer:imagePinch];
        [self.tempImageView addGestureRecognizer:imageRotate];
        [self.view addSubview:self.tempImageView];
        
        
    } else if(sender.state == UIGestureRecognizerStateChanged) {
        self.tempImageView.center = CGPointMake(touchPosition.x, touchPosition.y);
        
        
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        if(touchPosition.y > self.view.frame.size.height - self.trayContainerView.frame.size.height) {
            [self.tempImageView removeFromSuperview];
        }
        
    }
    
}

- (IBAction)onSpotify:(UIPanGestureRecognizer *)sender {
    
    CGPoint touchPosition = [sender locationInView:self.view];
    
    if(sender.state == UIGestureRecognizerStateBegan) {
        float posY = self.trayContainerView.frame.origin.y + self.trayView.frame.origin.y + self.footballImageView.frame.origin.y;
        CGRect frame = CGRectMake(self.footballImageView.frame.origin.x, posY, 44, 44);
        self.tempImageView = [[UIImageView alloc] initWithFrame:frame];
        self.tempImageView.image = self.footballImageView.image;
        self.tempImageView.userInteractionEnabled = YES;
        
        UIPanGestureRecognizer *imagePan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onImagePan:)];
        UIPinchGestureRecognizer *imagePinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onImagePinch:)];
        UIRotationGestureRecognizer *imageRotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(onImageRotation:)];
        
        imagePinch.delegate = self;
        
        [self.tempImageView addGestureRecognizer:imagePan];
        [self.tempImageView addGestureRecognizer:imagePinch];
        [self.tempImageView addGestureRecognizer:imageRotate];
        [self.view addSubview:self.tempImageView];
        
        
    } else if(sender.state == UIGestureRecognizerStateChanged) {
        self.tempImageView.center = CGPointMake(touchPosition.x, touchPosition.y);
        
        
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        if(touchPosition.y > self.view.frame.size.height - self.trayContainerView.frame.size.height) {
            [self.tempImageView removeFromSuperview];
        }
        
    }
    
}

- (IBAction)onTwitter:(UIPanGestureRecognizer *)sender {
    
    CGPoint touchPosition = [sender locationInView:self.view];
    
    if(sender.state == UIGestureRecognizerStateBegan) {
        float posY = self.trayContainerView.frame.origin.y + self.trayView.frame.origin.y + self.retroImageView.frame.origin.y;
        CGRect frame = CGRectMake(self.retroImageView.frame.origin.x, posY, 0, 0);
        self.tempImageView = [[UIImageView alloc] initWithFrame:frame];
        self.tempImageView.image = self.retroImageView.image;
        self.tempImageView.userInteractionEnabled = YES;
        
        UIPanGestureRecognizer *imagePan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onImagePan:)];
        UIPinchGestureRecognizer *imagePinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onImagePinch:)];
        UIRotationGestureRecognizer *imageRotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(onImageRotation:)];
        
        imagePinch.delegate = self;
        
        [self.tempImageView addGestureRecognizer:imagePan];
        [self.tempImageView addGestureRecognizer:imagePinch];
        [self.tempImageView addGestureRecognizer:imageRotate];
        [self.view addSubview:self.tempImageView];
        
        
    } else if(sender.state == UIGestureRecognizerStateChanged) {
        self.tempImageView.center = CGPointMake(touchPosition.x, touchPosition.y);
        
        
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        if(touchPosition.y > self.view.frame.size.height - self.trayContainerView.frame.size.height) {
            [self.tempImageView removeFromSuperview];
        }
        
    }
    
}


- (void)onImagePan:(UIPanGestureRecognizer *)sender {
    CGPoint translation = [sender translationInView:self.view];
    sender.view.center = CGPointMake(sender.view.center.x + translation.x, sender.view.center.y + translation.y);
    [sender setTranslation:CGPointMake(0, 0) inView:self.view];
        
}

- (void)onImagePinch:(UIPinchGestureRecognizer *)sender {
    CGFloat scale = sender.scale;
    self.scale = scale;
    CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(self.rotate);
    sender.view.transform = CGAffineTransformScale(rotateTransform, scale, scale);
}

- (void)onImageRotation:(UIRotationGestureRecognizer *)sender {
    CGFloat rotation = sender.rotation;
    self.rotate = rotation;
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(self.scale, self.scale);
    sender.view.transform = CGAffineTransformRotate(scaleTransform, rotation);
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
