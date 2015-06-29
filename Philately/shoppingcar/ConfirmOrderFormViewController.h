


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface ConfirmOrderFormViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//productlist
@property (weak, nonatomic) IBOutlet UIImageView *productlistImageView;
//商品列表
@property (weak, nonatomic) IBOutlet UILabel *productlistTitleTextView;
//back
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
//确认订单
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
//addressPoint
@property (weak, nonatomic) IBOutlet UIImageView *addressPointImageView;
//配送地址
@property (weak, nonatomic) IBOutlet UILabel *addressTitleTextView;
//收件人
@property (weak, nonatomic) IBOutlet UILabel *receiverTitleTextView;
//张三
@property (weak, nonatomic) IBOutlet UILabel *receiverValueTextView;
//13339489
@property (weak, nonatomic) IBOutlet UILabel *receiverPhoneTextView;
//广东省什么
@property (weak, nonatomic) IBOutlet UILabel *receiverAddressTextView;
//寄递
@property (weak, nonatomic) IBOutlet UILabel *receiverWayTitleTextView;
//right
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
//营销员号:
@property (weak, nonatomic) IBOutlet UILabel *salerNoTitleTextView;
//请输入营销员号
@property (weak, nonatomic) IBOutlet UITextField *salerNoValueEditText;
//验证码:
@property (weak, nonatomic) IBOutlet UILabel *codeTitleTextView;
//请输入验证码
@property (weak, nonatomic) IBOutlet UITextField *codeValueEditText;
//获取验证码
@property (weak, nonatomic) IBOutlet UIButton *getCodeButton;
//合计:
@property (weak, nonatomic) IBOutlet UILabel *totalTitleTextView;
//¥170
@property (weak, nonatomic) IBOutlet UILabel *totalValueTextView;
//提交订单
@property (weak, nonatomic) IBOutlet UILabel *submitOrderFromTextView;
@end

