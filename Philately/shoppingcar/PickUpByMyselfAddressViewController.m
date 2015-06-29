//注入网络请求,响应,等待提示



#import "PickUpByMyselfAddressViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
#import "PickUpByMyselfAddressTableViewCell.h"
//注入table功能
 NSString *PickUpByMyselfAddressCellIdentifier = @"PickUpByMyselfAddressTableViewCell";
@implementation PickUpByMyselfAddressViewController
@synthesize cacheCells;
//list
@synthesize tableView;
//back
@synthesize backButton;
//选择自提点
@synthesize titleTextView;
//广东
@synthesize proviceTextView;
//down
@synthesize downImageView;
//linevertical
@synthesize lineverticalImageView;
//东莞市
@synthesize cityTextView;
//厚街
@synthesize streemTextView;
//query
@synthesize queryImageView;
//checkAgress
@synthesize checkAgressButton;
//我已阅读并同意自提协议
@synthesize agreemsgTextView;
//确定
@synthesize sureButton;
NSMutableArray *listData;
- (void)viewDidLoad
{
    [super viewDidLoad];
//table
    [tableView setDelegate:self];//指定委托
    [tableView setDataSource:self];//指定数据委托
     cacheCells = [NSMutableDictionary dictionary];
    
    //使用自定义的Cell,需要向UITableView进行注册
    UINib *cellNib = [UINib nibWithNibName:@"PickUpByMyselfAddressTableViewCell" bundle:nil];
    [tableView registerNib:cellNib forCellReuseIdentifier:PickUpByMyselfAddressCellIdentifier];
  //UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handTap)];
    //[self.modifyPwdTextView addGestureRecognizer:tap];
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

 PickUpByMyselfAddressTableViewCell *cell = (PickUpByMyselfAddressTableViewCell*)[self.tableView dequeueReusableCellWithIdentifier:PickUpByMyselfAddressCellIdentifier];
    if (!cell)
    {
       cell = [[[NSBundle mainBundle] loadNibNamed:@"PickUpByMyselfAddressTableViewCell" owner:self options:nil] lastObject];
    }
////广东省
//cell.addressTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).addressTextView;
////phone
//cell.phoneTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).phoneTextView;
////lineblack
//[cell.lineblackImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).lineblackImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////厚街网点
//cell.networkTitleTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).networkTitleTextView;
////check
//[cell.checkButton setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
//[cell.checkButton setImage:[UIImage imageNamed:@"presscheck"] forState:UIControlStateSelected];
//cell.checkButton.tag =  (indexPath.section)*1000+indexPath.row;
//[cell.checkButton addTarget:self action:@selector(checkButtonclicked:) forControlEvents:UIControlEventTouchUpInside];
//-(void)checkButtonclicked:(UIButton *)btn{
//    int tab=btn.tag;
//    int row= btn.tag%1000;
//   int section=btn.tag/1000;
//  //btn.selected = !btn.selected;
////用于butoon做checkBox控件}
return cell;
    
}

//关键方法，获取复用的Cell后模拟赋值，然后取得Cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

NSString *reuseIdentifier = PickUpByMyselfAddressCellIdentifier;
PickUpByMyselfAddressTableViewCell *cell= [self.cacheCells objectForKey:reuseIdentifier];
if (!cell) {
  cell=[self.tableView dequeueReusableCellWithIdentifier:PickUpByMyselfAddressCellIdentifier];
  [self.cacheCells setObject:cell forKey:reuseIdentifier];
}

////广东省
//cell.addressTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).addressTextView;
////phone
//cell.phoneTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).phoneTextView;
////lineblack
//[cell.lineblackImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).lineblackImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////厚街网点
//cell.networkTitleTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).networkTitleTextView;
////check
//[cell.checkButton setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
//[cell.checkButton setImage:[UIImage imageNamed:@"presscheck"] forState:UIControlStateSelected];
//cell.checkButton.tag =  (indexPath.section)*1000+indexPath.row;
//[cell.checkButton addTarget:self action:@selector(checkButtonclicked:) forControlEvents:UIControlEventTouchUpInside];
//-(void)checkButtonclicked:(UIButton *)btn{
//    int tab=btn.tag;
//    int row= btn.tag%1000;
//   int section=btn.tag/1000;
//  //btn.selected = !btn.selected;
////用于butoon做checkBox控件}

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

////选择自提点
//[titleTextView setValue:]
////广东
//[proviceTextView setValue:]
////down
//[downImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[downImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////linevertical
//[lineverticalImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[lineverticalImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////东莞市
//[cityTextView setValue:]
////厚街
//[streemTextView setValue:]
////query
//[queryImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[queryImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////我已阅读并同意自提协议
//[agreemsgTextView setValue:]
}





///*可选自提网点查询0029*/
//NSString  *n0029=@"0029";
///*可选自提网点查询0029*/
//-(void) request0029{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 会员编号 备注:必填*/
//[businessparam setValue:@"" forKey:@"cstmNo"];
///* 省份代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"provCode"];
///* 市代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"cityCode"];
///* 县代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"countCode"];
///* 结算商品数量 备注:必填*/
//[businessparam setValue:@"" forKey:@"recordNum"];
///* 业务代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"busiNo"];
///* 商品代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"merchID"];
///* 商品规格 备注:必填*/
//[businessparam setValue:@"" forKey:@"normsType"];
///* 结算商品数量 备注:必填*/
//[businessparam setValue:@"" forKey:@"recordNum"];
///* 当前页码 备注:必填*/
//[businessparam setValue:@"" forKey:@"pageCode"];
///* 页码大小 备注:必填*/
//[businessparam setValue:@"" forKey:@"pageNum"];
// [serviceInvoker callWebservice:businessparam formName:n0029 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0029?parameter=";
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
///*可选自提网点查询0029*/
//if ([requestCode isEqualToString:n0029]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0029 *commonItem=[[RespondParam0029alloc]init];
///* 最大记录数 备注:*/
//commonItem.totalNum=[returnDataBody objectForKey:@"totalNum"];
///* 本次返回的记录数 备注:循环域开始*/
//commonItem.recordNum=[returnDataBody objectForKey:@"recordNum"];
///* 自提网点代号 备注:*/
//commonItem.brchNo=[returnDataBody objectForKey:@"brchNo"];
///* 自提网点名称 备注:*/
//commonItem.brchName=[returnDataBody objectForKey:@"brchName"];
///* 网点地址 备注:*/
//commonItem.brchAddress=[returnDataBody objectForKey:@"brchAddress"];
///* 网点电话 备注:*/
//commonItem.brchTele=[returnDataBody objectForKey:@"brchTele"];
///* 返回的记录数 备注:循环域结束*/
//commonItem.recordNum=[returnDataBody objectForKey:@"recordNum"];
//}




