//
//  MainViewController.m
//  Philately
//
//  Created by gdpost on 15/6/15.
//  Copyright (c) 2015年 gdpost. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"

@interface MainViewController ()

@end
ServiceInvoker *serviceInvoker;
@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _tabC = [[UITabBarController alloc] init];
    [_tabC.tabBar setBackgroundColor:[UIColor clearColor]];
    [_tabC.view setFrame:self.view.frame];
    [self.view addSubview:_tabC.view];;
    
    
    loginViewController = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    menberMainViewController = [[MenberMainViewController alloc]initWithNibName:@"MenberMainViewController" bundle:nil];
    
      _tabC.viewControllers = @[menberMainViewController, loginViewController];
    
    
     [self reloadImage];
    
//    [[UITabBarItem appearance] setTitleTextAttributes:
//     [NSDictionary dictionaryWithObjectsAndKeys:RGBA(96, 164, 222, 1), UITextAttributeTextColor, nil]
//                                             forState:UIControlStateSelected];
    
     [_tabC setSelectedIndex:1];
   
}

-(void)viewDidAppear:(BOOL)animated
{
    
  
}

-(void)viewWillAppear:(BOOL)animated{
//[self btnTouchMy];

}



//登录页
#define SELECTED_VIEW_CONTROLLER_TAG 98456345





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



- (void)reloadImage
{
 
    
    NSString *imageName = nil;
//    if (isIos7 >= 7 && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1 && [QHConfiguredObj defaultConfigure].nThemeIndex != 0)
//    {
//        imageName = @"tabbar_bg_ios7.png";
//    }else
    //{
      //  imageName = @"tabbar_bg.png";
    //}
    [_tabC.tabBar setBackgroundImage:[UIImage imageNamed:imageName]];
    
    NSArray *ar = _tabC.viewControllers;
    NSMutableArray *arD = [NSMutableArray new];
    [ar enumerateObjectsUsingBlock:^(UIViewController *viewController, NSUInteger idx, BOOL *stop)
     {
         //        UITabBarItem *item = viewController.tabBarItem;
         UITabBarItem *item = nil;
         switch (idx)
         {
             case 0:
             {
                 item = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"tab_me_nor.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_me_press.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                 break;
             }
             case 1:
             {
                 item = [[UITabBarItem alloc] initWithTitle:@"ni的" image:[[UIImage imageNamed:@"tab_me_nor.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_me_press.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                 break;
             }
           
         }
         viewController.tabBarItem = item;
         [arD addObject:viewController];
     }];
    _tabC.viewControllers = arD;
}

@end
