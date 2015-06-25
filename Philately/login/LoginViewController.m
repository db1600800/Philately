


#import "LoginViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
#import "StampTranCall.h"
#import "SliderViewController.h"
#import "PromptError.h"
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
    
    UITapGestureRecognizer *codeButtonTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapToGenerateCode)];
    [codePicImageView addGestureRecognizer:codeButtonTap];
    
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



- (void)onTapToGenerateCode {
    
    

    float red = arc4random() % 100 / 100.0;
    float green = arc4random() % 100 / 100.0;
    float blue = arc4random() % 100 / 100.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:0.2];
    [self.codePicImageView setBackgroundColor:color];
    // @} end 生成背景色
//
    // @{
    // @name 生成文字
    const int count = 5;
    char data[count];
    for (int x = 0; x < count; x++) {
        int j = '0' + (arc4random_uniform(75));
        if((j >= 58 && j <= 64) || (j >= 91 && j <= 96)){
            --x;
        }else{
            data[x] = (char)j;
        }
    }
    NSString *text = [[NSString alloc] initWithBytes:data
                                              length:count encoding:NSUTF8StringEncoding];
      validateCode= text;
  
    
       [self.codePicImageView setText:validateCode];
}



- (IBAction)backgroud:(id)sender {
    // 发送resignFirstResponder.
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

- (IBAction)username:(id)sender {
    
    [pwdValueEditText becomeFirstResponder];
    
    
}

- (IBAction)pwd:(id)sender {
    
    [codeValueEditText becomeFirstResponder];
    [self onTapToGenerateCode ];
}

- (IBAction)code:(id)sender {
    [loginButton becomeFirstResponder];
    if([self.codeValueEditText.text isEqualToString:validateCode])
    {
        [PromptError toast:nil errorMSg:@"请输入验证码"];
    }
    
}
@end

