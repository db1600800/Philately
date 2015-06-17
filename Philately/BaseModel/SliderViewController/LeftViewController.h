//
//  LeftViewController.h
//  Philately
//
//  Created by gdpost on 15/6/15.
//  Copyright (c) 2015年 gdpost. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (weak, nonatomic) IBOutlet UIView *contentView;


@end
