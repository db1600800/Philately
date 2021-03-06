


#import "MenberMainViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
#import "UpdatePwdViewController.h"
#import "OrderFormListViewController.h"

@implementation MenberMainViewController
//我的账户
@synthesize titleTextView;
//张三
@synthesize userNameTextView;
//完善资料
@synthesize toCompleteInfoTextView;
//修改密码
@synthesize modifyPwdTextView;
//我的消息pic
@synthesize myMessagePicImageView;
//我的消息
@synthesize myMessageTextView;
//right
@synthesize rightImageView;
//我的订单pic
@synthesize myOrderFormImageView;
//待支付
@synthesize waitPayButton;
//待收货
@synthesize waitReceiveButton;
//全部订单
@synthesize allOrderFormButton;
//零售订单pic
@synthesize retailOrderFormPicImageView;
//零售订单
@synthesize retailOrderFormTextView;
//right

//新邮预订订单pic
@synthesize postnewOrderFormPicImageView;
//新邮预订订单
@synthesize postnewOrderFormTextView;
//right

//diyOrderFormPic
@synthesize diyOrderFormPicImageView;
//个性化定制订单
@synthesize diyOrderFromTextView;
//right

//我的补退款
@synthesize myBackMoneyPicImageView;
//我的补退款
@synthesize myBackMoneyTextView;
//right

//我的换货pic
@synthesize myChangePicImageView;
//我的换货
@synthesize myChangeTextView;
//right

//我的投诉pic
@synthesize myComplainImageView;
//我的投诉
@synthesize myComplanTextView;
//right

//我的地址pic
@synthesize myAddressPicImageView;
//我的地址
@synthesize myAddressTextView;
//right

//我的预订资格
@synthesize myBookIsPicImageView;
//我的预订资格
@synthesize myBookIsTextView;
//right

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    
    UITapGestureRecognizer *_left = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handTap)];
    [self.modifyPwdTextView addGestureRecognizer:_left];
    
    
    self.scroll.contentSize=CGSizeMake(320, 700);
    
    UITapGestureRecognizer *myOrderGestutre = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(myOrderTap)];
    [self.myOrder addGestureRecognizer:myOrderGestutre];
    
    
    
    self.waitAllSegment.segmentedControlStyle = UISegmentedControlStylePlain;
   
    //瞬时单击
    //segmentedControl.momentary = YES; //按钮被按下后很快恢复，默认为选中状态就一直保持
    
    //初始化默认片段
     self.waitAllSegment.selectedSegmentIndex = 0; //初始指定第0个选中
    
    [ self.waitAllSegment addTarget:self action:@selector(controlPressed:) forControlEvents:UIControlEventValueChanged];
    
    
 
    
}


-(void) viewWillAppear:(BOOL)animated{
    
    CstmMsg *cst=[CstmMsg sharedInstance];
    [userNameTextView setText:cst.cstmName];
    
}

//SegmentedControl触发的动作

-(void)controlPressed:(id)sender{
    
    UISegmentedControl *control = (UISegmentedControl *)sender;
    
    if (control ==  self.waitAllSegment) {
        
        int x = control.selectedSegmentIndex;
        
        /*添加代码，对片段变化做出响应*/
        if(x==0)
        {//待支付
            
        }else if (x==1)
        {//待收货
            
        }else if(x==3)
        {//全部订单
            
        }
        
    }
    
}


-(void)myOrderTap
{
    OrderFormListViewController *orderFormListViewController=[[OrderFormListViewController alloc ] initWithNibName:@"OrderFormListViewController" bundle:nil];
      [self presentViewController:orderFormListViewController animated:NO completion:^{}];
}

-(void)handTap
{
     UpdatePwdViewController *updatePwdViewController=[[UpdatePwdViewController alloc] initWithNibName:@"UpdatePwdViewController" bundle:nil];
    //[self.navigationController pushViewController:updatePwdViewController animated:NO];
   [self presentViewController:updatePwdViewController animated:NO completion:^{}];
  
}



-(void) setUiValue{

////我的账户
//[titleTextView setValue:]
////张三
//[userNameTextView setValue:]
////完善资料
//[toCompleteInfoTextView setValue:]
////修改密码
//[modifyPwdTextView setValue:]
////我的消息pic
//[myMessagePicImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[myMessagePicImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////我的消息
//[myMessageTextView setValue:]
////right
//[rightImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[rightImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////我的订单pic
//[myOrderFormImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[myOrderFormImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////零售订单pic
//[retailOrderFormPicImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[retailOrderFormPicImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////零售订单
//[retailOrderFormTextView setValue:]
////right
//[rightImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[rightImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////新邮预订订单pic
//[postnewOrderFormPicImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[postnewOrderFormPicImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////新邮预订订单
//[newPostOrderFormTextView setValue:]
////right
//[rightImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[rightImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////diyOrderFormPic
//[diyOrderFormPicImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[diyOrderFormPicImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////个性化定制订单
//[diyOrderFromTextView setValue:]
////right
//[rightImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[rightImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////我的补退款
//[myBackMoneyPicImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[myBackMoneyPicImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////我的补退款
//[myBackMoneyTextView setValue:]
////right
//[rightImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[rightImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////我的换货pic
//[myChangePicImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[myChangePicImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////我的换货
//[myChangeTextView setValue:]
////right
//[rightImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[rightImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////我的投诉pic
//[myComplainImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[myComplainImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////我的投诉
//[myComplanTextView setValue:]
////right
//[rightImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[rightImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////我的地址pic
//[myAddressPicImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[myAddressPicImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////我的地址
//[myAddressTextView setValue:]
////right
//[rightImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[rightImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////我的预订资格
//[myBookIsPicImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[myBookIsPicImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////我的预订资格
//[myBookIsTextView setValue:]
////right
//[rightImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[rightImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
}


@end

