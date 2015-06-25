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
@implementation PromptError

+(void) prompt
{
    
    Sql *sql=[[Sql alloc] init];
    NSString *msg=[sql selectCODESYSCHANGE:@"WG1001"];
    
    NSString *errorType=@"1";
    
    if([errorType isEqualToString:@"1"])
    {
   
        
    //初始化AlertView
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示"
                                                    message:msg
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
    
    }else if([errorType isEqualToString:@"0"])
    {
    
//    [OMGToast showWithText:@"中间显示" duration:5];
//    [OMGToast showWithText:@"距离上方50像素" topOffset:50 duration:5];
//    [OMGToast showWithText:@"文字很多的时候，我就会自动折行，最大宽度280像素" topOffset:100 duration:5];
//    [OMGToast showWithText:@"加入\\n也可以\n显示\n多\n行" topOffset:300 duration:5];
    //[OMGToast showWithText:@"距离下方3像素" bottomOffset:3 duration:5];
    
    [OMGToast showWithText:msg bottomOffset:10 duration:5];
    }
}

+(void) toast:(NSString*)errorCode errorMSg:(NSString*)errorMsg
{
    if(errorCode==nil)
    {
      [OMGToast showWithText:errorMsg  bottomOffset:10 duration:5];
    }

}


@end
