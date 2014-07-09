//
//  HomeViewController.m
//  tumblr
//
//  Created by David Luhman on 7/4/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

- (IBAction)onLogin:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *homeScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *homeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *loginImage;
- (IBAction)onLoginTap:(UITapGestureRecognizer *)sender;


@end

@implementation HomeViewController

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
    self.homeScrollView.contentSize = self.homeImageView.frame.size;
    self.loginImage.frame = CGRectMake(0, 480, self.loginImage.frame.size.width, self.loginImage.frame.size.height);
    self.loginImage.alpha = 0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onLogin:(id)sender {
    [self showLogin];
    
}

- (IBAction)onLoginTap:(UITapGestureRecognizer *)sender {
    [self hideLogin];

}

- (void)hideLogin {
    
    [UIView animateWithDuration:.3 animations:^{
        self.loginImage.frame = CGRectMake(0, 480, self.loginImage.frame.size.width, self.loginImage.frame.size.height);
        self.loginImage.alpha = 0;
    }];
}

- (void)showLogin {
    
    [UIView animateWithDuration:.3 animations:^{
        self.loginImage.frame = CGRectMake(0, 0, self.loginImage.frame.size.width, self.loginImage.frame.size.height);
        self.loginImage.alpha = 1;
    }];
}

@end
