


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface ReceiverAddressManageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//list
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *cacheCells;
 //NSMutableArray *sectionAZDicArray;
//back
@property (weak, nonatomic) IBOutlet UIButton *backButton;
//收货地址
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
//添加
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@end

