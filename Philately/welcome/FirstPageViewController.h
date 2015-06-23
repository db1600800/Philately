


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface FirstPageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
//table
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *cacheCells;
// NSMutableArray *sectionAZDicArray;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIPageControl *pagecontrol;

@end

