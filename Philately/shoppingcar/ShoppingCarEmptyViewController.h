


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface ShoppingCarEmptyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//back
@property (weak, nonatomic) IBOutlet UIButton *backButton;
//购物车
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
//shoppingcar
@property (weak, nonatomic) IBOutlet UIImageView *shoppingcarImageView;
//您的购物车是空的
@property (weak, nonatomic) IBOutlet UILabel *emptyTitleTextView;
//linehead
@property (weak, nonatomic) IBOutlet UIImageView *lineheadImageView;
//热门推荐
@property (weak, nonatomic) IBOutlet UILabel *hotTitleTextView;
//linehead2
@property (weak, nonatomic) IBOutlet UIImageView *linehead2ImageView;
//list
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *cacheCells;
// NSMutableArray *sectionAZDicArray;
@end

