


#import "RegistViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
@implementation RegistViewController
//注册
@synthesize rigistButton;
//back
@synthesize backImageView;
//用户注册
@synthesize titleTextView;
//登录
@synthesize loginButton;
//用户名:
@synthesize userNameTitleTextView;
//请输入用户名
@synthesize userNameValueEditText;
//手机号码:
@synthesize phoneTitleTextView;
//请输入手机号码
@synthesize phoneValueEditText;
//手机验证码:
@synthesize codeTitleTextView;
//请输入手机验证码
@synthesize codeValueEditText;
//重发验证码
@synthesize codepicButton;
//密码:
@synthesize pwdTitleTextView;
//请输入密码
@synthesize pwdValueEditText;
//重复密码
@synthesize pwd2TitleTextView;
//请输入密码
@synthesize pwd2ValueEditText;
- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated{
}


-(void) setUiValue{

//back
//[backImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[backImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
//用户注册
//[titleTextView setValue:]
////用户名:
//[userNameTitleTextView setValue:]
////请输入用户名
//[userNameValueEditText setValue:]
////手机号码:
//[phoneTitleTextView setValue:]
////请输入手机号码
//[phoneValueEditText setValue:]
////手机验证码:
//[codeTitleTextView setValue:]
////请输入手机验证码
//[codeValueEditText setValue:]
////密码:
//[pwdTitleTextView setValue:]
////请输入密码
//[pwdValueEditText setValue:]
////重复密码
//[pwd2TitleTextView setValue:]
////请输入密码
//[pwd2ValueEditText setValue:]
}


@end

