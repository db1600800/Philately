


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface MenberMainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//我的账户
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
//张三
@property (weak, nonatomic) IBOutlet UILabel *userNameTextView;
//完善资料
@property (weak, nonatomic) IBOutlet UILabel *toCompleteInfoTextView;
//修改密码
@property (weak, nonatomic) IBOutlet UILabel *modifyPwdTextView;
//我的消息pic
@property (weak, nonatomic) IBOutlet UIImageView *myMessagePicImageView;
//我的消息
@property (weak, nonatomic) IBOutlet UILabel *myMessageTextView;
//right
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
//我的订单pic
@property (weak, nonatomic) IBOutlet UIImageView *myOrderFormImageView;
//待支付
@property (weak, nonatomic) IBOutlet UIButton *waitPayButton;
//待收货
@property (weak, nonatomic) IBOutlet UIButton *waitReceiveButton;
//全部订单
@property (weak, nonatomic) IBOutlet UIButton *allOrderFormButton;
//零售订单pic
@property (weak, nonatomic) IBOutlet UIImageView *retailOrderFormPicImageView;
//零售订单
@property (weak, nonatomic) IBOutlet UILabel *retailOrderFormTextView;
//right
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
//新邮预订订单pic
@property (weak, nonatomic) IBOutlet UIImageView *newPostOrderFormPicImageView;
//新邮预订订单
@property (weak, nonatomic) IBOutlet UILabel *newPostOrderFormTextView;
//right
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
//diyOrderFormPic
@property (weak, nonatomic) IBOutlet UIImageView *diyOrderFormPicImageView;
//个性化定制订单
@property (weak, nonatomic) IBOutlet UILabel *diyOrderFromTextView;
//right
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
//我的补退款
@property (weak, nonatomic) IBOutlet UIImageView *myBackMoneyPicImageView;
//我的补退款
@property (weak, nonatomic) IBOutlet UILabel *myBackMoneyTextView;
//right
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
//我的换货pic
@property (weak, nonatomic) IBOutlet UIImageView *myChangePicImageView;
//我的换货
@property (weak, nonatomic) IBOutlet UILabel *myChangeTextView;
//right
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
//我的投诉pic
@property (weak, nonatomic) IBOutlet UIImageView *myComplainImageView;
//我的投诉
@property (weak, nonatomic) IBOutlet UILabel *myComplanTextView;
//right
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
//我的地址pic
@property (weak, nonatomic) IBOutlet UIImageView *myAddressPicImageView;
//我的地址
@property (weak, nonatomic) IBOutlet UILabel *myAddressTextView;
//right
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
//我的预订资格
@property (weak, nonatomic) IBOutlet UIImageView *myBookIsPicImageView;
//我的预订资格
@property (weak, nonatomic) IBOutlet UILabel *myBookIsTextView;
//right
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
@end

