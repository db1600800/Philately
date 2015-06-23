//
//  LeftViewController.m
//  Philately
//
//  Created by gdpost on 15/6/15.
//  Copyright (c) 2015年 gdpost. All rights reserved.
//

#import "LeftViewController.h"
#import "SliderViewController.h"
#import "MainViewController.h"
@interface LeftViewController ()

@end

@implementation LeftViewController

NSArray *_arData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tableview setDelegate:self];//指定委托
    
    [self.tableview setDataSource:self];//指定数据委托
    
    _arData = @[@[@"帮助中心", @"vip_shadow.png"],
                @[@"版本升级", @"vip_shadow.png"],
                 @[@"关于", @"vip_shadow.png"],
                 @[@"咨询", @"vip_shadow.png"]
            ];
    
  
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



- (void)backAction:(UIButton *)btn
{
    [[SliderViewController sharedSliderController] closeSideBar];
}

- (void)toNewViewbtn:(UIButton *)btn
{
    [[SliderViewController sharedSliderController] closeSideBarWithAnimate:YES complete:^(BOOL finished)
     {
     }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdetify = @"left";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdetify];;
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdetify];
        [cell setBackgroundColor:[UIColor clearColor]];
        [cell.textLabel setTextColor:[UIColor whiteColor]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
    }
    
    NSArray *ar = [_arData objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[ar objectAtIndex:1]];
    cell.textLabel.text = [ar objectAtIndex:0];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 47;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row)
    {
        case 1:
        {
            LoginViewController *themeVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
            [[SliderViewController sharedSliderController] closeSideBarWithAnimate:YES complete:^(BOOL finished)
             {
                 //[[SliderViewController sharedSliderController].navigationController pushViewController:themeVC animated:YES];
                 [self presentViewController:themeVC animated:NO completion:^{}];
             }];
            break;
        }
        default:
            [self backAction:nil];
            break;
    }
}


@end
