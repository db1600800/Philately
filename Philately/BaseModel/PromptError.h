//
//  DealError.h
//  Philately
//
//  Created by gdpost on 15/6/25.
//  Copyright (c) 2015年 gdpost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <PublicFramework/MsgReturn.h>
@interface PromptError : NSObject<UIAlertViewDelegate>

+(void) changeShowErrorMsg:(MsgReturn*)errorMsg title:(NSString*)title;
+(void) toast:(NSString*)errorMsg;
+ (PromptError *) sharedInstance;
@end
