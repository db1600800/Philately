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
#import "SVProgressHUD.h"
#import "PromptError.h"
#import <PublicFramework/JSONKit.h> 

 

@implementation StampTranCall


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)jyTranCall:(SysBaseInfo *) sysBaseInfo  cstmMsg:(CstmMsg*)cstmMsg formName:(NSString*)formName business:(NSDictionary*)business delegate:(id<StampTranCallDelegate>)delegate viewController:(UIViewController*)viewController
{
    

    self.viewController=viewController;
    self.delegate=delegate;
    
    [SVProgressHUD show];
    
    NSMutableDictionary *tranBodyDic=[[NSMutableDictionary alloc] init];
    tranBodyDic=business;
    
     NSMutableDictionary *tranheadDic=[[NSMutableDictionary alloc] init];
     [tranheadDic setValue:formName forKey:@"tranNo"];
     [tranheadDic setValue:sysBaseInfo.channelNo forKey:@"channelNo"];
     [tranheadDic setValue:sysBaseInfo.curTermType forKey:@"termType"];
     [tranheadDic setValue:sysBaseInfo.curTermNo forKey:@"termNo"];
     [tranheadDic setValue:sysBaseInfo.IP forKey:@"IP"];
     [tranheadDic setValue:sysBaseInfo.tranNum forKey:@"tranNum"];
     [tranheadDic setValue:cstmMsg.cstmNo forKey:@"memeberNo"];
     [tranheadDic setValue:tranBodyDic forKey:@"tranBody"];
    
    NSMutableDictionary *sendDataDic=[[NSMutableDictionary alloc] init];
    [sendDataDic setValue:tranheadDic forKey:@"tranhead"];
    
    NSMutableDictionary *fullDic=[[NSMutableDictionary alloc] init];
    [fullDic setValue:sendDataDic forKey:@"sendData"];
    
    
    
    
    
   ServiceInvoker *serviceInvoker=[ServiceInvoker sharedInstance];
    [serviceInvoker  setDelegate:self];

     NSLog(@"hobby request %@ %@",formName,fullDic);
    [serviceInvoker callWebservice:fullDic formName:formName ];

}



//业务请求返回错误
-(void)serviceInvokerError:(MsgReturn*)msgReturn
{
    [SVProgressHUD dismiss];
    
   if(msgReturn.formName!=nil && [msgReturn.errorCode isEqualToString:ERROR_FAILED])
    {//交易失败
        
        
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
    
  

    
    if([msgReturn.errorCode isEqualToString:ERROR_SUCCESS])
    {//callWebservice成功
        
        
        NSMutableDictionary* map=msgReturn.map;
        NSString *businessParamString=[map objectForKey:@"businessParam"];
        NSDictionary *businessParamDic=[businessParamString objectFromJSONString];
        NSString *data=[businessParamDic objectForKey:@"data"];
        msgReturn.map=[data objectFromJSONString];
        NSMutableDictionary *returnDataDic=[[data objectFromJSONString] objectForKey:@"returnData"];
        NSMutableDictionary *returnHeadDic=[returnDataDic objectForKey:@"returnHead"];
        NSString *respCode=[returnHeadDic objectForKey:@"respCode"];
        NSString *respDesc=[returnHeadDic objectForKey:@"respDesc"];
        
        NSMutableDictionary *returnBodyDic=[returnDataDic objectForKey:@"returnBody"];
    
     
        [self.delegate ReturnData:msgReturn];
        
        
    }else{//错误码 非0000
    
        [PromptError changeShowErrorMsg:msgReturn title:nil viewController:self.viewController];
    }
    
}



//实现一个创建单例对象的类方法

static StampTranCall *objName = nil;

+ (StampTranCall *) sharedInstance{
    static dispatch_once_t oneToken = 0;
    dispatch_once(&oneToken, ^{
        objName = [[super allocWithZone: NULL] init];
    });
    return objName;
}

//重写几个方法，防止创建单例对象时出现错误
-(id) init{
    if(self = [super init])
    {
        //初始化单例对象的各种属性
    }
    return self;
}

+(id)allocWithZone: (struct _NSZone *) zone{
    return [self sharedInstance];
}

//这是单例对象遵循<NSCopying>协议时需要实现的方法
-(id) copyWithZone: (struct _NSZone *)zone{
    return self;
}



@end
