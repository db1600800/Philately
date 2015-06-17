


//ios界面 object-c 
#import <UIKit/UIKit.h>
#import "StampTranCall.h"

@interface LoginViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,StampTranCallDelegate>
//back
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
//用户登录
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
//注册
@property (weak, nonatomic) IBOutlet UIButton *rigistButton;
//用户名
@property (weak, nonatomic) IBOutlet UILabel *userNameTitleTextView;
//请输入用户名或手机号码
@property (weak, nonatomic) IBOutlet UITextField *userNameValueEditText;
//密码
@property (weak, nonatomic) IBOutlet UILabel *pwdTitleTextView;
//请输入密码
@property (weak, nonatomic) IBOutlet UITextField *pwdValueEditText;
//验证码
@property (weak, nonatomic) IBOutlet UILabel *codeTitleTextView;
//请输入验证码
@property (weak, nonatomic) IBOutlet UITextField *codeValueEditText;
//codePic
@property (weak, nonatomic) IBOutlet UIImageView *codePicImageView;
//忘记密码
@property (weak, nonatomic) IBOutlet UIButton *forgetPwdButton;
//登录
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@end

