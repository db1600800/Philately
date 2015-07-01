//注入网络请求,响应,等待提示



#import "FindPwdViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
#import "RespondParam0053.h"
#import "RespondParam0005.h"
#import "Toast+UIView.h"
@implementation FindPwdViewController
//找回新密码
@synthesize findpwdButton;
//back
@synthesize backImageView;
//找回密码
@synthesize titleTextView;
//手机号码
@synthesize phoneTitleTextView;
//请输入手机号
@synthesize phoneValueEditText;
//获取验证码
@synthesize getcodeButton;
//验证码
@synthesize codeTitleTextView;
//请输入验证码
@synthesize codeValueEditText;
//新密码
@synthesize newpwdTitleTextView;
//请输入新密码
@synthesize newpwdValueEditText;
//确认新密码
@synthesize newpwd2TitleTextView;
//请再输入新密码
@synthesize newpwd2ValueEditText;

NSTimer *countDownTimer2 ;
int secondsCountDown2 = 60;//60秒倒计时

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
      [self.phoneValueEditText addTarget:self action:@selector(phoneValueEditTextDidEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
      [self.getcodeButton addTarget:self action:@selector(codepicButtonclicked:) forControlEvents:UIControlEventTouchUpInside];
    
        [self.codeValueEditText addTarget:self action:@selector(codeValueEditTextDidEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.newpwdValueEditText addTarget:self action:@selector(pwdValueEditTextDidEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.newpwd2ValueEditText addTarget:self action:@selector(pwd2ValueEditTextDidEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    
    
    [self.findpwdButton addTarget:self action:@selector(rigistButtonlicked:) forControlEvents:UIControlEventTouchUpInside];

    
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backImageViewTap)];
    [backImageView addGestureRecognizer:singleTap1];
    
    codeValueEditText.userInteractionEnabled=NO;
    newpwdValueEditText.userInteractionEnabled=NO;
    newpwd2ValueEditText.userInteractionEnabled=NO;
    getcodeButton.userInteractionEnabled=NO;
    findpwdButton.userInteractionEnabled=NO;
}

-(void) viewWillAppear:(BOOL)animated{
}


-(void)backImageViewTap
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)timeFireMethod{
    secondsCountDown2--;
    [self.getcodeButton setTitle:[NSString stringWithFormat:@"%d",secondsCountDown2] forState:UIControlStateNormal];
    
    if(secondsCountDown2==0){
        [countDownTimer2 invalidate];
        self.getcodeButton.userInteractionEnabled=YES;
        [self.getcodeButton setTitle:[NSString stringWithFormat:@"%@",@"获取验证码"] forState:UIControlStateNormal];
        
    }
}
-(void)codepicButtonclicked:(UIButton *)btn{
    
    countDownTimer2 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    btn.userInteractionEnabled=NO;
    [self request0053];
    
}

-(void)phoneValueEditTextDidEndOnExit:(UITextField *)textField{
    
    [codeValueEditText becomeFirstResponder];//把焦点给别人 键盘消失
    codeValueEditText.userInteractionEnabled=YES;
    getcodeButton.userInteractionEnabled=YES;
}

-(void)codeValueEditTextDidEndOnExit:(UITextField *)textField{
    
    [newpwdValueEditText becomeFirstResponder];//把焦点给别人 键盘消失
    newpwdValueEditText.userInteractionEnabled=YES;
    
}

-(void)pwdValueEditTextDidEndOnExit:(UITextField *)textField{
    
    int count=[textField.text length];
    if(count!=6)
    {
        [self.view makeToast:@"请输入6位密码"];
    }else
    {
        
        [newpwd2ValueEditText becomeFirstResponder];//把焦点给别人 键盘消失
        newpwd2ValueEditText.userInteractionEnabled=YES;
    }
    
}


-(void)pwd2ValueEditTextDidEndOnExit:(UITextField *)textField{
    
    int count=[textField.text length];
    if(count!=6)
    {
        [self.view makeToast:@"请输入6位密码"];
        
    }else if(![newpwd2ValueEditText.text isEqualToString:newpwdValueEditText.text])
    {
        [self.view makeToast:@"两次密码输入不一致"];
    }
    else
    {
        
        [findpwdButton becomeFirstResponder];//把焦点给别人 键盘消失
        findpwdButton.userInteractionEnabled=YES;
    }
    
}


-(void)rigistButtonlicked:(UIButton *)btn{
    
    
    [self request0005];
    
}


-(void) setUiValue{


}


/*手机验证码发送0053*/
NSString  *nn0053=@"JY0053";
/*手机验证码发送0053*/
-(void) request0053{
    NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
    /* 手机号码 备注:必填*/
    [businessparam setValue:phoneValueEditText.text forKey:@"mobileNo"];
    
    CstmMsg *_cstmMsg=[CstmMsg sharedInstance ];
    SysBaseInfo *_sysBaseInfo=[SysBaseInfo sharedInstance];
    
    StampTranCall *stampTranCall=[StampTranCall sharedInstance ];
    
    [stampTranCall jyTranCall:_sysBaseInfo cstmMsg:_cstmMsg formName:nn0053 business:businessparam delegate:self viewController:self];
}





/*找回密码 0005*/
NSString  *n0005=@"JY0005";
/*找回密码 0005*/
-(void) request0005{
    


    
    
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
    
    if(newpwdValueEditText.text==nil || [newpwdValueEditText.text isEqualToString:@""])
    {
        [self.view makeToast:@"请输入密码"];
        return;
    }
    
    
    if(newpwd2ValueEditText.text==nil || [newpwd2ValueEditText.text isEqualToString:@""])
    {
        [self.view makeToast:@"请输入确认密码"];
        return;
    }
    
    if(![newpwd2ValueEditText.text isEqualToString:newpwdValueEditText.text])
    {
        [self.view makeToast:@"两次密码输入不一致"];
        return;
    }

    
    
NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
/* 手机号码 备注:必填*/
[businessparam setValue:phoneValueEditText.text forKey:@"mobileNo"];
/* 手机验证码 备注:必填*/
[businessparam setValue:codeValueEditText.text forKey:@"verificationCode"];
/* 新密码 备注:必填*/
[businessparam setValue:newpwdValueEditText.text forKey:@"newPassWord"];
    
    
    CstmMsg *_cstmMsg=[CstmMsg sharedInstance ];
    SysBaseInfo *_sysBaseInfo=[SysBaseInfo sharedInstance];
    
    StampTranCall *stampTranCall=[StampTranCall sharedInstance ];
    
    [stampTranCall jyTranCall:_sysBaseInfo cstmMsg:_cstmMsg formName:n0005 business:businessparam delegate:self viewController:self];
 }



-(void) ReturnError:(MsgReturn*)msgReturn
{
}

-(void) ReturnData:(MsgReturn*)msgReturn
{
    
    //NSMutableArray *listData=[[NSMutableArray alloc]init];
    /*手机验证码发送0053*/
    if ([msgReturn.formName isEqualToString:nn0053]){
        NSDictionary *returnData=[msgReturn.map objectForKey:@"returnData"];
        NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
        NSString *respDesc=[returnHead objectForKey:@"respDesc"];
        NSString *respCode=[returnHead objectForKey:@"respCode"];
        NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
        RespondParam0053 *commonItem=[[RespondParam0053 alloc]init];
    }
    
    
    /*找回密码 0005*/
    if ([msgReturn.formName isEqualToString:n0005]){
    NSDictionary *returnData=[msgReturn.map objectForKey:@"returnData"];
    NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
    NSString *respDesc=[returnHead objectForKey:@"respDesc"];
    NSString *respCode=[returnHead objectForKey:@"respCode"];
    NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
    RespondParam0005 *commonItem=[[RespondParam0005 alloc]init];
        
        [self.view makeToast:@"找回密码成功"];
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }

    

}

@end



//NSMutableArray *listData=[[NSMutableArray alloc]init];



