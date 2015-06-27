#import <UIKit/UIKit.h>
@interface ShoppingCarTableViewCell :UITableViewCell
//shoppingCarCheck
@property (weak, nonatomic) IBOutlet UIImageView *shoppingCarCheckImageView;
//cancelX
@property (weak, nonatomic) IBOutlet UIImageView *cancelXImageView;
//productPic
@property (weak, nonatomic) IBOutlet UIImageView *productPicImageView;
//产品名字
@property (weak, nonatomic) IBOutlet UILabel *productNameTextView;
//单套
@property (weak, nonatomic) IBOutlet UILabel *oneTextView;
//12.00
@property (weak, nonatomic) IBOutlet UILabel *onePriceTextView;
//四方红
@property (weak, nonatomic) IBOutlet UILabel *fourTextView;
//36.00
@property (weak, nonatomic) IBOutlet UILabel *fourPriceTextView;
//check
@property (weak, nonatomic) IBOutlet UIButton *checkOneButton;
//单套
@property (weak, nonatomic) IBOutlet UILabel *checkOneTitleTextView;
//减少
@property (weak, nonatomic) IBOutlet UIImageView *reduceImageView;
//单套数量
@property (weak, nonatomic) IBOutlet UITextField *oneNumEditText;
//加
@property (weak, nonatomic) IBOutlet UIImageView *oneAddImageView;
//限购五套
@property (weak, nonatomic) IBOutlet UILabel *oneLimitTextView;
//4套选择
@property (weak, nonatomic) IBOutlet UIButton *fourCheckButton;
//四方连
@property (weak, nonatomic) IBOutlet UILabel *fourCheckTitleTextView;
//fourReduce
@property (weak, nonatomic) IBOutlet UIImageView *fourReduceImageView;
//四方连数量
@property (weak, nonatomic) IBOutlet UITextField *fourNumEditText;
//四方连加
@property (weak, nonatomic) IBOutlet UIImageView *fourAddImageView;
//四方连限购
@property (weak, nonatomic) IBOutlet UIView *content;
@property (weak, nonatomic) IBOutlet UILabel *fourLimitTextView;

@property ( nonatomic) int row;
@property ( nonatomic) int section;

@end

