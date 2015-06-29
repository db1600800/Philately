


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface PickUpByMyselfAddressViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//list
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *cacheCells;
// NSMutableArray *sectionAZDicArray;
//back
@property (weak, nonatomic) IBOutlet UIButton *backButton;
//选择自提点
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
//广东
@property (weak, nonatomic) IBOutlet UILabel *proviceTextView;
//down
@property (weak, nonatomic) IBOutlet UIImageView *downImageView;
//linevertical
@property (weak, nonatomic) IBOutlet UIImageView *lineverticalImageView;
//东莞市
@property (weak, nonatomic) IBOutlet UILabel *cityTextView;
//厚街
@property (weak, nonatomic) IBOutlet UILabel *streemTextView;
//query
@property (weak, nonatomic) IBOutlet UIImageView *queryImageView;
//checkAgress
@property (weak, nonatomic) IBOutlet UIButton *checkAgressButton;
//我已阅读并同意自提协议
@property (weak, nonatomic) IBOutlet UILabel *agreemsgTextView;
//确定
@property (weak, nonatomic) IBOutlet UIButton *sureButton;
@end

