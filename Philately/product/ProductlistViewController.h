


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface ProductlistViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//list
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *cacheCells;
// NSMutableArray *sectionAZDicArray;
//back
@property (weak, nonatomic) IBOutlet UIButton *backButton;
//邮票
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
//car
@property (weak, nonatomic) IBOutlet UIImageView *carImageView;
//9
@property (weak, nonatomic) IBOutlet UILabel *carnumTextView;
//默认
@property (weak, nonatomic) IBOutlet UILabel *defaultTextView;
//价格
@property (weak, nonatomic) IBOutlet UILabel *priceTextView;
//down
@property (weak, nonatomic) IBOutlet UIImageView *downImageView;
//分类
@property (weak, nonatomic) IBOutlet UILabel *classTextView;
@end

