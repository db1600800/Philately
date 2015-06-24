


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface OrderFormListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//list
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *cacheCells;
 //NSMutableArray *sectionAZDicArray;
//back
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
//新邮预订订单
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
//down
@property (weak, nonatomic) IBOutlet UIImageView *downImageView;
//query
@property (weak, nonatomic) IBOutlet UIImageView *queryImageView;
//近一月
@property (weak, nonatomic) IBOutlet UILabel *nearMonthTextView;
//一年
@property (weak, nonatomic) IBOutlet UILabel *yearTextView;
//全部
@property (weak, nonatomic) IBOutlet UILabel *allTextView;
@end

