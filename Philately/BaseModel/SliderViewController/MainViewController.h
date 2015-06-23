//
//  MainViewController.h
//  Philately
//
//  Created by gdpost on 15/6/15.
//  Copyright (c) 2015年 gdpost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenberMainViewController.h"
#import "LoginViewController.h"

@interface MainViewController : UIViewController<UITabBarControllerDelegate>
{
    LoginViewController *loginViewController;
    MenberMainViewController *menberMainViewController;
    
    UITabBarController *_tabC;

}
@property (weak, nonatomic) IBOutlet UIView *tab1;
@property (weak, nonatomic) IBOutlet UIView *tab2;
@property (weak, nonatomic) IBOutlet UIView *tab3;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIView *tabView;
@property (weak, nonatomic) UIViewController *currentVc;
@end
