//
//  LoginViewController.m
//  Login Screen created with XIB
//
//  Created by Aleksandra Borovytskaya on 4/24/15.
//  Copyright (c) 2015 Aleksandra Borovytskaya. All rights reserved.
//

#import "LoginViewController.h"
#import "NSString+Utils.h"

@interface LoginViewController ()


@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *ConfirmPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *Login;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];

}

- (IBAction)validateInput:(UITextField *)sender
{
    BOOL isEmailValid = [self.emailTextField.text validateEmail];
    BOOL isPasswordValid = [self validatePassword:self.PasswordTextField.text];
    BOOL isConfirmPasswordValid = [self.ConfirmPasswordTextField.text isEqualToString: self.PasswordTextField.text];
    
    self.emailTextField.textColor = isEmailValid ? [UIColor blackColor] : [UIColor redColor];
    self.PasswordTextField.textColor = isPasswordValid ? [UIColor blackColor] : [UIColor redColor];
    self.ConfirmPasswordTextField.textColor = isConfirmPasswordValid ? [UIColor blackColor] : [UIColor redColor];
    
    self.Login.enabled =isEmailValid&&isPasswordValid&&isConfirmPasswordValid;
}

- (BOOL)validatePassword:(NSString *)text
{
    BOOL isLengthValid = text.length>6 && text.length<500;
    NSCharacterSet *capitalLetters = [NSCharacterSet uppercaseLetterCharacterSet];
    NSRange rangeCapital = [text rangeOfCharacterFromSet:capitalLetters];
    BOOL containsAtLeastOneCap = rangeCapital.location!=NSNotFound;
    
    return isLengthValid&&containsAtLeastOneCap;
}




@end
