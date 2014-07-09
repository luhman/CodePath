//
//  ComposeViewController.m
//  tumblr
//
//  Created by David Luhman on 7/4/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "ComposeViewController.h"

@interface ComposeViewController ()

@property (weak, nonatomic) IBOutlet UIView *textButton;
@property (weak, nonatomic) IBOutlet UIView *photoButton;
@property (weak, nonatomic) IBOutlet UIView *quoteButton;
@property (weak, nonatomic) IBOutlet UIView *linkButton;
@property (weak, nonatomic) IBOutlet UIView *chatButton;
@property (weak, nonatomic) IBOutlet UIView *videoButton;

@end

@implementation ComposeViewController

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    
}
@end