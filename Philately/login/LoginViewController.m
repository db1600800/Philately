


#import "LoginViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
#import "StampTranCall.h"
#import "SliderViewController.h"
@implementation LoginViewController
//back
@synthesize backImageView;
//用户登录
@synthesize titleTextView;
//注册
@synthesize rigistButton;
//用户名
@synthesize userNameTitleTextView;
//请输入用户名或手机号码
@synthesize userNameValueEditText;
//密码
@synthesize pwdTitleTextView;
//请输入密码
@synthesize pwdValueEditText;
//验证码
@synthesize codeTitleTextView;
//请输入验证码
@synthesize codeValueEditText;
//codePic
@synthesize codePicImageView;
//忘记密码
@synthesize forgetPwdButton;
//登录
@synthesize loginButton;

StampTranCall *stampTranCall;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
     stampTranCall=[[StampTranCall alloc] init ];
    //[ stampTranCall jyTranCall:nil  cstmMsg:nil formName:nil business:nil delegate:self];
    
    UITapGestureRecognizer *backImageViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backImageViewHandTap)];
    [backImageView addGestureRecognizer:backImageViewTap];
    
    
    UITapGestureRecognizer *loginButtonTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loginButtonHandTap)];
    [loginButton addGestureRecognizer:loginButtonTap];
    
}

-(void)backImageViewHandTap
{
[self dismissViewControllerAnimated:NO completion:^(){}];
    [self.navigationController popoverPresentationController];
}

-(void)loginButtonHandTap
{
[self dismissViewControllerAnimated:NO completion:^(){}];
    [[SliderViewController sharedSliderController].navigationController popoverPresentationController];
 
}

-(void) viewWillAppear:(BOOL)animated{
}


-(void) setUiValue{

////back
//[backImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[backImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////用户登录
//[titleTextView setValue:]
////用户名
//[userNameTitleTextView setValue:]
////请输入用户名或手机号码
//[userNameValueEditText setValue:]
////密码
//[pwdTitleTextView setValue:]
////请输入密码
//[pwdValueEditText setValue:]
////验证码
//[codeTitleTextView setValue:]
////请输入验证码
//[codeValueEditText setValue:]
////codePic
//[codePicImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[codePicImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
}


-(void) ReturnData:(MsgReturn*)msgReturn
{

    
}

@end

