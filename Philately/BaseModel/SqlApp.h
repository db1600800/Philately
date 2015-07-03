//
//  Sql.h
//  Philately
//
//  Created by gdpost on 15/6/25.
//  Copyright (c) 2015年 gdpost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "ErrorObject.h"
@interface SqlApp : NSObject
{

 sqlite3 *db;
}

-(BOOL) openDB;
-(ErrorObject*) selectPM_CODEERRORMSG:(NSString*) code;
-(ErrorObject*) selectPM_DESCERRORMSG:(NSString*) code;
@end

@interface rowApp : NSObject


@property (strong, nonatomic) NSString  * SERVICEID;
@property (strong, nonatomic) NSString  *SERVICEKEY;
@property (strong, nonatomic) NSString  *SERVICECODE;
@property (strong, nonatomic) NSString  *SERVICENAME;
@property (strong, nonatomic) NSString  *SERVICENAME_BACKUP1;
@property (strong, nonatomic) NSString  *SERVICENAME_BACKUP2;
@property (strong, nonatomic) NSString  *SERVICENAME_BACKUP3;

@property (strong, nonatomic) NSString  *ERRORCODE;
@property (strong, nonatomic) NSString *ERRORDESC;
@property (strong, nonatomic) NSString *ERRORTYPE;



@property (strong, nonatomic) NSString * CHANGEDESC;
@end

