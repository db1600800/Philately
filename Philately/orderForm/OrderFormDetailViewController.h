


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface OrderFormDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
//back
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
//订单详情
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
//业务类型
@property (weak, nonatomic) IBOutlet UILabel *businessTypeTitleTextView;
//新邮预订
@property (weak, nonatomic) IBOutlet UILabel *businessTypeValueTextView;
//订单号:
@property (weak, nonatomic) IBOutlet UILabel *orderFormNoTitleTextView;
//13434
@property (weak, nonatomic) IBOutlet UILabel *orderFormNoValueTextView;
//订单状态
@property (weak, nonatomic) IBOutlet UILabel *orderFormStateTitleTextView;
//已支付
@property (weak, nonatomic) IBOutlet UILabel *orderFromStateValueTextView;
//下单时间
@property (weak, nonatomic) IBOutlet UILabel *orderFormTimeTitleTextView;
//20150303
@property (weak, nonatomic) IBOutlet UILabel *orderFormTimeValueTextView;
//处理状态
@property (weak, nonatomic) IBOutlet UILabel *dealStateTitleTextView;
//未处理
@property (weak, nonatomic) IBOutlet UILabel *dealStateValueTextView;
//已支付
@property (weak, nonatomic) IBOutlet UILabel *aleadyPayTitleTextView;
//233.00
@property (weak, nonatomic) IBOutlet UILabel *aleadyPayValueTextView;
//订单金额
@property (weak, nonatomic) IBOutlet UILabel *totalMoneyTitleTextView;
//253.00
@property (weak, nonatomic) IBOutlet UILabel *totalMoneyValueTextView;
//补款
@property (weak, nonatomic) IBOutlet UILabel *needPayTitleTextView;
//¥20
@property (weak, nonatomic) IBOutlet UILabel *needPayValueTextView;
//配送方式
@property (weak, nonatomic) IBOutlet UILabel *deliverWayTitleTextView;
//自提
@property (weak, nonatomic) IBOutlet UILabel *deliverWayTextView;
//广州市区
@property (weak, nonatomic) IBOutlet UILabel *deliverWayAddressTextView;
//收货人信息
@property (weak, nonatomic) IBOutlet UILabel *receiverInfoTitleTextView;
//周小五
@property (weak, nonatomic) IBOutlet UILabel *receiverNameTextView;
//158444399
@property (weak, nonatomic) IBOutlet UILabel *receiverPhoneTextView;
//广州市
@property (weak, nonatomic) IBOutlet UILabel *receiverAddressTextView;
//商品信息
@property (weak, nonatomic) IBOutlet UILabel *productTitleTextView;
//发票信息
@property (weak, nonatomic) IBOutlet UILabel *invoiceInfoTextView;
//个人发票
@property (weak, nonatomic) IBOutlet UILabel *invoiceTypeTextView;
//李四
@property (weak, nonatomic) IBOutlet UILabel *invoiceUserNameTextView;
//营销员号
@property (weak, nonatomic) IBOutlet UILabel *salerNoTitleTextView;
//3443
@property (weak, nonatomic) IBOutlet UILabel *salerNoValueTextView;
//去补款20元
@property (weak, nonatomic) IBOutlet UIButton *gotoPayButton;
@end

