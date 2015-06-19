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
    
//    _tabbar = [[TabbarView alloc]initWithFrame:CGRectMake(0, 0
//, self.tabbarContainer.frame.size.width, self.tabbarContainer.frame.size.height)];
//    _tabbar.delegate = self;
//    [self.tabbarContainer addSubview:_tabbar];
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnTouchMy)];
    self.tab1.tag=101;
    [self.tab1 addGestureRecognizer:tapGesture];
 
    
    

    
 
   
}

-(void)viewDidAppear:(BOOL)animated
{
    
    loginViewController = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    
    menberMainViewController = [[MenberMainViewController alloc]initWithNibName:@"MenberMainViewController" bundle:nil];
    
    //loginViewController.view.frame = CGRectMake(0,0,self.contentView.frame.size.width, self.contentView.frame.size.height);
    
    //    self.firstVC = [[HMTFirstViewController alloc] init];
    //    [self.firstVC.view setFrame:CGRectMake(0, 104, 320, 464)];
    [self addChildViewController:loginViewController];
    
    //  默认,第一个视图(你会发现,全程就这一个用了addSubview)
    [self.contentView addSubview:menberMainViewController.view];
    self.currentVc = menberMainViewController;
    
    [self transitionFromViewController:loginViewController toViewController:loginViewController duration:2.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        
        if (finished) {
            
//            [newController didMoveToParentViewController:self];
//            [oldController willMoveToParentViewController:nil];
//            [oldController removeFromParentViewController];
//            self.currentVC = newController;
            
        }else{
            
          //  self.currentVC = oldController;
            
        }
    }];
  
}

-(void)viewWillAppear:(BOOL)animated{
//[self btnTouchMy];

}



//登录页
#define SELECTED_VIEW_CONTROLLER_TAG 98456345


-(void)btnTouchMy
{
    UIView* currentView = [self.contentView viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
    [currentView removeFromSuperview];
    
    
   // NSDictionary* data = [_arrayViewcontrollers objectAtIndex:index];
    
//     loginViewController = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
      menberMainViewController = [[MenberMainViewController alloc]initWithNibName:@"MenberMainViewController" bundle:nil];
    
    menberMainViewController.view.tag = SELECTED_VIEW_CONTROLLER_TAG;
    menberMainViewController.view.frame = CGRectMake(0,0,self.contentView.frame.size.width, self.contentView.frame.size.height);
    
    [self.view addSubview:menberMainViewController.view ];
    
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

@end
