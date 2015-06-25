//
//  Sql.m
//  Philately
//
//  Created by gdpost on 15/6/25.
//  Copyright (c) 2015年 gdpost. All rights reserved.
//

#import "Sql.h"
@implementation Sql



-(BOOL) openDB{
   
      NSString *database_path =[[NSBundle mainBundle] pathForResource:@"POST_JY" ofType:@"db"];
    //获取数据库路径
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documents = [paths objectAtIndex:0];
//    NSString *database_path = [documents stringByAppendingPathComponent:DBNAME];
    
    //如果数据库存在，则用sqlite3_open直接打开（不要担心，如果数据库不存在sqlite3_open会自动创建）
    //打开数据库，这里的[path UTF8String]是将NSString转换为C字符串，因为SQLite3是采用可移植的C(而不是
    //Objective-C)编写的，它不知道什么是NSString.
    if (sqlite3_open([database_path UTF8String], &db) == SQLITE_OK) {
        return YES;
    }else{
        return NO;
        NSLog(@"数据库打开失败");
        sqlite3_close(db);
    }
}



-(NSString*) selectCODESYSCHANGE:(NSString*) code{
    
//  0  "SERVICEID"  TEXT(100) NOT NULL,
//   1 "SERVICEKEY"  TEXT(100),             CODESYSCHANGE
//  2  "SERVICECODE"  TEXT(100),            WG1001
//   3 "SERVICENAME"  TEXT(300),            什么什么错误
//   4 "SERVICENAME_BACKUP1"  TEXT(300),
//   5 "SERVICENAME_BACKUP2"  TEXT(300),
//   6  "SERVICENAME_BACKUP3"  TEXT(300)
    
    [self openDB];
    NSString *sqlQuery = [NSString stringWithFormat:
                          @"SELECT * FROM %@ where SERVICEKEY='CODESYSCHANGE' and SERVICECODE='%@'",@"PM_SERVICE",code];
    sqlite3_stmt * statement;
    
    NSMutableArray *rows=[[NSMutableArray alloc] init ];
    NSString *servicename=@"";
    if (sqlite3_prepare_v2(db, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
        
        //查询结果集中一条一条的遍历所有的记录，这里的数字对应的是列值,注意这里的列值
       
        while (sqlite3_step(statement) == SQLITE_ROW) {
             row *r=[[row alloc] init ];
           
            
            char *SERVICEIDchar = (char*)sqlite3_column_text(statement, 0);
            NSString *SERVICEIDstring = [[NSString alloc]initWithUTF8String:SERVICEIDchar];
            r.SERVICEID=SERVICEIDstring;
            
            char *SERVICEKEYchar = (char*)sqlite3_column_text(statement, 1);
            NSString *SERVICEKEYstring = [[NSString alloc]initWithUTF8String:SERVICEKEYchar];
           r.SERVICEKEY=SERVICEKEYstring;
            
            char *SERVICECODEchar = (char*)sqlite3_column_text(statement, 2);
            NSString *SERVICECODEstring = [[NSString alloc]initWithUTF8String:SERVICECODEchar];
            r.SERVICECODE=SERVICECODEstring;
            
            char *SERVICENAMEchar = (char*)sqlite3_column_text(statement, 3);
            NSString *SERVICENAMEstring = [[NSString alloc]initWithUTF8String:SERVICENAMEchar];
            r.SERVICENAME=SERVICENAMEstring;
            servicename=SERVICENAMEstring;
            
            char *SERVICENAME_BACKUP1char = (char*)sqlite3_column_text(statement, 4);
            NSString *SERVICENAME_BACKUP1string = [[NSString alloc]initWithUTF8String:SERVICENAME_BACKUP1char];
            r.SERVICENAME_BACKUP1=SERVICENAME_BACKUP1string;
            
            char *SERVICENAME_BACKUP2char = (char*)sqlite3_column_text(statement, 5);
            NSString *SERVICENAME_BACKUP2string = [[NSString alloc]initWithUTF8String:SERVICENAME_BACKUP2char];
            r.SERVICENAME_BACKUP2=SERVICENAME_BACKUP2string;
            
            char *SERVICENAME_BACKUP3char = (char*)sqlite3_column_text(statement, 6);
            NSString *SERVICENAME_BACKUP3string = [[NSString alloc]initWithUTF8String:SERVICENAME_BACKUP3char];
           r.SERVICENAME_BACKUP3=SERVICENAME_BACKUP3string;
        
            [rows addObject:r];
            //NSLog(@"name:%@  age:%d  address:%@",nsNameStr,age, nsAddressStr);
        }
    }else{
        NSLog(@"select error:%@",sqlQuery);
        
    }
    sqlite3_close(db);
    return servicename;
}
@end



@implementation row
@synthesize  SERVICEID;
@synthesize  SERVICEKEY;
@synthesize  SERVICECODE;
@synthesize  SERVICENAME;
@synthesize  SERVICENAME_BACKUP1;
@synthesize  SERVICENAME_BACKUP2;
@synthesize  SERVICENAME_BACKUP3;
@end

