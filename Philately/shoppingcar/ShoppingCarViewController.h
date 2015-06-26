


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface ShoppingCarViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>//list  

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *cacheCells;
// NSMutableArray *sectionAZDicArray;
//back
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
//购物车
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
//合计
@property (weak, nonatomic) IBOutlet UILabel *totalTitleTextView;
//¥22.00
@property (weak, nonatomic) IBOutlet UILabel *totalValueTextView;
//提交订单
@property (weak, nonatomic) IBOutlet UIButton *commitOrderFormButton;
@end

