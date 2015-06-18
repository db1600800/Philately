


#import "FindPwdViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
@implementation FindPwdViewController
//找回密码
@synthesize findPwdButton;
//back
@synthesize backImageView;
//找回密码
@synthesize titleTextView;
//手机号码
@synthesize phoneTitleTextView;
//请输入手机号码
@synthesize phoneValueEditText;
//验证码:
@synthesize codeTitleTextView;
//请输入验证码
@synthesize codeValueEditText;
//新密码:
@synthesize pwdTitleTextView;
//请重新输入密码
@synthesize pwdValueEditText;
//确认新密码:
@synthesize pwd2TitleTextView;
//请输入新密码
@synthesize pwd2ValueEditText;
- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated{
}


-(void) setUiValue{

////back
//[backImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[backImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////找回密码
//[titleTextView setValue:]
////手机号码
//[phoneTitleTextView setValue:]
////请输入手机号码
//[phoneValueEditText setValue:]
////验证码:
//[codeTitleTextView setValue:]
////请输入验证码
//[codeValueEditText setValue:]
////新密码:
//[pwdTitleTextView setValue:]
////请重新输入密码
//[pwdValueEditText setValue:]
////确认新密码:
//[pwd2TitleTextView setValue:]
////请输入新密码
//[pwd2ValueEditText setValue:]
}


@end

