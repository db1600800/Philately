


//ios界面 object-c 
#import <UIKit/UIKit.h>
@interface ProductdetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//产品图片
@property (weak, nonatomic) IBOutlet UIImageView *productpicImageView;
//back
@property (weak, nonatomic) IBOutlet UIButton *backButton;
//产品详情
@property (weak, nonatomic) IBOutlet UILabel *titleTextView;
//car
@property (weak, nonatomic) IBOutlet UIImageView *carImageView;
//购物车数量
@property (weak, nonatomic) IBOutlet UILabel *carnumTextView;
//预订
@property (weak, nonatomic) IBOutlet UILabel *preOrderTextView;
//中国古代文学
@property (weak, nonatomic) IBOutlet UILabel *productNameTextView;
//lineblack
@property (weak, nonatomic) IBOutlet UIImageView *lineblackImageView;
//单套价格:
@property (weak, nonatomic) IBOutlet UILabel *onePriceTextView;
//12
@property (weak, nonatomic) IBOutlet UILabel *onePriceValueTextView;
//四个方连价格:
@property (weak, nonatomic) IBOutlet UILabel *fourPriceTitleTextView;
//48
@property (weak, nonatomic) IBOutlet UILabel *fourPriceValueTextView;
//oneCheck
@property (weak, nonatomic) IBOutlet UIButton *oneCheckButton;
//单套
@property (weak, nonatomic) IBOutlet UILabel *oneCheckTitleTextView;
//oneCheckReduce
@property (weak, nonatomic) IBOutlet UIButton *oneCheckReduceButton;
//oneCheckNum
@property (weak, nonatomic) IBOutlet UITextField *oneCheckNumEditText;
//oneCheckAdd
@property (weak, nonatomic) IBOutlet UIButton *oneCheckAddButton;
//单套限购
@property (weak, nonatomic) IBOutlet UILabel *oneCheckLimiteTextView;
//fourCheck
@property (weak, nonatomic) IBOutlet UIButton *fourCheckButton;
//四方连
@property (weak, nonatomic) IBOutlet UILabel *fourCheckTitleTextView;
//fourCheckReduce
@property (weak, nonatomic) IBOutlet UIButton *fourCheckReduceButton;
//4
@property (weak, nonatomic) IBOutlet UITextField *fourCheckNumEditText;
//fourCheckAdd
@property (weak, nonatomic) IBOutlet UIButton *fourCheckAddButton;
//四方限购
@property (weak, nonatomic) IBOutlet UILabel *fourCheckLimiteTextView;
//所需最低积分
@property (weak, nonatomic) IBOutlet UILabel *needFenTitleTextView;
//0
@property (weak, nonatomic) IBOutlet UILabel *needFenValueTextView;
//获得积分:
@property (weak, nonatomic) IBOutlet UILabel *getFenTitleTextView;
//3
@property (weak, nonatomic) IBOutlet UILabel *getFenValueTextView;
//扣除积分:
@property (weak, nonatomic) IBOutlet UILabel *deleteFenTextView;
//0
@property (weak, nonatomic) IBOutlet UILabel *deleteFenValueTextView;
//所属机构:
@property (weak, nonatomic) IBOutlet UILabel *belongTitleTextView;
//中国邮政网上
@property (weak, nonatomic) IBOutlet UILabel *belongValueTextView;
//发行时间:
@property (weak, nonatomic) IBOutlet UILabel *timeTextView;
//2015
@property (weak, nonatomic) IBOutlet UILabel *timeValueTextView;
//销售时间
@property (weak, nonatomic) IBOutlet UILabel *saletimeTextView;
//2015
@property (weak, nonatomic) IBOutlet UILabel *saletimeValueTextView;
//开始
@property (weak, nonatomic) IBOutlet UILabel *startTextView;
//简要描述
@property (weak, nonatomic) IBOutlet UILabel *detailTitleTextView;
//作者
@property (weak, nonatomic) IBOutlet UILabel *detailValueTextView;
//猜你喜欢
@property (weak, nonatomic) IBOutlet UILabel *youlikeTextView;
//list
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *cacheCells;
// NSMutableArray *sectionAZDicArray;
//立即购买
@property (weak, nonatomic) IBOutlet UIButton *buyButton;
//放进购物车
@property (weak, nonatomic) IBOutlet UIButton *addbuycarButton;
@end

