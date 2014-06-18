//
//  LoginViewController.m
//  FacebookLogin
//
//  Created by David Luhman on 6/15/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//


#import "Login.h"
#import "Feed.h"
#import "More.h"


@interface LoginViewController ()
// Touch gesture controller
- (IBAction)onTap:(id)sender;

// Text fields
- (IBAction)onUsernameEntered:(id)sender;
- (IBAction)onPasswordEntered:(id)sender;

// Buttons
- (IBAction)onLoginButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

// Keyboard stuff
@property (weak, nonatomic) IBOutlet UIView *loginAreaView;
- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;

// Functions
- (void)validatePassword;

// Spinny Loader
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loginActivityIndicator;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // Register the methods for the keyboard hide/show events
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.loginButton.enabled = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    

    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    

    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    
    
    
    
    // keyboard animation from other class
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.loginAreaView.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.loginAreaView.frame.size.height, self.loginAreaView.frame.size.width, self.loginAreaView.frame.size.height);
                     }
                     completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
//    - (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//    {
//        [[self view] endEditing:YES];
//    }
//    
//    - (IBAction)loginPress:(id)sender {
//        [self.loginButton setSelected:YES];
//        [[self view] endEditing:YES];
//        [self.indicatorView startAnimating];
//        [self performSelector:@selector(passwordMethod) withObject:nil afterDelay:3];
//    }
//    
//    - (void)passwordWrong {
//        [self.loginButton setSelected:NO];
//        //Incorrect Password Alert
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password Dude!"
//                                                            message:@"The password you entered is incorrect. Please try again."
//                                                           delegate:self
//                                                  cancelButtonTitle:@"OK"
//                                                  otherButtonTitles:nil];
//        [alertView show];
//    }
    

    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.loginAreaView.frame = CGRectMake(0,  // X-axis
                           // I feel like this shouldn't be hard-coded, but it works...
                           0, // Y-axis
                           self.loginAreaView.frame.size.width,
                           self.loginAreaView.frame.size.height);
                     }
                     completion:nil];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onLoginButton:(id)sender {
    // Dismiss the keyboard
    [self.view endEditing:YES];
    
    [UIView animateWithDuration:0.3 animations:^{self.loginActivityIndicator.alpha = 1.0;}];
    
    // Toggle on the indicator
    [self.loginActivityIndicator startAnimating];
    
    // Set button to selected state
    UIButton *button = (UIButton*) self.loginButton;
    button.selected = !button.selected;
    
    // Fire the validatePassword function with delay
    [self performSelector:@selector(validatePassword) withObject:nil afterDelay:2];
}

//
////This works, don't delete!!!!
//
//- (void)validatePassword {
//    
//    if ([self.passwordTextField.text isEqual: (@"123")])
//        
//    {
//        [self.indicatorView stopAnimating];
//        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//        appDelegate.tabBarController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        [self presentViewController:appDelegate.tabBarController animated:YES completion:nil];
//        
//    }
//    else
//    {
//        //kills animation
//        [self.indicatorView stopAnimating];
//        [self performSelector:@selector(passwordWrong) withObject:nil];
//        
//    }
//    
//    
//}

- (void)validatePassword {
    if ([self.passwordTextField.text isEqualToString:@"password"]) {
        FeedscreenViewController *feedScreenController = [[FeedscreenViewController alloc] init];
        MoreViewController *moreViewController = [[MoreViewController alloc] init];
        
        UINavigationController *feedNavController =[[UINavigationController alloc] initWithRootViewController:feedScreenController];
        UINavigationController *moreNavController =[[UINavigationController alloc] initWithRootViewController:moreViewController];
        UITabBarController *tabBarController = [[UITabBarController alloc] init];
        
        
        
        
        
        
        tabBarController.viewControllers = @[feedNavController, moreNavController];
        
        // Navbar title for Newsfeed
        feedNavController.tabBarItem.title = @"Newsfeed";
        feedNavController.tabBarItem.image = [UIImage imageNamed:@"feed_tab_img"];
        // Navbar title for More
        moreNavController.tabBarItem.title = @"More";
        moreNavController.tabBarItem.image = [UIImage imageNamed:@"more_tab_img"];

        
        // Define transition
        feedScreenController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        // Do the new view
        [self presentViewController:tabBarController animated:YES completion:nil];
    }
    else {
        [self.loginActivityIndicator stopAnimating];
        self.loginButton.selected = false;
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"You need to try again!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        
        
        [alertView show];
    }
}

- (IBAction)onUsernameEntered:(id)sender {
    if (self.passwordTextField.hasText) {
        self.loginButton.enabled = true;
    }
    else {
        self.loginButton.enabled = false;
    }
}
- (IBAction)onPasswordEntered:(id)sender {
    if (self.usernameTextField.hasText) {
        self.loginButton.enabled = true;
    }
    else {
        self.loginButton.enabled = false;
    }
}

//- (IBAction)editDidChange:(id)sender {
//    
//    if (((UITextField*)sender).text.length > 0) {
//        [_loginButton setEnabled:YES];
//    } else {
//        [_loginButton setEnabled:NO];
//    }
//}
//


@end
