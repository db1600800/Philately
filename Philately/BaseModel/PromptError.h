//
//  DealError.h
//  Philately
//
//  Created by gdpost on 15/6/25.
//  Copyright (c) 2015年 gdpost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface PromptError : NSObject

+(void) prompt;
+(void) toast:(NSString*)errorCode errorMSg:(NSString*)errorMsg;
@end
