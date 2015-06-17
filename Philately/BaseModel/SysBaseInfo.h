//
//  SysBaseInfo.h
//  Philately
//
//  Created by gdpost on 15/6/17.
//  Copyright (c) 2015年 gdpost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TermTypeInfo.h"
@interface SysBaseInfo : UIView

@property (strong, nonatomic)  NSString *appID;
@property (strong, nonatomic)  NSString *appVersion;
@property (strong, nonatomic)  NSString *appConfigVersion;
@property (strong, nonatomic) TermTypeInfo *curTermType;
@property (strong, nonatomic) NSString  *curTermNo;
@property (strong, nonatomic) NSString  *channelNo;
@property (strong, nonatomic) NSString  *IP;
@property (strong, nonatomic) NSString  *tranNum;

@end
