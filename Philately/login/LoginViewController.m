


#import "LoginViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
#import "StampTranCall.h"
#import "SliderViewController.h"
#import "PromptError.h"
#import "SysBaseInfo.h"
#import "RespondParam0004.h"
#import "RespondParam0008.h"
#import "RegistViewController.h"
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
    codeValueEditText.delegate=self;
    
    
    UITapGestureRecognizer *rigistButtonTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rigistButtonHandTap)];
    [rigistButton addGestureRecognizer:rigistButtonTap];
    
    
}

-(void)backImageViewHandTap
{
[self dismissViewControllerAnimated:NO completion:^(){}];
    [self.navigationController popoverPresentationController];
}

-(void)loginButtonHandTap
{
    [self request0004 ];
 
}

-(void)rigistButtonHandTap
{//注册
    RegistViewController *registViewController=[[RegistViewController alloc]initWithNibName:@"RegistViewController" bundle:nil];
    
   [self presentViewController:registViewController animated:YES completion:^{
       
   }];
   
}

-(void) viewWillAppear:(BOOL)animated{
}


-(void) setUiValue{

}


/*会员登录0004*/
NSString  *n0004=@"JY0004";
/*会员登录0004*/
-(void) request0004{
    
    NSString *userName= [userNameValueEditText text];
    if(userName==nil ||[userName isEqualToString:@""])
    {
        [PromptError toast:@"请输入用户名"];
        return;
    }
    
    NSString *pwd= [pwdValueEditText text];
    if(pwd==nil ||[pwd isEqualToString:@""])
    {
            [PromptError toast:@"请输入密码"];
        return;
    }
    
    NSString *code= [codeValueEditText text];
    if(code==nil ||[code isEqualToString:@""])
    {
         [PromptError toast:@"请输入验证码"];
        return;
    }else if(![code isEqualToString:validateCode ])
               {
                   [PromptError toast:@"验证码错误,请重新输入"];
                   [codeValueEditText setText:@""];
                   [self onTapToGenerateCode ];
                   return;
               }
    
    NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
    /* 登录号 备注:必填*/
    [businessparam setValue:userName forKey:@"loginNo"];
    /* 密码 备注:必填*/
    [businessparam setValue:pwd forKey:@"passWord"];
   
    
    
    CstmMsg *_cstmMsg=[CstmMsg sharedInstance ];
    SysBaseInfo *_sysBaseInfo=[SysBaseInfo sharedInstance];
    
    StampTranCall *stampTranCall=[StampTranCall sharedInstance ];
    
    [stampTranCall jyTranCall:_sysBaseInfo cstmMsg:_cstmMsg formName:n0004 business:businessparam delegate:self ];
    
    
}



StampTranCall *stampTranCall;
/*会员资料标准查询0008*/
NSString  *n0008=@"JY0008";
/*会员资料标准查询0008*/
-(void) request0008{
      CstmMsg *_cstmMsg=[CstmMsg sharedInstance ];
    
    NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
    /* 会员编号 备注:必填*/
    [businessparam setValue:_cstmMsg.cstmNo forKey:@"cstmNo"];
    /* 手机号码 备注:必填*/
    [businessparam setValue:@"" forKey:@"mobileNo"];
    //[serviceInvoker callWebservice:businessparam formName:n0008 ];
    
 
    SysBaseInfo *_sysBaseInfo=[SysBaseInfo sharedInstance];
    
    StampTranCall *stampTranCall=[StampTranCall sharedInstance ];
    
    [stampTranCall jyTranCall:_sysBaseInfo cstmMsg:_cstmMsg formName:n0008 business:businessparam delegate:self ];
    
}


-(void) ReturnData:(MsgReturn*)msgReturn
{
    NSMutableArray *listData=[[NSMutableArray alloc]init];
    /*会员登录0004*/
    if ([msgReturn.formName isEqualToString:n0004]){
        
        NSDictionary *returnData=[msgReturn.map objectForKey:@"returnData"];
        NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
        NSString *respDesc=[returnHead objectForKey:@"respDesc"];
        NSString *respCode=[returnHead objectForKey:@"respCode"];
        NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
        
        RespondParam0004 *commonItem=[[RespondParam0004 alloc]init];
        /* 会员编号 备注:*/
        commonItem.cstmNo=[returnBody objectForKey:@"cstmNo"];
        /* 用户名 备注:*/
        commonItem.userName=[returnBody objectForKey:@"userName"];
        CstmMsg *cstmMsg=[CstmMsg sharedInstance];
        cstmMsg.cstmNo= commonItem.cstmNo;
        cstmMsg.cstmName=commonItem.userName;
        if(commonItem.cstmNo!=nil)
        [self request0008 ];
        
        
    }
 
    /*会员资料标准查询0008*/
    if ([msgReturn.formName isEqualToString:n0008]){
        if(msgReturn.map==nil)
        return;
        
        NSLog(@"0008 %lu",(unsigned long)[msgReturn.map count]);
        NSDictionary *returnData=[msgReturn.map objectForKey:@"returnData"];
        NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
        NSString *respDesc=[returnHead objectForKey:@"respDesc"];
        NSString *respCode=[returnHead objectForKey:@"respCode"];
        NSDictionary *returnDataBody=[returnData objectForKey:@"returnBody"];
        
        CstmMsg *cst=[CstmMsg sharedInstance];
        RespondParam0008 *commonItem=[[RespondParam0008 alloc]init];
        /* 用户头像图片ID 备注:用户头像URL地址*/
        commonItem.userPicID=[returnDataBody objectForKey:@"userPicID"];
        cst.userPicID=commonItem.userPicID;
        /* 用户名 备注:*/
        commonItem.userName=[returnDataBody objectForKey:@"userName"];
          cst.userName=commonItem.userName;
        /* 手机号码 备注:注册手机号码*/
        commonItem.mobileNo=[returnDataBody objectForKey:@"mobileNo"];
         cst.mobileNo=commonItem.mobileNo;
        /* 性别 备注:0：男
         1：女*/
        commonItem.userSex=[returnDataBody objectForKey:@"userSex"];
         cst.userSex=commonItem.userSex;
        /* 邮箱 备注:*/
        commonItem.email=[returnDataBody objectForKey:@"email"];
         cst.email=commonItem.email;
        /* 会员积分 备注:*/
        commonItem.cstmScore=[returnDataBody objectForKey:@"cstmScore"];
        cst.cstmScore=[NSString stringWithFormat:@"%d",commonItem.cstmScore];
        /* 是否历史集邮统版会员 备注:0：是
         1：否*/
        commonItem.isStampMember=[returnDataBody objectForKey:@"isStampMember"];
         cst.isStampMember=commonItem.isStampMember;
        /* 是否实名认证 备注:0：是
         1：否*/
        commonItem.isAutonym=[returnDataBody objectForKey:@"isAutonym"];
         cst.isAutonym=commonItem.isAutonym;
        /* 姓名 备注:未经过实名验证的会员这几项为空*/
        commonItem.cstmName=[returnDataBody objectForKey:@"cstmName"];
         cst.cstmName=commonItem.cstmName;
        /* 身份证号码 备注:*/
        commonItem.certNo=[returnDataBody objectForKey:@"certNo"];
         cst.certNo=commonItem.certNo;
        /* 认证手机号码 备注:*/
        commonItem.verifiMobileNo=[returnDataBody objectForKey:@"verifiMobileNo"];
         cst.verifiMobileNo=commonItem.verifiMobileNo;
        /* 省份代号 备注:2015/6/17 增加*/
        commonItem.provCode=[returnDataBody objectForKey:@"provCode"];
       
        /* 市代号 备注:2015/6/17增加*/
        commonItem.cityCode=[returnDataBody objectForKey:@"cityCode"];
      
        /* 县代号 备注:2015/6/17增加*/
        commonItem.countCode=[returnDataBody objectForKey:@"countCode"];
      
        /* 详细地址 备注:2015/6/17增加*/
        commonItem.detailAddress=[returnDataBody objectForKey:@"detailAddress"];
        /* 邮编 备注:2015/6/17增加*/
        commonItem.postCode=[returnDataBody objectForKey:@"postCode"];
        /* 营业员联系方式（营业员编号） 备注:2015/6/17 增加*/
        commonItem.brchMobNum=[returnDataBody objectForKey:@"brchMobNum"];
        /* 新邮自提机构代码 备注:2015/6/17增加*/
        commonItem.sinceBrchNo=[returnDataBody objectForKey:@"sinceBrchNo"];
        /* 零售自提机构代码 备注:2015/6/17增加*/
        commonItem.saleBrchNo=[returnDataBody objectForKey:@"saleBrchNo"];
        /* 关联终端数量 备注:循环域开始*/
        commonItem.termNum=[returnDataBody objectForKey:@"termNum"];
        /* 关联终端类型 备注:01：adnroid
         02：ios
         03：微信*/
        commonItem.termType=[returnDataBody objectForKey:@"termType"];
        /* 关联终端编号 备注:微信类型的终端编号为Openid*/
        commonItem.termNo=[returnDataBody objectForKey:@"termNo"];
        /* 关联终端数量 备注:循环域结束*/
        commonItem.termNum=[returnDataBody objectForKey:@"termNum"];
        
        [PromptError toast:@"登陆成功"];
       [self dismissViewControllerAnimated:NO completion:^(){}];
    }

    
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
   
    
}



- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"begin");
    [self onTapToGenerateCode ];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"end");
    return YES;
}




@end







