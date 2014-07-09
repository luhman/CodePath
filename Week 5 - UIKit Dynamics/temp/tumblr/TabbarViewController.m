//
//  TabbarViewController.m
//  tumblr
//
//  Created by David Luhman on 7/7/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "TabbarViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "ComposeViewController.h"
#import "ActivityViewController.h"
#import "AccountViewController.h"


@interface TabbarViewController ()

@property (nonatomic, strong) HomeViewController *homeViewController;
- (IBAction)onHomeButton:(UIButton *)sender;
@property (nonatomic, strong) SearchViewController *searchViewController;
- (IBAction)onSearchButton:(UIButton *)sender;
@property (nonatomic, strong) ComposeViewController *composeViewController;
- (IBAction)onComposeButton:(UIButton *)sender;
@property (nonatomic, strong) ActivityViewController *activityViewController;
- (IBAction)onActivityButton:(UIButton *)sender;
@property (nonatomic, strong) AccountViewController *accountViewController;
- (IBAction)onAccountButton:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation TabbarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.homeViewController = [[HomeViewController alloc] init];
        self.searchViewController = [[SearchViewController alloc] init];
        self.composeViewController = [[ComposeViewController alloc] init];
        self.activityViewController = [[ActivityViewController alloc] init];
        self.accountViewController = [[AccountViewController alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.contentView addSubview:self.homeViewController.view];
    self.contentView.clipsToBounds = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onHomeButton:(UIButton *)sender {
    self.homeViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.homeViewController.view];

}

- (IBAction)onSearchButton:(UIButton *)sender {
    self.searchViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.searchViewController.view];

}

- (IBAction)onComposeButton:(UIButton *)sender {
    self.composeViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.composeViewController.view];

}

- (IBAction)onAccountButton:(UIButton *)sender {
    self.accountViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.accountViewController.view];

}
- (IBAction)onActivityButton:(UIButton *)sender {
    self.activityViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.activityViewController.view];

}
@end
