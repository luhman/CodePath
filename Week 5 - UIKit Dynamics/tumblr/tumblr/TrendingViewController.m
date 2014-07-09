//
//  TrendingViewController.m
//  tumblr
//
//  Created by David Luhman on 7/4/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "TrendingViewController.h"

@interface TrendingViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *trendingScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *trendingImageView;

@end

@implementation TrendingViewController

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
    self.trendingScrollView.contentSize = self.trendingImageView.frame.size;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
