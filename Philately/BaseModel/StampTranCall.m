//
//  StampTranCall.m
//  Philately
//
//  Created by gdpost on 15/6/17.
//  Copyright (c) 2015年 gdpost. All rights reserved.
//

#import "StampTranCall.h"
#import "SysBaseInfo.h"
#import <PublicFramework/OperatorMsg.h>
#import <SVProgressHUD/SVProgressHUD.h>
@implementation StampTranCall

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)jyTranCall:(SysBaseInfo *) sysBaseInfo  cstmMsg:(CstmMsg*)cstmMsg formName:(NSString*)formName business:(NSDictionary*)business delegate:(id<StampTranCallDelegate>)delegate
{
    self.delegate=delegate;
    
    [SVProgressHUD show];
    
    NSMutableDictionary *tranBodyDic=[[NSMutableDictionary alloc] init];
    tranBodyDic=business;
    
     NSMutableDictionary *tranheadDic=[[NSMutableDictionary alloc] init];
     [tranheadDic setValue:@"" forKey:@"tranNo"];
     [tranheadDic setValue:@"16" forKey:@"channelNo"];
     [tranheadDic setValue:@"02" forKey:@"termType"];
     [tranheadDic setValue:@"" forKey:@"termNo"];
     [tranheadDic setValue:@"" forKey:@"IP"];
     [tranheadDic setValue:@"" forKey:@"tranNum"];
     [tranheadDic setValue:@"" forKey:@"memeberNo"];
     [tranheadDic setValue:tranBodyDic forKey:@"tranBody"];
    
    NSMutableDictionary *sendDataDic=[[NSMutableDictionary alloc] init];
    [sendDataDic setValue:tranheadDic forKey:@"tranhead"];
    
    NSMutableDictionary *fullDic=[[NSMutableDictionary alloc] init];
    [fullDic setValue:sendDataDic forKey:@"sendData"];
    
    
    
    //调试用 发起快递单查询交易
    NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
    [businessparam setValue:@"1055408098614" forKey:@"D4496_MAIL_NO"];
    [businessparam setValue:@"1" forKey:@"D44_70_MODE_SEARCH"];
    [businessparam setValue:@"1" forKey:@"D4496_MAIL_SEARCH_CHANNEL"];
    
    OperatorMsg *operatorMsg=[[OperatorMsg alloc ] init ];
    operatorMsg.oprId=@"XU01";
    operatorMsg.organId=@"51000601";
    operatorMsg.channelId=@"06";
    
    
    NSString *ChannelNo =operatorMsg.channelId;//@"06";//@"A-CHANNEL_NO";
    NSString *ChannelTrace = @"11";//@"A-CHANNEL_TRACE_IOS";
    
    NSString *H_tty_String = [[NSString alloc]init];
    NSString*ttyflag =@"0";// @"A-TTY_FLAG";
    if ([ttyflag isEqualToString:@""]||ttyflag == nil) {
        H_tty_String = @"999999999999999";
    }else{
        if ([ttyflag isEqualToString:@"0"]) {
            H_tty_String = @"999999999999999";
        }else{
            
            H_tty_String = @"999999999999999";
            
        }
        
    }
    
    NSString *organ                    =operatorMsg.organId;// @"51000601";//@"organ";
    NSString *operationId              = operatorMsg.oprId;//@"XU01";//@"operationId";
    
    
    NSMutableDictionary *headDic = [[NSMutableDictionary alloc]init];
    [headDic setValue:@"0000000" forKey:@"H_BRCH_NO"];
    [headDic setValue:@"00" forKey:@"H_OPER_NO"];
    [headDic setValue:ChannelTrace forKey:@"H_SEQ_NO"];
    [headDic setValue:@"127.0.0.1" forKey:@"H_IP_ADDR"];
    [headDic setValue:H_tty_String forKey:@"H_TTY"];
    [headDic setValue:@"" forKey:@"H_AUTH_OPER_NO"];
    [headDic setValue:ChannelTrace forKey:@"H_CHANNEL_TRACE"];
    [headDic setValue:ChannelNo forKey:@"H_CHANNEL_NO"];
    [headDic setValue:organ forKey:@"H_BRCH_NO_NEW"];
    [headDic setValue:operationId forKey:@"H_OPER_NO_NEW"];
    [headDic setValue:@"0000" forKey:@"H_SFILE_NUM"];
    
    [businessparam setObject:headDic forKey:@"SNDMSG_HEAD"];
    
    
    
    serviceInvoker=[[ServiceInvoker alloc]init];
    [serviceInvoker  setDelegate:self];

    
    [serviceInvoker callWebservice:businessparam formName:@"4496030" ];

}



//业务请求返回错误
-(void)serviceInvokerError:(MsgReturn*)msgReturn
{
    [SVProgressHUD dismiss];
    
    //签到失败
    if([msgReturn.formName isEqualToString:@"appSignIn"]  && [msgReturn.errorCode isEqualToString:ERROR_SINGIN_ERROR])
    {
        
    }else if(msgReturn.formName!=nil && [msgReturn.errorCode isEqualToString:ERROR_FAILED])
    {//交易失败
        
        
    }
    else  if([msgReturn.formName isEqualToString:@"checkUpdates"]  && [msgReturn.errorCode isEqualToString:ERROR_SERVICE_IN_ERROR] )
    {
        //appver超了
        
    }
    
    else
    {
        //网络错误 服务器错误  传输格式错误
        if([msgReturn.errorCode isEqualToString:ERROR_DATA_FORMAT_ERROR] || [msgReturn.errorCode isEqualToString:ERROR_SERVICE_IN_ERROR] || [msgReturn.errorCode isEqualToString:ERROR_NOT_NET])
            
        {
            
            
        }
    }
    
    NSLog(@"%@ %@",msgReturn.formName,msgReturn.errorDesc);
    
}

//业务请求返回数据
-(void)serviceInvokerReturnData:(MsgReturn*)msgReturn
{
    [SVProgressHUD dismiss];
    
    bool ischeckok=false;
    //签到成功
    if([msgReturn.errorCode isEqualToString:ERROR_SUCCESS] && [msgReturn.formName isEqualToString:@"appSignIn"])
    {
        
        NSLog(@"%@",@"签到成功");
       // [zhuangTextView setText:@"签到成功"];
        ischeckok=true;
        
        
        //  [serviceInvoker checkUpdates];
        
    }
    else if([msgReturn.errorCode isEqualToString:ERROR_SUCCESS] && [msgReturn.formName isEqualToString:@"checkUpdates"])
    {
        //配置文件更新成功
        
        NSLog(@"%@",@"版本检测成功");
        
    }
    
    
    else if([msgReturn.errorCode isEqualToString:ERROR_SUCCESS])
    {//callWebservice成功
        
        
        NSMutableDictionary* map=msgReturn.map;
   
        
        NSMutableDictionary *returnDataDic=[map objectForKey:@"returnData"];
        NSMutableDictionary *returnHeadDic=[returnDataDic objectForKey:@"returnHead"];
        NSString *respCode=[returnHeadDic objectForKey:@"respCode"];
        NSString *respDesc=[returnHeadDic objectForKey:@"respDesc"];
        
        NSMutableDictionary *returnBodyDic=[returnDataDic objectForKey:@"returnBody"];
    
     
        [self.delegate ReturnData:msgReturn];
        
        
    }
    
}


@end
