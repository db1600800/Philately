//
//  StampTranCall.h
//  Philately
//
//  Created by gdpost on 15/6/17.
//  Copyright (c) 2015年 gdpost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CstmMsg.h"
#import "SysBaseInfo.h"
#import <PublicFramework/ServiceInvoker.h>

@protocol StampTranCallDelegate;

@interface StampTranCall : NSObject<ServiceInvokerDelegate>
{

}
+ (StampTranCall *) sharedInstance;

@property (strong, nonatomic) id<StampTranCallDelegate>  delegate;

-(void)jyTranCall:(SysBaseInfo *) sysBaseInfo  cstmMsg:(CstmMsg*)cstmMsg  formName:(NSString*)formName business:(NSDictionary*)business delegate:(id<StampTranCallDelegate>)delegate;

@end



@protocol StampTranCallDelegate<NSObject>

@required

//业务请求返回数据
-(void) ReturnData:(MsgReturn*)msgReturn;

@end