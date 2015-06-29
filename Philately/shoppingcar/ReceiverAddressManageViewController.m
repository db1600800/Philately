//注入网络请求,响应,等待提示



#import "ReceiverAddressManageViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
#import "ReceiverAddressManageTableViewCell.h"
//注入table功能
 NSString *ReceiverAddressManageIdentifier = @"ReceiverAddressManageTableViewCell";
@implementation ReceiverAddressManageViewController
@synthesize cacheCells;
//list
@synthesize tableView;
//back
@synthesize backButton;
//收货地址
@synthesize titleTextView;
//添加
@synthesize addButton;
NSMutableArray *listData;
- (void)viewDidLoad
{
    [super viewDidLoad];
//table
    [tableView setDelegate:self];//指定委托
    [tableView setDataSource:self];//指定数据委托
     cacheCells = [NSMutableDictionary dictionary];
    
    //使用自定义的Cell,需要向UITableView进行注册
    UINib *cellNib = [UINib nibWithNibName:@"ReceiverAddressManageTableViewCell" bundle:nil];
    [tableView registerNib:cellNib forCellReuseIdentifier:ReceiverAddressManageIdentifier];
 // UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handTap)];
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

 ReceiverAddressManageTableViewCell *cell = (ReceiverAddressManageTableViewCell*)[self.tableView dequeueReusableCellWithIdentifier:ReceiverAddressManageIdentifier];
    if (!cell)
    {
       cell = [[[NSBundle mainBundle] loadNibNamed:@"ReceiverAddressManageTableViewCell" owner:self options:nil] lastObject];
    }
////right
//[cell.rightImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).rightImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////524000
//cell.postcodeTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).postcodeTextView;
////广东省东莞
//cell.addressTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).addressTextView;
////13923
//cell.phoneTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).phoneTextView;
////大大白
//cell.receiverValueTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).receiverValueTextView;
////收货人:
//cell.reciverTitleTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).reciverTitleTextView;
////lineblack
//[cell.lineblackImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).lineblackImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////删除
//[cell.deleteButton setImage:[UIImage imageNamed:@"图片名"] forState:UIControlStateNormal];
//[cell.deleteButton setImage:[UIImage imageNamed:@"press图片名"] forState:UIControlStateSelected];
//cell.deleteButton.tag =  (indexPath.section)*1000+indexPath.row;
//[cell.deleteButton addTarget:self action:@selector(deleteButtonclicked:) forControlEvents:UIControlEventTouchUpInside];
//-(void)deleteButtonclicked:(UIButton *)btn{
//    int tab=btn.tag;
//    int row= btn.tag%1000;
//   int section=btn.tag/1000;
//  //btn.selected = !btn.selected;
////用于butoon做checkBox控件}
////默认地址
//cell.defaultAddressTitleTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).defaultAddressTitleTextView;
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

NSString *reuseIdentifier = ReceiverAddressManageIdentifier;
ReceiverAddressManageTableViewCell *cell= [self.cacheCells objectForKey:reuseIdentifier];
if (!cell) {
  cell=[self.tableView dequeueReusableCellWithIdentifier:ReceiverAddressManageIdentifier];
  [self.cacheCells setObject:cell forKey:reuseIdentifier];
}

////right
//[cell.rightImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).rightImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////524000
//cell.postcodeTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).postcodeTextView;
////广东省东莞
//cell.addressTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).addressTextView;
////13923
//cell.phoneTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).phoneTextView;
////大大白
//cell.receiverValueTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).receiverValueTextView;
////收货人:
//cell.reciverTitleTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).reciverTitleTextView;
////lineblack
//[cell.lineblackImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).lineblackImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////删除
//[cell.deleteButton setImage:[UIImage imageNamed:@"图片名"] forState:UIControlStateNormal];
//[cell.deleteButton setImage:[UIImage imageNamed:@"press图片名"] forState:UIControlStateSelected];
//cell.deleteButton.tag =  (indexPath.section)*1000+indexPath.row;
//[cell.deleteButton addTarget:self action:@selector(deleteButtonclicked:) forControlEvents:UIControlEventTouchUpInside];
//-(void)deleteButtonclicked:(UIButton *)btn{
//    int tab=btn.tag;
//    int row= btn.tag%1000;
//   int section=btn.tag/1000;
//  //btn.selected = !btn.selected;
////用于butoon做checkBox控件}
////默认地址
//cell.defaultAddressTitleTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).defaultAddressTitleTextView;
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

//收货地址
//[titleTextView setValue:]
}





///*收货地址查询0011*/
//NSString  *n0011=@"0011";
///*收货地址查询0011*/
//-(void) request0011{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 会员编号 备注:必填*/
//[businessparam setValue:@"" forKey:@"cstmNo"];
///* 默认地址查询标志 备注:选填*/
//[businessparam setValue:@"" forKey:@"isDefaultAddress"];
///* 当前页码 备注:必填*/
//[businessparam setValue:@"" forKey:@"pageCode"];
///* 页码大小 备注:必填*/
//[businessparam setValue:@"" forKey:@"pageNum"];
// [serviceInvoker callWebservice:businessparam formName:n0011 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0011?parameter=";
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




///*收货地址删除0013*/
//NSString  *n0013=@"0013";
///*收货地址删除0013*/
//-(void) request0013{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 会员编号 备注:必填*/
//[businessparam setValue:@"" forKey:@"cstmNo"];
///* 收货地址编号 备注:必填*/
//[businessparam setValue:@"" forKey:@"addressID"];
// [serviceInvoker callWebservice:businessparam formName:n0013 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0013?parameter=";
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
///*收货地址查询0011*/
//if ([requestCode isEqualToString:n0011]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0011 *commonItem=[[RespondParam0011alloc]init];
///* 最大记录数 备注:*/
//commonItem.totalNum=[returnDataBody objectForKey:@"totalNum"];
///* 本次返回的记录数 备注:循环域开始*/
//commonItem.recordNum=[returnDataBody objectForKey:@"recordNum"];
///* 收货地址编号 备注:*/
//commonItem.addressID=[returnDataBody objectForKey:@"addressID"];
///* 收货人姓名 备注:*/
//commonItem.recvName=[returnDataBody objectForKey:@"recvName"];
///* 省份代号 备注:*/
//commonItem.provCode=[returnDataBody objectForKey:@"provCode"];
///* 市代号 备注:*/
//commonItem.cityCode=[returnDataBody objectForKey:@"cityCode"];
///* 县代号 备注:*/
//commonItem.countCode=[returnDataBody objectForKey:@"countCode"];
///* 详细地址 备注:*/
//commonItem.detailAddress=[returnDataBody objectForKey:@"detailAddress"];
///* 收件手机号码 备注:*/
//commonItem.mobileNo=[returnDataBody objectForKey:@"mobileNo"];
///* 邮编 备注:*/
//commonItem.postCode=[returnDataBody objectForKey:@"postCode"];
///* 是否默认地址 备注:0：是
//其它：否*/
//commonItem.isDefaultAddress=[returnDataBody objectForKey:@"isDefaultAddress"];
///* 本次返回的记录数 备注:循环域结束*/
//commonItem.recordNum=[returnDataBody objectForKey:@"recordNum"];
//}
//
//
//
//
//NSMutableArray *listData=[[NSMutableArray alloc]init];
///*收货地址删除0013*/
//if ([requestCode isEqualToString:n0013]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0013 *commonItem=[[RespondParam0013alloc]init];
//}
//



