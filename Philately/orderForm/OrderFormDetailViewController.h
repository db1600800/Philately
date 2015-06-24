


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface OrderFormDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//back
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
//订单详情
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
//业务类型:
@property (weak, nonatomic) IBOutlet UILabel *businessTypeValueTextView;
//新邮预订
@property (weak, nonatomic) IBOutlet UILabel *businessTypeValueTextView;
//订单号:
@property (weak, nonatomic) IBOutlet UILabel *orderNoTitleTextView;
//1343434
@property (weak, nonatomic) IBOutlet UILabel *orderNoValueTextView;
//订单状态
@property (weak, nonatomic) IBOutlet UILabel *orderFormStateTitleTextView;
//已支付
@property (weak, nonatomic) IBOutlet UILabel *orderFromStateValueTextView;
//下单时间
@property (weak, nonatomic) IBOutlet UILabel *orderFormTimeTitleTextView;
//201514
@property (weak, nonatomic) IBOutlet UILabel *orderFormTimeValueTextView;
//处理状态:
@property (weak, nonatomic) IBOutlet UILabel *orderFormDealStateTitleTextView;
//未处理
@property (weak, nonatomic) IBOutlet UILabel *orderFormDealStateValueTextView;
//已支付
@property (weak, nonatomic) IBOutlet UILabel *alreadyPayTitleTextView;
//233
@property (weak, nonatomic) IBOutlet UILabel *alreadyPayValueTextView;
//订单金额:
@property (weak, nonatomic) IBOutlet UILabel *orderFormMoneyTitleTextView;
//253
@property (weak, nonatomic) IBOutlet UILabel *orderFormMoneyValueTextView;
//补款:
@property (weak, nonatomic) IBOutlet UILabel *needPayTitleTextView;
//20
@property (weak, nonatomic) IBOutlet UILabel *needPayValueTextView;
//配送方式
@property (weak, nonatomic) IBOutlet UILabel *deliverWayTitleTextView;
//自提网点:
@property (weak, nonatomic) IBOutlet UILabel *deliverWayTextView;
//广东省天河
@property (weak, nonatomic) IBOutlet UILabel *deliverWayAddressTextView;
//收货人信息
@property (weak, nonatomic) IBOutlet UILabel *receiverInfoTitleTextView;
//广州市
@property (weak, nonatomic) IBOutlet UILabel *receiverAddressTextView;
//周小五
@property (weak, nonatomic) IBOutlet UILabel *receiverNameTextView;
//343243
@property (weak, nonatomic) IBOutlet UILabel *receiverPhoneTextView;
//商品信息
@property (weak, nonatomic) IBOutlet UILabel *productInfoTitleTextView;
//容器
@property (weak, nonatomic) IBOutlet UILabel *productContainerTextView;
//发票信息
@property (weak, nonatomic) IBOutlet UILabel *invoiceInfoTitleTextView;
//营销员号
@property (weak, nonatomic) IBOutlet UILabel *salerNoTitleTextView;
//222343
@property (weak, nonatomic) IBOutlet UILabel *salerNoValueTextView;
//个人发票
@property (weak, nonatomic) IBOutlet UILabel *invoiceTypeTextView;
//李四
@property (weak, nonatomic) IBOutlet UILabel *invoiceUserNameTextView;
//去补款20
@property (weak, nonatomic) IBOutlet UIButton *needPayButton;
@end

