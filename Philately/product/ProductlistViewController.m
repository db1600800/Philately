//注入网络请求,响应,等待提示



#import "ProductlistViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
#import "ProductlistTableViewCell.h"
//注入table功能
 NSString *ProductlistIdentifier = @"ProductlistTableViewCell";
@implementation ProductlistViewController
@synthesize cacheCells;
//list
@synthesize tableView;
//back
@synthesize backButton;
//邮票
@synthesize titleTextView;
//car
@synthesize carImageView;
//9
@synthesize carnumTextView;
//默认
@synthesize defaultTextView;
//价格
@synthesize priceTextView;
//down
@synthesize downImageView;
//分类
@synthesize classTextView;

NSMutableArray *listData;
- (void)viewDidLoad
{
    [super viewDidLoad];
//table
    [tableView setDelegate:self];//指定委托
    [tableView setDataSource:self];//指定数据委托
     cacheCells = [NSMutableDictionary dictionary];
    
    //使用自定义的Cell,需要向UITableView进行注册
    UINib *cellNib = [UINib nibWithNibName:@"ProductlistTableViewCell" bundle:nil];
    [tableView registerNib:cellNib forCellReuseIdentifier:ProductlistIdentifier];
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handTap)];
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

 ProductlistTableViewCell *cell = (ProductlistTableViewCell*)[self.tableView dequeueReusableCellWithIdentifier:ProductlistIdentifier];
    if (!cell)
    {
       cell = [[[NSBundle mainBundle] loadNibNamed:@"ProductlistTableViewCell" owner:self options:nil] lastObject];
    }
////120
//cell.productRightPriceTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).productRightPriceTextView;
////productRightName
//cell.productRightNameTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).productRightNameTextView;
////productRigthPic
//[cell.productRightPicImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).productRightPicImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////120
//cell.productleftPriceTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).productleftPriceTextView;
////productleftname
//cell.productleftnameTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).productleftnameTextView;
////productpicleft
//[cell.productpicleftImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).productpicleftImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
return cell;
    
}

//关键方法，获取复用的Cell后模拟赋值，然后取得Cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

NSString *reuseIdentifier = ProductlistIdentifier;
ProductlistTableViewCell *cell= [self.cacheCells objectForKey:reuseIdentifier];
if (!cell) {
  cell=[self.tableView dequeueReusableCellWithIdentifier:ProductlistIdentifier];
  [self.cacheCells setObject:cell forKey:reuseIdentifier];
}

////120
//cell.productRightPriceTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).productRightPriceTextView;
////productRightName
//cell.productRightNameTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).productRightNameTextView;
////productRigthPic
//[cell.productRightPicImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).productRightPicImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////120
//cell.productleftPriceTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).productleftPriceTextView;
////productleftname
//cell.productleftnameTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).productleftnameTextView;
////productpicleft
//[cell.productpicleftImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).productpicleftImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];

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

////邮票
//[titleTextView setValue:]
////car
//[carImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[carImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////9
//[carnumTextView setValue:]
////默认
//[defaultTextView setValue:]
////价格
//[priceTextView setValue:]
////down
//[downImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[downImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////分类
//[classTextView setValue:]
}





///*商品分类查询0024*/
//NSString  *n0024=@"0024";
///*商品分类查询0024*/
//-(void) request0024{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 业务代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"busiNo"];
///* 父类别代号 备注:选填*/
//[businessparam setValue:@"" forKey:@"parentNo"];
///* 当前页码 备注:必填*/
//[businessparam setValue:@"" forKey:@"pageCode"];
///* 页码大小 备注:必填*/
//[businessparam setValue:@"" forKey:@"pageNum"];
// [serviceInvoker callWebservice:businessparam formName:n0024 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0024?parameter=";
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
//
//
//
//
///*商品列表查询0025*/
//NSString  *n0025=@"0025";
///*商品列表查询0025*/
//-(void) request0025{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 业务代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"busiNo"];
///* 商品分类代号 备注:选填*/
//[businessparam setValue:@"" forKey:@"subBusiNo"];
///* 上架机构代号 备注:选填*/
//[businessparam setValue:@"" forKey:@"brchNo"];
///* 排序方式 备注:选填*/
//[businessparam setValue:@"" forKey:@"sortType"];
///* 排序字段 备注:选填*/
//[businessparam setValue:@"" forKey:@"sort FieldID"];
///* 当前页码 备注:必填*/
//[businessparam setValue:@"" forKey:@"pageCode"];
///* 页码大小 备注:必填*/
//[businessparam setValue:@"" forKey:@"pageNum"];
// [serviceInvoker callWebservice:businessparam formName:n0025 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0025?parameter=";
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
///*商品分类查询0024*/
//if ([requestCode isEqualToString:n0024]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0024 *commonItem=[[RespondParam0024alloc]init];
///* 最大记录数 备注:*/
//commonItem.totalNum=[returnDataBody objectForKey:@"totalNum"];
///* 本次返回的记录数 备注:循环域开始*/
//commonItem.recordNum=[returnDataBody objectForKey:@"recordNum"];
///* 商品类别代号 备注:*/
//commonItem.merchType=[returnDataBody objectForKey:@"merchType"];
///* 商品类别名称 备注:*/
//commonItem.merchTypeName=[returnDataBody objectForKey:@"merchTypeName"];
///* 本次返回的记录数 备注:循环域结束*/
//commonItem.recordNum=[returnDataBody objectForKey:@"recordNum"];
//}
//
//
//
//
//NSMutableArray *listData=[[NSMutableArray alloc]init];
///*商品列表查询0025*/
//if ([requestCode isEqualToString:n0025]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0025 *commonItem=[[RespondParam0025alloc]init];
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



