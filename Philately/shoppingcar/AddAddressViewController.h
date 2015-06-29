


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface AddAddressViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//back
@property (weak, nonatomic) IBOutlet UIButton *backButton;
//新建地址
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
//保存
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
//必填
@property (weak, nonatomic) IBOutlet UIImageView *mustinputImageView;
//姓名
@property (weak, nonatomic) IBOutlet UILabel *usernameTitleTextView;
//最少两个字
@property (weak, nonatomic) IBOutlet UITextField *usernameValueEditText;
//lineblack
@property (weak, nonatomic) IBOutlet UIImageView *lineblackImageView;
//手机
@property (weak, nonatomic) IBOutlet UILabel *phoneTitleTextView;
//请输入手机号码
@property (weak, nonatomic) IBOutlet UILabel *phoneValueTextView;
//地区
@property (weak, nonatomic) IBOutlet UILabel *areaTitleTextView;
//广东
@property (weak, nonatomic) IBOutlet UILabel *provinceTextView;
//down
@property (weak, nonatomic) IBOutlet UIImageView *downImageView;
//东莞
@property (weak, nonatomic) IBOutlet UILabel *cityTextView;
//虎门
@property (weak, nonatomic) IBOutlet UILabel *streemTextView;
//地址
@property (weak, nonatomic) IBOutlet UILabel *addressTitleTextView;
//最少五个字，精确到门牌号
@property (weak, nonatomic) IBOutlet UILabel *addressValueTextView;
//邮编:
@property (weak, nonatomic) IBOutlet UILabel *areacodeTitleTextView;
//6位邮政编码
@property (weak, nonatomic) IBOutlet UITextField *areacodeValueEditText;
//check
@property (weak, nonatomic) IBOutlet UIButton *checkButton;
//设为默认地址
@property (weak, nonatomic) IBOutlet UILabel *defaultTextView;
@end

