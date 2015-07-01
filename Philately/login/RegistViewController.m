


#import "RegistViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
#import <PublicFramework/MsgReturn.h> 
#import "RespondParam0003.h"
#import "RespondParam0008.h"
#import "RespondParam0053.h"
#import "PromptError.h"
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
    
  
    
 
    [self.userNameValueEditText addTarget:self action:@selector(userNameValueEditTextDidEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    phoneValueEditText.userInteractionEnabled=NO;
    codeValueEditText.userInteractionEnabled=NO;
    pwdValueEditText.userInteractionEnabled=NO;
    pwd2TitleTextView.userInteractionEnabled=NO;
    
 
}



-(void)userNameValueEditTextDidEndOnExit:(UITextField *)textField{
    [phoneValueEditText becomeFirstResponder];//把焦点给别人 键盘消失
    [self request0001];
    
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
        //[PromptError toast:@"请输入用户名"];
        return ;
    }
    
    NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
    /* 用户名 备注:必填*/
    [businessparam setValue:userNameValueEditText.text forKey:@"userName"];
    
    CstmMsg *_cstmMsg=[CstmMsg sharedInstance ];
    SysBaseInfo *_sysBaseInfo=[SysBaseInfo sharedInstance];
    
    StampTranCall *stampTranCall=[StampTranCall sharedInstance ];
    
    [stampTranCall jyTranCall:_sysBaseInfo cstmMsg:_cstmMsg formName:n0001 business:businessparam delegate:self ];

    
}




/*手机号码唯一校验0002*/
NSString  *n0002=@"JY0002";
/*手机号码唯一校验0002*/
-(void) request0002{
    NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
    /* 手机号码 备注:必填*/
    [businessparam setValue:@"" forKey:@"mobileNo"];
    
    CstmMsg *_cstmMsg=[CstmMsg sharedInstance ];
    SysBaseInfo *_sysBaseInfo=[SysBaseInfo sharedInstance];
    
    StampTranCall *stampTranCall=[StampTranCall sharedInstance ];
    
    [stampTranCall jyTranCall:_sysBaseInfo cstmMsg:_cstmMsg formName:n0002 business:businessparam delegate:self ];

    }




/*用户注册0003*/
NSString  *n0003=@"JY0003";
/*用户注册0003*/
-(void) request0003{
    NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
    /* 用户名 备注:必填*/
    [businessparam setValue:@"" forKey:@"userName"];
    /* 手机号码 备注:必填*/
    [businessparam setValue:@"" forKey:@"mobileNo"];
    /* 密码 备注:必填*/
    [businessparam setValue:@"" forKey:@"passWord"];
    /* 手机验证码 备注:必填*/
    [businessparam setValue:@"" forKey:@"verificationCode"];
   
    CstmMsg *_cstmMsg=[CstmMsg sharedInstance ];
    SysBaseInfo *_sysBaseInfo=[SysBaseInfo sharedInstance];
    
    StampTranCall *stampTranCall=[StampTranCall sharedInstance ];
    
    [stampTranCall jyTranCall:_sysBaseInfo cstmMsg:_cstmMsg formName:n0003 business:businessparam delegate:self ];
}




/*手机验证码发送0053*/
NSString  *n0053=@"JY0053";
/*手机验证码发送0053*/
-(void) request0053{
    NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
    /* 手机号码 备注:必填*/
    [businessparam setValue:@"" forKey:@"mobileNo"];
    
    CstmMsg *_cstmMsg=[CstmMsg sharedInstance ];
    SysBaseInfo *_sysBaseInfo=[SysBaseInfo sharedInstance];
    
    StampTranCall *stampTranCall=[StampTranCall sharedInstance ];
    
    [stampTranCall jyTranCall:_sysBaseInfo cstmMsg:_cstmMsg formName:n0053 business:businessparam delegate:self ];
}




/*会员资料标准查询0008*/
NSString  *nn0008=@"JY0008";
/*会员资料标准查询0008*/
-(void) request0008{
    NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
    /* 会员编号 备注:必填*/
    [businessparam setValue:@"" forKey:@"cstmNo"];
    /* 手机号码 备注:必填*/
    [businessparam setValue:@"" forKey:@"mobileNo"];
    CstmMsg *_cstmMsg=[CstmMsg sharedInstance ];
    SysBaseInfo *_sysBaseInfo=[SysBaseInfo sharedInstance];
    
    StampTranCall *stampTranCall=[StampTranCall sharedInstance ];
    
    [stampTranCall jyTranCall:_sysBaseInfo cstmMsg:_cstmMsg formName:nn0008 business:businessparam delegate:self ];
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
        
        [PromptError toast:@"用户名校验成功，请输入手机号"];
        phoneValueEditText.userInteractionEnabled=YES;
        //RespondParam0001 *commonItem=[[RespondParam0001 alloc]init];
    }
    
    
    
    
    //NSMutableArray *listData=[[NSMutableArray alloc]init];
    /*手机号码唯一校验0002*/
    if ([msgReturn.formName isEqualToString:n0002]){
        NSDictionary *returnData=[msgReturn.map objectForKey:@"returnData"];
        NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
        NSString *respDesc=[returnHead objectForKey:@"respDesc"];
        NSString *respCode=[returnHead objectForKey:@"respCode"];
        NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
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
    
    
    
    
   // NSMutableArray *listData=[[NSMutableArray alloc]init];
    /*会员资料标准查询0008*/
    if ([msgReturn.formName isEqualToString:nn0008]){
        NSDictionary *returnData=[msgReturn.map objectForKey:@"returnData"];
        NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
        NSString *respDesc=[returnHead objectForKey:@"respDesc"];
        NSString *respCode=[returnHead objectForKey:@"respCode"];
        NSDictionary *returnDataBody=[returnData objectForKey:@"returnBody"];
        RespondParam0008 *commonItem=[[RespondParam0008 alloc]init];
        /* 用户头像图片ID 备注:用户头像URL地址*/
        commonItem.userPicID=[returnDataBody objectForKey:@"userPicID"];
        /* 用户名 备注:*/
        commonItem.userName=[returnDataBody objectForKey:@"userName"];
        /* 手机号码 备注:注册手机号码*/
        commonItem.mobileNo=[returnDataBody objectForKey:@"mobileNo"];
        /* 性别 备注:0：男
         1：女*/
        commonItem.userSex=[returnDataBody objectForKey:@"userSex"];
        /* 邮箱 备注:*/
        commonItem.email=[returnDataBody objectForKey:@"email"];
        /* 会员积分 备注:*/
        commonItem.cstmScore=[returnDataBody objectForKey:@"cstmScore"];
        /* 是否历史集邮统版会员 备注:0：是
         1：否*/
        commonItem.isStampMember=[returnDataBody objectForKey:@"isStampMember"];
        /* 是否实名认证 备注:0：是
         1：否*/
        commonItem.isAutonym=[returnDataBody objectForKey:@"isAutonym"];
        /* 姓名 备注:未经过实名验证的会员这几项为空*/
        commonItem.cstmName=[returnDataBody objectForKey:@"cstmName"];
        /* 身份证号码 备注:*/
        commonItem.certNo=[returnDataBody objectForKey:@"certNo"];
        /* 认证手机号码 备注:*/
        commonItem.verifiMobileNo=[returnDataBody objectForKey:@"verifiMobileNo"];
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
    }

}

@end






