


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface FirstPageHeadView : UIViewController<UITableViewDataSource,UITableViewDelegate>
//firstPageHeadLine
@property (weak, nonatomic) IBOutlet UIImageView *firstPageHeadLineImageView;
//新邮预订
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
//line2
@property (weak, nonatomic) IBOutlet UIImageView *line2ImageView;
//more
@property (weak, nonatomic) IBOutlet UIButton *moreButton;
@end

