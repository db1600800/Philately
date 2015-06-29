//注入网络请求,响应,等待提示



#import "ShoppingCarEmptyViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
#import "ShoppingCarEmptyTableViewCell.h"
//注入table功能
 NSString *ShoppingCarEmptyIdentifier = @"ShoppingCarEmptyTableViewCell";
@implementation ShoppingCarEmptyViewController
@synthesize cacheCells;
//back
@synthesize backButton;
//购物车
@synthesize titleTextView;
//shoppingcar
@synthesize shoppingcarImageView;
//您的购物车是空的
@synthesize emptyTitleTextView;
//linehead
@synthesize lineheadImageView;
//热门推荐
@synthesize hotTitleTextView;
//linehead2
@synthesize linehead2ImageView;
//list
@synthesize tableView;
NSMutableArray *listData;
- (void)viewDidLoad
{
    [super viewDidLoad];
//table
    [tableView setDelegate:self];//指定委托
    [tableView setDataSource:self];//指定数据委托
     cacheCells = [NSMutableDictionary dictionary];
    
    //使用自定义的Cell,需要向UITableView进行注册
    UINib *cellNib = [UINib nibWithNibName:@"ShoppingCarEmptyTableViewCell" bundle:nil];
    [tableView registerNib:cellNib forCellReuseIdentifier:ShoppingCarEmptyIdentifier];
 // UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handTap)];
   // [self.modifyPwdTextView addGestureRecognizer:tap];
}

//-(void)handTap{
//    [self presentViewController:updatePwdViewController animated:NO completion:^{}];
//[self dismissViewControllerAnimated:NO completion:^(){}]; 
//}
-(void) viewWillAppear:(BOOL)animated{
//table
[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"";
  
}

//自定义SectionHeader
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

//自定义SectionHeader高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 22.0;
}

//指定有多少个分区(Section)，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;//返回标题数组中元素的个数来确定分区的个数
}

//指定每个分区中有多少行，默认为1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
     return  [listData count];;
    
}

//绘制Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

 ShoppingCarEmptyTableViewCell *cell = (ShoppingCarEmptyTableViewCell*)[self.tableView dequeueReusableCellWithIdentifier:ShoppingCarEmptyIdentifier];
    if (!cell)
    {
       cell = [[[NSBundle mainBundle] loadNibNamed:@"ShoppingCarEmptyTableViewCell" owner:self options:nil] lastObject];
    }
////hot3
//[cell.hot3ImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).hot3ImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////hot2
//[cell.hot2ImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).hot2ImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////hot1
//[cell.hot1ImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).hot1ImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
return cell;
    
}

//关键方法，获取复用的Cell后模拟赋值，然后取得Cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

NSString *reuseIdentifier = ShoppingCarEmptyIdentifier;
ShoppingCarEmptyTableViewCell *cell= [self.cacheCells objectForKey:reuseIdentifier];
if (!cell) {
  cell=[self.tableView dequeueReusableCellWithIdentifier:ShoppingCarEmptyIdentifier];
  [self.cacheCells setObject:cell forKey:reuseIdentifier];
}

////hot3
//[cell.hot3ImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).hot3ImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////hot2
//[cell.hot2ImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).hot2ImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////hot1
//[cell.hot1ImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).hot1ImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];

// CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];//autolayout有效 配合上边使用
   int height=cell.contentView.frame.size.height;//非动态高度(row1跟row2同样高)变化适用 不需配合上边使用   
return height+1;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88;
}

//点击后，过段时间cell自动取消选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //消除cell选择痕迹
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.05f];
}
- (void)deselect
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}
-(void) setUiValue{

////购物车
//[titleTextView setValue:]
////shoppingcar
//[shoppingcarImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[shoppingcarImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////您的购物车是空的
//[emptyTitleTextView setValue:]
////linehead
//[lineheadImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[lineheadImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////热门推荐
//[hotTitleTextView setValue:]
////linehead2
//[linehead2ImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[linehead2ImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
}





///*猜你喜欢0027*/
//NSString  *n0027=@"0027";
///*猜你喜欢0027*/
//-(void) request0027{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 商品代号 备注:选填*/
//[businessparam setValue:@"" forKey:@"merchID"];
///* 当前页码 备注:必填*/
//[businessparam setValue:@"" forKey:@"pageCode"];
///* 页码大小 备注:必填*/
//[businessparam setValue:@"" forKey:@"pageNum"];
// [serviceInvoker callWebservice:businessparam formName:n0027 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0027?parameter=";
//    NSString *fullUrl = [baseUrl stringByAppendingString:[businessparam JSONString]];
//    NSURL *url = [NSURL URLWithString:[fullUrl stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod:@"GET"];
//    [request setTimeoutInterval:30.0];
//    
//    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
//    [NSURLConnection sendAsynchronousRequest:request
//                                       queue:queue
//                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
//                               if (error) {
//                                   NSLog(@"Httperror:%@%d", error.localizedDescription,error.code);
//                               }else{
//                                   
//                                   NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
//                                   
//                                   NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                                   
//                                   NSLog(@"HttpResponseCode:%d", responseCode);
//                                   NSLog(@"HttpResponseBody %@",responseString);
//   dispatch_async(dispatch_get_main_queue(), ^{
//       [self.tableView reloadData];
//   });
//                               }
//                           }];
//}

@end



//NSMutableArray *listData=[[NSMutableArray alloc]init];
///*猜你喜欢0027*/
//if ([requestCode isEqualToString:n0027]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0027 *commonItem=[[RespondParam0027alloc]init];
///* 最大记录数 备注:*/
//commonItem.totalNum=[returnDataBody objectForKey:@"totalNum"];
///* 本次返回的记录数 备注:循环域开始*/
//commonItem.recordNum=[returnDataBody objectForKey:@"recordNum"];
///* 商品代号 备注:*/
//commonItem.merchID=[returnDataBody objectForKey:@"merchID"];
///* 商品名称 备注:*/
//commonItem.merchName=[returnDataBody objectForKey:@"merchName"];
///* 商品类别代号 备注:*/
//commonItem.merchType=[returnDataBody objectForKey:@"merchType"];
///* 商品价格 备注:*/
//commonItem.merchPrice=[returnDataBody objectForKey:@"merchPrice"];
///* 图片ID 备注:*/
//commonItem.merchPicID=[returnDataBody objectForKey:@"merchPicID"];
///* 本次返回的记录数 备注:循环域结束*/
//commonItem.recordNum=[returnDataBody objectForKey:@"recordNum"];
//}
//



