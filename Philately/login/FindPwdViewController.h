


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface FindPwdViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//找回密码
@property (weak, nonatomic) IBOutlet UIButton *findPwdButton;
//back
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
//找回密码
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
//手机号码
@property (weak, nonatomic) IBOutlet UILabel *phoneTitleTextView;
//请输入手机号码
@property (weak, nonatomic) IBOutlet UITextField *phoneValueEditText;
//验证码:
@property (weak, nonatomic) IBOutlet UILabel *codeTitleTextView;
//请输入验证码
@property (weak, nonatomic) IBOutlet UITextField *codeValueEditText;
//新密码:
@property (weak, nonatomic) IBOutlet UILabel *pwdTitleTextView;
//请重新输入密码
@property (weak, nonatomic) IBOutlet UITextField *pwdValueEditText;
//确认新密码:
@property (weak, nonatomic) IBOutlet UILabel *pwd2TitleTextView;
//请输入新密码
@property (weak, nonatomic) IBOutlet UITextField *pwd2ValueEditText;
@end

