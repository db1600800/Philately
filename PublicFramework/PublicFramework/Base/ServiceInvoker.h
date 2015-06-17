//
//  ServiceInvoker.h
//  PublicLibUI
//
//  Created by apple on 15/5/15.
//  Copyright (c) 2015年 gdpost. All rights reserved.
//

#ifndef PublicLibUI_ServiceInvoker_h
#define PublicLibUI_ServiceInvoker_h


#define IOS501 (TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED >= 50100)
#define IOS51 (TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED >= 51000)


#import "MsgReturn.h"
#import "ErrorMsg.h"
#import "OperatorMsg.h"

@protocol ServiceInvokerDelegate;

@interface ServiceInvoker : NSObject 
{
    
    int mMsgSeqNo ;// 报文流水号
    
}


@property (nonatomic,assign) id<ServiceInvokerDelegate> delegate;
@property (nonatomic,assign) NSString* formName;
@property (nonatomic,assign) NSString* callServiceFormName;
@property (nonatomic,assign) NSString* willDo;


@property (nonatomic,assign) NSString*sUpdateAction;
@property (nonatomic,assign) NSString*sUpdateStatus;
@property (nonatomic,assign) NSString*sConfigUpdateStatus;

-(void)appSignIn:(NSString*)appId appVersion:(NSString*)appVersion;
-(void) appSignIn;
-(void) callWebservice:(NSString*) requestStr  formName:(NSString*) formName;

-(void) checkUpdates;

-(void) clearService;
-(void) rsaPublicKey ;

@end



@protocol ServiceInvokerDelegate <NSObject>

@required

//业务请求返回错误
-(void)serviceInvokerError:(MsgReturn*)msgReturn;

//业务请求返回数据
-(void)serviceInvokerReturnData:(MsgReturn*)msgReturn;


@end

#endif
