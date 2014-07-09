//
//  LoadingViewController.m
//  tumblr
//
//  Created by David Luhman on 7/4/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "LoadingViewController.h"

@interface LoadingViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *loadingImage;

@end

@implementation LoadingViewController

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
    
    [self startAnimation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startAnimation {
    
    [self load1];
    
}

- (void)load1 {
    
    self.loadingImage.image = [UIImage imageNamed:@"loading-1"];

    [self performSelector:@selector(load2) withObject:nil afterDelay:.4];
    
}

- (void)load2 {
    
    self.loadingImage.image = [UIImage imageNamed:@"loading-2"];
    
    [self performSelector:@selector(load3) withObject:nil afterDelay:.4];
    
}

- (void)load3 {
    
    self.loadingImage.image = [UIImage imageNamed:@"loading-3"];
    
    [self performSelector:@selector(load1) withObject:nil afterDelay:.4];
    
}


@end
