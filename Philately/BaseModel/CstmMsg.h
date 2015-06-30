//
//  CstmMsg.h
//  Philately
//
//  Created by gdpost on 15/6/17.
//  Copyright (c) 2015年 gdpost. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TermTypeInfo.h"

@interface CstmMsg : NSObject

@property (strong, nonatomic) NSString  *cstmNo;
@property (strong, nonatomic) NSString  *userPicID;
@property (strong, nonatomic) NSString  *userPicUrl;
@property (strong, nonatomic) NSString  *userName;
@property (strong, nonatomic) NSString  *mobileNo;
@property (strong, nonatomic) NSString  *userSex;
@property (strong, nonatomic) NSString  *email;
@property (strong, nonatomic) NSString  *cstmScore;
@property (strong, nonatomic) NSString  *isStampMember;

@property (strong, nonatomic) NSString  *isAutonym;
@property (strong, nonatomic) NSString  *cstmName;
@property (strong, nonatomic) NSString  *certNo;
@property (strong, nonatomic) NSString  *verifiMobileNo;
@property (strong, nonatomic) TermTypeInfo  *termTypeInfo;

+ (CstmMsg *) sharedInstance;
-(void) clearCstmMsg;
@end
