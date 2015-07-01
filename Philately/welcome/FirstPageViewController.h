


//ios界面 object-c 
#import <UIKit/UIKit.h>
#import "StampTranCall.h"

#import "PromptError.h"
#import "SysBaseInfo.h"
@interface FirstPageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,StampTranCallDelegate>
//table
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *cacheCells;
// NSMutableArray *sectionAZDicArray;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIPageControl *pagecontrol;

@end

