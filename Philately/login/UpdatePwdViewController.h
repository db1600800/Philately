


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface UpdatePwdViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//确定
@property (weak, nonatomic) IBOutlet UIButton *okButton;
//back
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
//修改密码
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
//旧密码
@property (weak, nonatomic) IBOutlet UILabel *oldPwdTitleTextView;
//请输入旧密码
@property (weak, nonatomic) IBOutlet UITextField *oldPwdValueEditText;
//新密码
@property (weak, nonatomic) IBOutlet UILabel *newPwdTitleTextView;
//请输入新密码
@property (weak, nonatomic) IBOutlet UITextField *newPwdValueEditText;
//确认密码
@property (weak, nonatomic) IBOutlet UILabel *newPwd2TitleTextView;
//请再输入新密码
@property (weak, nonatomic) IBOutlet UITextField *newPwd2ValueEditText;
@end

