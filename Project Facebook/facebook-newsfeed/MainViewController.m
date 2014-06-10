//
//  MainViewController.m
//  facebook-newsfeed
//
//  Created by David Luhman on 6/9/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

// Declare some methods that will be called when the keyboard is about to be shown or hidden
//- (void)willShowKeyboard:(NSNotification *)notification;
//- (void)willHideKeyboard:(NSNotification *)notification;
//

@property (weak, nonatomic) IBOutlet UIView *Card;
@property (weak, nonatomic) IBOutlet UIView *shareContainer;
@property (weak, nonatomic) IBOutlet UIImageView *cardPhoto;

// Setup toggle keyboard interaction
- (IBAction)onTap:(id)sender;

//@property (weak, nonatomic) IBOutlet UIImageView *writeContainer;
//@property (weak, nonatomic) IBOutlet UITextField *writeComment;

@property (weak, nonatomic) IBOutlet UIView *writeContainer;
@property (weak, nonatomic) IBOutlet UITextField *writeComment;

@end

@implementation MainViewController

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
    
    self.Card.backgroundColor = [UIColor whiteColor];
    self.Card.layer.cornerRadius = 5;
    self.Card.layer.shadowColor = [UIColor blackColor].CGColor;
    self.Card.layer.shadowOffset = CGSizeMake(0, 3);
    self.Card.layer.shadowOpacity = 0.7;
    self.Card.layer.shadowRadius = 2;
    
    self.cardPhoto.layer.shadowColor = [UIColor blackColor].CGColor;
    self.cardPhoto.layer.shadowOffset = CGSizeMake(0, 1);
    self.cardPhoto.layer.shadowOpacity = 0.25;
    self.cardPhoto.layer.shadowRadius = 1;
    
    self.shareContainer.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.shareContainer.layer.borderWidth = 1;
    
    self.writeComment.delegate = self;
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, self.writeComment.frame.size.height)];
    leftView.backgroundColor = self.writeComment.backgroundColor;
    self.writeComment.leftView = leftView;
    self.writeComment.leftViewMode = UITextFieldViewModeAlways;
    
    
//    self.inputComment.textView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed: @"textfieldBackground.png"]];
//    self.inputComment.textView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed@"textfieldBackground.png"]];
    
//    
//    self.writeComment.delegate = self;
//    
//    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, self.writeComment.frame.size.height)];
//    leftView.backgroundColor = self.writeComment.backgroundColor;
//    self.writeComment.leftView = leftView;
//    self.writeComment.leftViewMode = UITextFieldViewModeAlways;
//    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    // Adjust position up
    NSLog(@"I need to move up");
    
    [UIView animateWithDuration: .55
                          delay: 0
         usingSpringWithDamping: 1
          initialSpringVelocity: 0
                        options: 0
                     animations: ^
     {
         self.writeContainer.center = CGPointMake(self.writeContainer.center.x, self.writeContainer.center.y-170);
     }
                     completion: nil
     ];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    // Adjust position down
    NSLog(@"I need to move down");
    
    [UIView animateWithDuration: .01
                          delay: 0
         usingSpringWithDamping: 1
          initialSpringVelocity: 0
                        options: 0
                     animations: ^
     {
         self.writeContainer.center = CGPointMake(self.writeContainer.center.x, self.writeContainer.center.y+170);
     }
                     completion: nil
     ];
}

- (IBAction)onLikeButton:(id)sender {
    UIButton *button = (UIButton*)sender;
    button.selected = !button.isSelected;
}



- (IBAction)onTap:(id)sender {
    // Hides Keyboard
    [self.view endEditing:YES];
}
@end
