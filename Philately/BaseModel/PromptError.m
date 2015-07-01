//
//  DealError.m
//  Philately
//
//  Created by gdpost on 15/6/25.
//  Copyright (c) 2015年 gdpost. All rights reserved.
//

#import "PromptError.h"
#import "OMGToast.h"
#import "Sql.h"
#import "ErrorObject.h"
@implementation PromptError

+(void) changeShowErrorMsg:(MsgReturn*)errorMsg title:(NSString*)title;
{
    
    Sql *sql=[[Sql alloc] init];
   
    ErrorObject *error1=[sql selectPM_CODEERRORMSG:errorMsg.errorCode];
    if(error1==nil || (error1!=nil && error1.errorDesc==nil))
    {
        error1=[[ErrorObject alloc] init];
        error1.errorDesc=errorMsg.errorDesc;
        error1.errorCode=errorMsg.errorCode;
        error1.errorType=errorMsg.errorType;
        
    }
    
     ErrorObject *error2=[sql selectPM_DESCERRORMSG:error1];
    
    
    if (error2.errorType==nil) {
       error2.errorType=@"01";
    }
  
  
    
    if([error2.errorType isEqualToString:@"01"])
    { //对话框
   
        
    //初始化AlertView
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示"
                                                    message:error2.errorDesc
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil,nil];
    //设置标题与信息，通常在使用frame初始化AlertView时使用
    //alert.title = @"AlertViewTitle";
   // alert.message = @"AlertViewMessage";
    
    //这个属性继承自UIView，当一个视图中有多个AlertView时，可以用这个属性来区分
    alert.tag = 0;
    //只读属性，看AlertView是否可见
   // NSLog(@"%d",alert.visible);
    //通过给定标题添加按钮
    //[alert addButtonWithTitle:@"addButton"];
    //按钮总数
    //NSLog(@"number Of Buttons :%d",alert.numberOfButtons);
    //获取指定索引的按钮标题
    //NSLog(@"buttonTitleAtIndex1:%@",[alert buttonTitleAtIndex:1]);
    //NSLog(@"buttonTitleAtIndex2:%@",[alert buttonTitleAtIndex:2]);
    //获取取消按钮的索引
   // NSLog(@"cancelButtonIndex:%d",alert.cancelButtonIndex);
    //获取第一个其他按钮的索引
    //NSLog(@"firstOtherButtonIndex:%d",alert.firstOtherButtonIndex);
    //显示AlertView
    [alert show];
    
    }else if([error2.errorType isEqualToString:@"02"])
    {
    
//    [OMGToast showWithText:@"中间显示" duration:5];
//    [OMGToast showWithText:@"距离上方50像素" topOffset:50 duration:5];
//    [OMGToast showWithText:@"文字很多的时候，我就会自动折行，最大宽度280像素" topOffset:100 duration:5];
//    [OMGToast showWithText:@"加入\\n也可以\n显示\n多\n行" topOffset:300 duration:5];
    //[OMGToast showWithText:@"距离下方3像素" bottomOffset:3 duration:5];
    
    [OMGToast showWithText:error2.errorDesc bottomOffset:10 duration:5];
    }else if([error2.errorType isEqualToString:@"03"])
    {
        
       
    }
}


+(void) toast:(NSString*)errorMsg
{
 
      [OMGToast showWithText:errorMsg  bottomOffset:10 duration:5];
    

}

//实现一个创建单例对象的类方法

static PromptError *objName = nil;

+ (PromptError *) sharedInstance{
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
