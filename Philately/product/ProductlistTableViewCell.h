#import <UIKit/UIKit.h>
@interface ProductlistTableViewCell :UITableViewCell
//productpicleft
@property (weak, nonatomic) IBOutlet UIImageView *productpicleftImageView;
//productleftname
@property (weak, nonatomic) IBOutlet UILabel *productleftnameTextView;
//120
@property (weak, nonatomic) IBOutlet UILabel *productleftPriceTextView;
//productRigthPic
@property (weak, nonatomic) IBOutlet UIImageView *productRightPicImageView;
//productRightName
@property (weak, nonatomic) IBOutlet UILabel *productRightNameTextView;
//120
@property (weak, nonatomic) IBOutlet UILabel *productRightPriceTextView;
@end

