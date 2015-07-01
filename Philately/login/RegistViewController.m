


#import "RegistViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
#import <PublicFramework/MsgReturn.h> 
#import "RespondParam0003.h"
#import "RespondParam0008.h"
#import "RespondParam0053.h"
#import "PromptError.h"
#import "OMGToast.h"
#import "Toast+UIView.h"

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

NSTimer *countDownTimer ;
int secondsCountDown = 60;//60秒倒计时

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  
    
 
    [self.userNameValueEditText addTarget:self action:@selector(userNameValueEditTextDidEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.phoneValueEditText addTarget:self action:@selector(phoneValueEditTextDidEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
      [self.codeValueEditText addTarget:self action:@selector(codeValueEditTextDidEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    
    
    [self.codepicButton addTarget:self action:@selector(codepicButtonclicked:) forControlEvents:UIControlEventTouchUpInside];
    
       [self.pwdValueEditText addTarget:self action:@selector(pwdValueEditTextDidEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
  [self.pwd2ValueEditText addTarget:self action:@selector(pwd2ValueEditTextDidEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    
    
    [self.rigistButton addTarget:self action:@selector(rigistButtonlicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pwd2ValueEditText addTarget:self action:@selector(pwd2ValueEditTextDidEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backImageViewTap)];
    [backImageView addGestureRecognizer:singleTap1];
    
    
    phoneValueEditText.userInteractionEnabled=NO;
    codeValueEditText.userInteractionEnabled=NO;
    pwdValueEditText.userInteractionEnabled=NO;
    pwd2ValueEditText.userInteractionEnabled=NO;
    rigistButton.userInteractionEnabled=NO;
 
}

-(void)backImageViewTap
{
[self dismissViewControllerAnimated:YES completion:^{
    
}];
}

-(void)timeFireMethod{
    secondsCountDown--;
     [self.codepicButton setTitle:[NSString stringWithFormat:@"%d",secondsCountDown] forState:UIControlStateNormal];
    
    if(secondsCountDown==0){
        [countDownTimer invalidate];
         self.codepicButton.userInteractionEnabled=YES;
      [self.codepicButton setTitle:[NSString stringWithFormat:@"%@",@"获取验证码"] forState:UIControlStateNormal];
        
    }
}

-(void)codepicButtonclicked:(UIButton *)btn{
   
        countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    btn.userInteractionEnabled=NO;
    [self request0053];
   
}



-(void)userNameValueEditTextDidEndOnExit:(UITextField *)textField{
    [phoneValueEditText becomeFirstResponder];//把焦点给别人 键盘消失
    [self request0001];
    
}

-(void)phoneValueEditTextDidEndOnExit:(UITextField *)textField{
    [codeValueEditText becomeFirstResponder];//把焦点给别人 键盘消失
    [self request0002];
    
}

-(void)codeValueEditTextDidEndOnExit:(UITextField *)textField{
    
    [pwdValueEditText becomeFirstResponder];//把焦点给别人 键盘消失
    pwdValueEditText.userInteractionEnabled=YES;
    
}


-(void)pwdValueEditTextDidEndOnExit:(UITextField *)textField{
    
    int count=[textField.text length];
    if(count!=6)
    {
       [self.view makeToast:@"请输入6位密码"];
    }else
    {
    
    [pwd2ValueEditText becomeFirstResponder];//把焦点给别人 键盘消失
    pwd2ValueEditText.userInteractionEnabled=YES;
    }
    
}


-(void)pwd2ValueEditTextDidEndOnExit:(UITextField *)textField{
    
    int count=[textField.text length];
    if(count!=6)
    {
        [self.view makeToast:@"请输入6位密码"];
        
    }else if(![pwd2ValueEditText.text isEqualToString:pwdValueEditText.text])
    {
     [self.view makeToast:@"两次密码输入不一致"];
    }
    else
    {
        
        [rigistButton becomeFirstResponder];//把焦点给别人 键盘消失
        rigistButton.userInteractionEnabled=YES;
    }
    
}

-(void)rigistButtonlicked:(UIButton *)btn{
    
  
    [self request0003];
    
}



-(void) viewWillAppear:(BOOL)animated{
}


-(void) setUiValue{

}


/*用户名唯一校验0001*/
NSString  *n0001=@"JY0001";
/*用户名唯一校验0001*/
-(void) request0001{
    
    
    if(userNameValueEditText.text==nil || [userNameValueEditText.text isEqualToString:@""])
    {
        //[self.view makeToast:@"请输入用户名"];
        return ;
    }
    
    NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
    /* 用户名 备注:必填*/
    [businessparam setValue:userNameValueEditText.text forKey:@"userName"];
    
    CstmMsg *_cstmMsg=[CstmMsg sharedInstance ];
    SysBaseInfo *_sysBaseInfo=[SysBaseInfo sharedInstance];
    
    StampTranCall *stampTranCall=[StampTranCall sharedInstance ];
    
    [stampTranCall jyTranCall:_sysBaseInfo cstmMsg:_cstmMsg formName:n0001 business:businessparam delegate:self viewController:self];

    
}




/*手机号码唯一校验0002*/
NSString  *n0002=@"JY0002";
/*手机号码唯一校验0002*/
-(void) request0002{

    if(phoneValueEditText.text==nil || [phoneValueEditText.text isEqualToString:@""])
    {
        //[self.view makeToast:@"请输入用户名"];
        return ;
    }

    
    NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
    /* 手机号码 备注:必填*/
    [businessparam setValue:phoneValueEditText.text forKey:@"mobileNo"];
    
    CstmMsg *_cstmMsg=[CstmMsg sharedInstance ];
    SysBaseInfo *_sysBaseInfo=[SysBaseInfo sharedInstance];
    
    StampTranCall *stampTranCall=[StampTranCall sharedInstance ];
    
    [stampTranCall jyTranCall:_sysBaseInfo cstmMsg:_cstmMsg formName:n0002 business:businessparam delegate:self viewController:self];

    }




/*用户注册0003*/
NSString  *n0003=@"JY0003";
/*用户注册0003*/
-(void) request0003{
    
    
    if(userNameValueEditText.text==nil || [userNameValueEditText.text isEqualToString:@""])
    {
        [self.view makeToast:@"请输入用户名"];
        return ;
    }
    
  
    
    if(phoneValueEditText.text==nil || [phoneValueEditText.text isEqualToString:@""])
    {
    [self.view makeToast:@"请输入手机号"];
        return;
    }
    
    if(codeValueEditText.text==nil || [codeValueEditText.text isEqualToString:@""])
    {
        [self.view makeToast:@"请输入验证码"];
        return;
    }
    
    if(pwdValueEditText.text==nil || [pwdValueEditText.text isEqualToString:@""])
    {
        [self.view makeToast:@"请输入密码"];
        return;
    }
    
    
    if(pwd2ValueEditText.text==nil || [pwd2ValueEditText.text isEqualToString:@""])
    {
        [self.view makeToast:@"请输入确认密码"];
        return;
    }
    
    if(![pwd2ValueEditText.text isEqualToString:pwdValueEditText.text])
    {
        [self.view makeToast:@"两次密码输入不一致"];
        return;
    }
 

    
    NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
    /* 用户名 备注:必填*/
    [businessparam setValue:userNameValueEditText.text forKey:@"userName"];
    /* 手机号码 备注:必填*/
    [businessparam setValue:phoneValueEditText.text forKey:@"mobileNo"];
    /* 密码 备注:必填*/
    [businessparam setValue:pwdValueEditText.text forKey:@"passWord"];
    /* 手机验证码 备注:必填*/
    [businessparam setValue:codeValueEditText.text forKey:@"verificationCode"];
   
    CstmMsg *_cstmMsg=[CstmMsg sharedInstance ];
    SysBaseInfo *_sysBaseInfo=[SysBaseInfo sharedInstance];
    
    StampTranCall *stampTranCall=[StampTranCall sharedInstance ];
    
    [stampTranCall jyTranCall:_sysBaseInfo cstmMsg:_cstmMsg formName:n0003 business:businessparam delegate:self viewController:self];
}




/*手机验证码发送0053*/
NSString  *n0053=@"JY0053";
/*手机验证码发送0053*/
-(void) request0053{
    NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
    /* 手机号码 备注:必填*/
    [businessparam setValue:phoneValueEditText.text forKey:@"mobileNo"];
    
    CstmMsg *_cstmMsg=[CstmMsg sharedInstance ];
    SysBaseInfo *_sysBaseInfo=[SysBaseInfo sharedInstance];
    
    StampTranCall *stampTranCall=[StampTranCall sharedInstance ];
    
    [stampTranCall jyTranCall:_sysBaseInfo cstmMsg:_cstmMsg formName:n0053 business:businessparam delegate:self viewController:self];
}





-(void) ReturnError:(MsgReturn*)msgReturn
{
}

-(void) ReturnData:(MsgReturn*)msgReturn
{
    
   // NSMutableArray *listData=[[NSMutableArray alloc]init];
    /*用户名唯一校验0001*/
    if ([msgReturn.formName isEqualToString:n0001]){
        NSDictionary *returnData=[msgReturn.map objectForKey:@"returnData"];
        NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
        NSString *respDesc=[returnHead objectForKey:@"respDesc"];
        NSString *respCode=[returnHead objectForKey:@"respCode"];
        NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
        
        
      
       

        [self.view makeToast:@"用户名校验成功,请输入手机号"];
        phoneValueEditText.userInteractionEnabled=YES;
      
     
    }
    
    
    
    
    //NSMutableArray *listData=[[NSMutableArray alloc]init];
    /*手机号码唯一校验0002*/
    if ([msgReturn.formName isEqualToString:n0002]){
        NSDictionary *returnData=[msgReturn.map objectForKey:@"returnData"];
        NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
        NSString *respDesc=[returnHead objectForKey:@"respDesc"];
        NSString *respCode=[returnHead objectForKey:@"respCode"];
        NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
        [self.view makeToast:@"手机号校验成功,请获取验证码"];
          codeValueEditText.userInteractionEnabled=YES;
       // RespondParam0002 *commonItem=[[RespondParam0002 alloc]init];
    }
    
    
    
    
    //NSMutableArray *listData=[[NSMutableArray alloc]init];
    /*用户注册0003*/
    if ([msgReturn.formName isEqualToString:n0003]){
        NSDictionary *returnData=[msgReturn.map objectForKey:@"returnData"];
        NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
        NSString *respDesc=[returnHead objectForKey:@"respDesc"];
        NSString *respCode=[returnHead objectForKey:@"respCode"];
        NSDictionary *returnDataBody=[returnData objectForKey:@"returnBody"];
        RespondParam0003 *commonItem=[[RespondParam0003 alloc]init];
        /* 会员编号 备注:*/
        commonItem.cstmNo=[returnDataBody objectForKey:@"cstmNo"];
        if(commonItem.cstmNo!=nil && ![commonItem.cstmNo isEqualToString:@""])
         [self.view makeToast:@"注册成功"];
       
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
    
    
    
    
    //NSMutableArray *listData=[[NSMutableArray alloc]init];
    /*手机验证码发送0053*/
    if ([msgReturn.formName isEqualToString:n0053]){
        NSDictionary *returnData=[msgReturn.map objectForKey:@"returnData"];
        NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
        NSString *respDesc=[returnHead objectForKey:@"respDesc"];
        NSString *respCode=[returnHead objectForKey:@"respCode"];
        NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
        RespondParam0053 *commonItem=[[RespondParam0053 alloc]init];
    }
    
    
    
    
   
}



@end






