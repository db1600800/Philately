//
//  DealError.m
//  Philately
//
//  Created by gdpost on 15/6/25.
//  Copyright (c) 2015年 gdpost. All rights reserved.
//

#import "PromptError.h"

#import "SqlApp.h"
#import "ErrorObject.h"
#import "Toast+UIView.h"
@implementation PromptError

+(void) changeShowErrorMsg:(MsgReturn*)errorMsg title:(NSString*)title viewController:(UIViewController*)viewController;
{
    
    SqlApp *sql=[[SqlApp alloc] init];
   
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
    
        [viewController.view makeToast:errorMsg.errorDesc];
        
    }else if([error2.errorType isEqualToString:@"03"])
    {
        
       
    }
}








@end
