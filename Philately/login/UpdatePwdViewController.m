//注入网络请求,响应,等待提示



#import "UpdatePwdViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
#import "Toast+UIView.h"
@implementation UpdatePwdViewController
//确定
@synthesize okButton;
//back
@synthesize backImageView;
//修改密码
@synthesize titleTextView;
//旧密码
@synthesize oldPwdTitleTextView;
//请输入旧密码
@synthesize oldPwdValueEditText;
//新密码
@synthesize pwd;
//请输入新密码

//确认密码
@synthesize pwd2;
//请再输入新密码

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *back = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    [self.backImageView addGestureRecognizer:back];
    
    UITapGestureRecognizer *okButtonTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(okButtonSel)];
    [self.okButton addGestureRecognizer:okButtonTap];
    
    
    
    [self.oldPwdValueEditText addTarget:self action:@selector(oldPwdValueEditTexttDidEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.pwd addTarget:self action:@selector(pwdDidEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.pwd2 addTarget:self action:@selector(pwd2DidEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    pwd.userInteractionEnabled=NO;
    pwd2.userInteractionEnabled=NO;
    okButton.userInteractionEnabled=NO;
}

-(void) viewWillAppear:(BOOL)animated{
    
    

}


-(void)oldPwdValueEditTexttDidEndOnExit:(UITextField *)textField{
    int count=[textField.text length];
    if(count!=6)
    {
        [self.view makeToast:@"请输入6位密码"];
        
    }
    else
    {
        pwd.userInteractionEnabled=YES;
    [pwd becomeFirstResponder];//把焦点给别人 键盘消失
        }
 
}

-(void)pwdDidEndOnExit:(UITextField *)textField{
    int count=[textField.text length];
    if(count!=6)
    {
        [self.view makeToast:@"请输入6位密码"];
        
    }
    else
    {
         pwd2.userInteractionEnabled=YES;
    [pwd2 becomeFirstResponder];//把焦点给别人 键盘消失
       }
    
}

-(void)pwd2DidEndOnExit:(UITextField *)textField{
    
    int count=[textField.text length];
    if(count!=6)
    {
        [self.view makeToast:@"请输入6位密码"];
        
    }else if(![pwd2.text isEqualToString:pwd.text])
    {
        [self.view makeToast:@"两次密码输入不一致"];
    }
    else
    {
    [okButton becomeFirstResponder];//把焦点给别人 键盘消失
    okButton.userInteractionEnabled=YES;
    }
    
}


-(void)okButtonSel
{
    [self request0006];
    
}
-(void)back
{
    [self dismissViewControllerAnimated:NO completion:^(){
        
        //关掉注册controller
        
       // [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CLOSE_B object:nil userInfo:nil];
        
    }];
    
   // 有A到B再到C，我现在再C页面返回的时候我想直接跳转到A页面 应该怎么做呢？
//    
//    在B中添加监视通知
//    
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(close) name:NOTIFICATION_CLOSE_B object:nil];
//    
//    
//    -(void) close{
//        
//        [self dismissViewControllerAnimated:YES completion:nil];
//        
//    }

}


-(void) setUiValue{
}






/*修改登录密码0006*/
NSString  *n0006=@"0006";
/*修改登录密码0006*/
-(void) request0006{


    
    
   
    
    if(oldPwdValueEditText.text==nil || [oldPwdValueEditText.text isEqualToString:@""])
    {
        [self.view makeToast:@"请输入旧密码"];
        return;
    }
    if(pwd.text==nil || [pwd.text isEqualToString:@""])
    {
        [self.view makeToast:@"请输入新密码"];
        return;
    }
    if(pwd2.text==nil || [pwd2.text isEqualToString:@""])
    {
        [self.view makeToast:@"请确认新密码"];
        return;
    }
    

    
    if(![pwd.text isEqualToString:pwd2.text])
    {
        [self.view makeToast:@"两次新密码输入不一致"];
        return;
    }
    
    CstmMsg *cst=[CstmMsg sharedInstance];
    NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
    /* 会员编号 备注:必填*/
    [businessparam setValue:cst.cstmNo forKey:@"cstmNo"];
    /* 旧密码 备注:必填*/
    [businessparam setValue:oldPwdValueEditText.text forKey:@"oldPassWord"];
    /* 新密码 备注:必填*/
    [businessparam setValue:pwd.text forKey:@"newPassWord"];
    
    

    
    CstmMsg *_cstmMsg=[CstmMsg sharedInstance ];
    SysBaseInfo *_sysBaseInfo=[SysBaseInfo sharedInstance];
    
    StampTranCall *stampTranCall=[StampTranCall sharedInstance ];
    
    [stampTranCall jyTranCall:_sysBaseInfo cstmMsg:_cstmMsg formName:n0006 business:businessparam delegate:self viewController:self];
}



-(void) ReturnError:(MsgReturn*)msgReturn
{
}

-(void) ReturnData:(MsgReturn*)msgReturn
{
    
    /*修改登录密码0006*/
    if ([msgReturn.formName isEqualToString:n0006]){
    NSDictionary *returnData=[msgReturn.map objectForKey:@"returnData"];
    NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
    NSString *respDesc=[returnHead objectForKey:@"respDesc"];
    NSString *respCode=[returnHead objectForKey:@"respCode"];
    NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
   // RespondParam0006 *commonItem=[[RespondParam0006alloc]init];
        [self.view makeToast:@"修改密码成功"];
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
    
    
    
    
    
}


@end



//NSMutableArray *listData=[[NSMutableArray alloc]init];




