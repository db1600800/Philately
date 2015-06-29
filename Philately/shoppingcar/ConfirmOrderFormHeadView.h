


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface ConfirmOrderFormHeadView : UIViewController<UITableViewDataSource,UITableViewDelegate>
//开具发票
@property (weak, nonatomic) IBOutlet UILabel *invoiceTitleTextView;
//invoiceCheck
@property (weak, nonatomic) IBOutlet UIButton *invoiceCheckButton;
//发票类型
@property (weak, nonatomic) IBOutlet UILabel *invoiceTypeTitleTextView;
//invoiceTypePesonCheck
@property (weak, nonatomic) IBOutlet UIButton *invoiceTypePesonCheckButton;
//个人
@property (weak, nonatomic) IBOutlet UILabel *invoiceTypePesonTitleTextView;
//invoiceTypeCompanyCheck
@property (weak, nonatomic) IBOutlet UIButton *invoiceTypeCompanyCheckButton;
//单位
@property (weak, nonatomic) IBOutlet UILabel *invoiceTypeCompanyTileTextView;
//lineblcak
@property (weak, nonatomic) IBOutlet UIImageView *lineblcakImageView;
//发票抬头:
@property (weak, nonatomic) IBOutlet UILabel *invoiceHeadTitleTextView;
//请输入发票抬头
@property (weak, nonatomic) IBOutlet UITextField *invoiceHeadValueEditText;
//配送方式:
@property (weak, nonatomic) IBOutlet UILabel *deliverWayTitleTextView;
//emsCheck
@property (weak, nonatomic) IBOutlet UIButton *emsCheckButton;
//ems
@property (weak, nonatomic) IBOutlet UILabel *emsTextView;
//smallpackCheck
@property (weak, nonatomic) IBOutlet UIButton *smallPackCheckButton;
//国内小包
@property (weak, nonatomic) IBOutlet UILabel *smallpackTitleTextView;
//寄递费
@property (weak, nonatomic) IBOutlet UILabel *deliverMoneyTitleTextView;
//10元
@property (weak, nonatomic) IBOutlet UILabel *deliverMoneyValueTextView;
//小记:
@property (weak, nonatomic) IBOutlet UILabel *totalmoneyTextView;
//90元
@property (weak, nonatomic) IBOutlet UILabel *totalmoneyValueTextView;
@end

