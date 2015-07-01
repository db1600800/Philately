//
//  WelcomeViewController.m
//  Philately
//
//  Created by gdpost on 15/6/17.
//  Copyright (c) 2015年 gdpost. All rights reserved.
//

#import "WelcomeViewController.h"

#import "LeftViewController.h"
#import "SliderViewController.h"
#import "MainViewController.h"
#import <CoreGraphics/CGAffineTransform.h>
#import "MLBlackTransition.h"

#import "PromptError.h"
#import "SysBaseInfo.h"
#import "PromptError.h"
@interface WelcomeViewController ()

@end

ServiceInvoker *serviceInvoker;
@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

       serviceInvoker=[[ServiceInvoker alloc]init];
        [serviceInvoker  setDelegate:self];
   
    [serviceInvoker checkUpdates:@"stampStore_IOS" appVersion:@"1.0" ];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//业务请求返回错误
-(void)serviceInvokerError:(MsgReturn*)msgReturn
{
    
    
    //签到失败
    if([msgReturn.formName isEqualToString:@"appSignIn"]  && [msgReturn.errorCode isEqualToString:ERROR_SINGIN_ERROR])
    {
        return;
    }
    
    
    
    
     if(msgReturn.formName!=nil && [msgReturn.formName isEqualToString:@"checkUpdates"])
    {    //版本检测失败
        //appver超了
        
        [PromptError toast:msgReturn.errorDesc];
        return;
    }
    
    if(msgReturn.formName!=nil && [msgReturn.errorCode isEqualToString:ERROR_FAILED])
    {//交易失败
        
        return;
    }
    
    else
    {
        //网络错误 服务器错误  传输格式错误
        if([msgReturn.errorCode isEqualToString:ERROR_DATA_FORMAT_ERROR] || [msgReturn.errorCode isEqualToString:ERROR_SERVICE_IN_ERROR] || [msgReturn.errorCode isEqualToString:ERROR_NOT_NET])
            
        {
            
            
        }
    }
    
    NSLog(@"%@ %@",msgReturn.formName,msgReturn.errorDesc);
    
}



//业务请求返回数据
-(void)serviceInvokerReturnData:(MsgReturn*)msgReturn
{
 
    //签到成功
    if([msgReturn.errorCode isEqualToString:ERROR_SUCCESS] && [msgReturn.formName isEqualToString:@"appSignIn"])
    {
      
        SysBaseInfo *sysBaseInfo=[SysBaseInfo sharedInstance];
      
        sysBaseInfo.appID=@"stampStore_IOS";
        sysBaseInfo.appVersion=@"1.0";
        sysBaseInfo.appConfigVersion=@"1.0";
        sysBaseInfo.curTermType=@"02";//终端类型 02ios
        sysBaseInfo.curTermNo=@"";//当时终端号 android ios为空
        sysBaseInfo.channelNo=@"16";//渠道号 android ios 16
        sysBaseInfo.IP=@"";
        sysBaseInfo.tranNum=@"";//终端流水号 暂时为空
        
        NSLog(@"%@",@"签到成功");
        // [zhuangTextView setText:@"签到成功"];
      
        
        
        LeftViewController *leftVC = [[LeftViewController alloc] init];
        [SliderViewController sharedSliderController].LeftVC = leftVC;
        [SliderViewController sharedSliderController].MainVC = [[MainViewController alloc] init];
        [SliderViewController sharedSliderController].LeftSContentOffset=275;
        [SliderViewController sharedSliderController].LeftContentViewSContentOffset = 90;
        [SliderViewController sharedSliderController].LeftSContentScale=0.77;
        [SliderViewController sharedSliderController].LeftSJudgeOffset=160;
        [SliderViewController sharedSliderController].changeLeftView = ^(CGFloat sca, CGFloat transX)
        {
            //        leftVC.contentView.layer.anchorPoint = CGPointMake(1, 1);
            CGAffineTransform ltransS = CGAffineTransformMakeScale(sca, sca);
            CGAffineTransform ltransT = CGAffineTransformMakeTranslation(transX, 0);
            CGAffineTransform lconT = CGAffineTransformConcat(ltransT, ltransS);
            leftVC.contentView.transform = lconT;
        };
        
        
        //手势返回更新为MLBlackTransition
        [MLBlackTransition validatePanPackWithMLBlackTransitionGestureRecognizerType:MLBlackTransitionGestureRecognizerTypePan];
        
        UINavigationController *naviC = [[UINavigationController alloc] initWithRootViewController:[SliderViewController sharedSliderController]];
        
        [self.navigationController pushViewController:[SliderViewController sharedSliderController] animated:NO];

        
        
        
        //  [serviceInvoker checkUpdates];
        
    }
    else if([msgReturn.errorCode isEqualToString:ERROR_SUCCESS] && [msgReturn.formName isEqualToString:@"checkUpdates"])
    {
        //配置文件更新成功
        
         NSLog(@"%@",@"版本检测成功");
        
      
        
         [serviceInvoker appSignIn:@"stampStore_IOS" appVersion:@"1.0" ];
        
    }
    
    
    else if([msgReturn.errorCode isEqualToString:ERROR_SUCCESS])
    {//callWebservice成功
        
        
        
        
        
    }
    
}


@end
