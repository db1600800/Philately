//注入网络请求,响应,等待提示



#import "OrderFormDetailViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
@implementation OrderFormDetailViewController
//back
@synthesize backImageView;
//订单详情
@synthesize titleTextView;
//业务类型
@synthesize businessTypeTitleTextView;
//新邮预订
@synthesize businessTypeValueTextView;
//订单号:
@synthesize orderFormNoTitleTextView;
//13434
@synthesize orderFormNoValueTextView;
//订单状态
@synthesize orderFormStateTitleTextView;
//已支付
@synthesize orderFromStateValueTextView;
//下单时间
@synthesize orderFormTimeTitleTextView;
//20150303
@synthesize orderFormTimeValueTextView;
//处理状态
@synthesize dealStateTitleTextView;
//未处理
@synthesize dealStateValueTextView;
//已支付
@synthesize aleadyPayTitleTextView;
//233.00
@synthesize aleadyPayValueTextView;
//订单金额
@synthesize totalMoneyTitleTextView;
//253.00
@synthesize totalMoneyValueTextView;
//补款
@synthesize needPayTitleTextView;
//¥20
@synthesize needPayValueTextView;
//配送方式
@synthesize deliverWayTitleTextView;
//自提
@synthesize deliverWayTextView;
//广州市区
@synthesize deliverWayAddressTextView;
//收货人信息
@synthesize receiverInfoTitleTextView;
//周小五
@synthesize receiverNameTextView;
//158444399
@synthesize receiverPhoneTextView;
//广州市
@synthesize receiverAddressTextView;
//商品信息
@synthesize productTitleTextView;
//发票信息
@synthesize invoiceInfoTextView;
//个人发票
@synthesize invoiceTypeTextView;
//李四
@synthesize invoiceUserNameTextView;
//营销员号
@synthesize salerNoTitleTextView;
//3443
@synthesize salerNoValueTextView;
//去补款20元
@synthesize gotoPayButton;
- (void)viewDidLoad
{
    [super viewDidLoad];
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handTap)];
   // [self.modifyPwdTextView addGestureRecognizer:tap];
    
    self.scrollview.contentSize= CGSizeMake(320,610);
}

//-(void)handTap{
//    [self presentViewController:updatePwdViewController animated:NO completion:^{}];
//[self dismissViewControllerAnimated:NO completion:^(){}]; 
//};
-(void) viewWillAppear:(BOOL)animated{
}


-(void) setUiValue{

////back
//[backImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[backImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////订单详情
//[titleTextView setValue:]
////业务类型
//[businessTypeTitleTextView setValue:]
////新邮预订
//[businessTypeValueTextView setValue:]
////订单号:
//[orderFormNoTitleTextView setValue:]
////13434
//[orderFormNoValueTextView setValue:]
////订单状态
//[orderFormStateTitleTextView setValue:]
////已支付
//[orderFromStateValueTextView setValue:]
////下单时间
//[orderFormTimeTitleTextView setValue:]
////20150303
//[orderFormTimeValueTextView setValue:]
////处理状态
//[dealStateTitleTextView setValue:]
////未处理
//[dealStateValueTextView setValue:]
////已支付
//[aleadyPayTitleTextView setValue:]
////233.00
//[aleadyPayValueTextView setValue:]
////订单金额
//[totalMoneyTitleTextView setValue:]
////253.00
//[totalMoneyValueTextView setValue:]
////补款
//[needPayTitleTextView setValue:]
////¥20
//[needPayValueTextView setValue:]
////配送方式
//[deliverWayTitleTextView setValue:]
////自提
//[deliverWayTextView setValue:]
////广州市区
//[deliverWayAddressTextView setValue:]
////收货人信息
//[receiverInfoTitleTextView setValue:]
////周小五
//[receiverNameTextView setValue:]
////158444399
//[receiverPhoneTextView setValue:]
////广州市
//[receiverAddressTextView setValue:]
////商品信息
//[productTitleTextView setValue:]
////发票信息
//[invoiceInfoTextView setValue:]
////个人发票
//[invoiceTypeTextView setValue:]
////李四
//[invoiceUserNameTextView setValue:]
////营销员号
//[salerNoTitleTextView setValue:]
////3443
//[salerNoValueTextView setValue:]
}





///*订单详情0041*/
//NSString  *n0041=@"0041";
///*订单详情0041*/
//-(void) request0041{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 会员编号 备注:必填*/
//[businessparam setValue:@"" forKey:@"cstmNo"];
///* 订单号 备注:必填*/
//[businessparam setValue:@"" forKey:@"orderNo"];
// [serviceInvoker callWebservice:businessparam formName:n0041 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0041?parameter=";
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
///*订单取消0042*/
//NSString  *n0042=@"0042";
///*订单取消0042*/
//-(void) request0042{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 订单号 备注:必填*/
//[businessparam setValue:@"" forKey:@"orderNo"];
///* 取消原因 备注:选填*/
//[businessparam setValue:@"" forKey:@"cancelReason"];
// [serviceInvoker callWebservice:businessparam formName:n0042 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0042?parameter=";
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
///*收货确认0043*/
//NSString  *n0043=@"0043";
///*收货确认0043*/
//-(void) request0043{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 会员编号 备注:必填*/
//[businessparam setValue:@"" forKey:@"cstmNo"];
///* 订单号 备注:必填*/
//[businessparam setValue:@"" forKey:@"orderNo"];
// [serviceInvoker callWebservice:businessparam formName:n0043 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0043?parameter=";
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
///*订单详情0041*/
//if ([requestCode isEqualToString:n0041]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0041 *commonItem=[[RespondParam0041alloc]init];
///* 订单号 备注:*/
//commonItem.orderNo=[returnDataBody objectForKey:@"orderNo"];
///* 业务代号 备注:*/
//commonItem.busiNo=[returnDataBody objectForKey:@"busiNo"];
///* 渠道代号 备注:*/
//commonItem.channelNo=[returnDataBody objectForKey:@"channelNo"];
///* 支付方式 备注:*/
//commonItem.payType=[returnDataBody objectForKey:@"payType"];
///* 下单日期 备注:*/
//commonItem.bookDate=[returnDataBody objectForKey:@"bookDate"];
///* 处理机构 备注:*/
//commonItem.dealBrch=[returnDataBody objectForKey:@"dealBrch"];
///* 支付状态 备注:*/
//commonItem.payStatus=[returnDataBody objectForKey:@"payStatus"];
///* 处理状态 备注:*/
//commonItem.dealStatus=[returnDataBody objectForKey:@"dealStatus"];
///* 配送方式 备注:自提方式：自提网点代号 、自提码生效；
//寄递方式：收件人信息 生效*/
//commonItem.shipType=[returnDataBody objectForKey:@"shipType"];
///* 自提网点代号 备注:*/
//commonItem.brchNo=[returnDataBody objectForKey:@"brchNo"];
///* 自提码 备注:*/
//commonItem.toTheCode=[returnDataBody objectForKey:@"toTheCode"];
///* 收货人姓名 备注:收件人信息*/
//commonItem.recvName=[returnDataBody objectForKey:@"recvName"];
///* 详细地址 备注:*/
//commonItem.detailAddress=[returnDataBody objectForKey:@"detailAddress"];
///* 收件手机号码 备注:*/
//commonItem.mobileNo=[returnDataBody objectForKey:@"mobileNo"];
///* 邮编 备注:*/
//commonItem.postCode=[returnDataBody objectForKey:@"postCode"];
///* 订单总金额 备注:*/
//commonItem.orderAmt=[returnDataBody objectForKey:@"orderAmt"];
///* 商品总金额 备注:*/
//commonItem.merchAmt=[returnDataBody objectForKey:@"merchAmt"];
///* 配送费用 备注:*/
//commonItem.shipFee=[returnDataBody objectForKey:@"shipFee"];
///* 已付金额 备注:*/
//commonItem.hasPayMoney=[returnDataBody objectForKey:@"hasPayMoney"];
///* 订单备注信息 备注:*/
//commonItem.orderRemark=[returnDataBody objectForKey:@"orderRemark"];
///* 发票开具类型 备注:不开、个人、单位*/
//commonItem.invoiceType=[returnDataBody objectForKey:@"invoiceType"];
///* 发票抬头 备注:当发票类型为“单位”时生效*/
//commonItem.invoiceTitle=[returnDataBody objectForKey:@"invoiceTitle"];
///* 预处理单号 备注:个性化定制业务才有预处理单号*/
//commonItem.prepNumber=[returnDataBody objectForKey:@"prepNumber"];
///* 操作类型 备注:支付、取消、换货等*/
//commonItem.operationType=[returnDataBody objectForKey:@"operationType"];
///* 操作截止日期 备注:*/
//commonItem.operationEndDate=[returnDataBody objectForKey:@"operationEndDate"];
///* 处理时间 备注:yymmddhhmmss*/
//commonItem.dealTime=[returnDataBody objectForKey:@"dealTime"];
///* 处理类型 备注:*/
//commonItem.dealType=[returnDataBody objectForKey:@"dealType"];
///* 处理内容 备注:*/
//commonItem.dealContent=[returnDataBody objectForKey:@"dealContent"];
///* 处理人 备注:*/
//commonItem.dealPerson=[returnDataBody objectForKey:@"dealPerson"];
///* 事件类型 备注:退款、补款、摇号、换货*/
//commonItem.eventType=[returnDataBody objectForKey:@"eventType"];
///* 事件状态 备注:未审核、审核通过、审核不通过等*/
//commonItem.eventStatus=[returnDataBody objectForKey:@"eventStatus"];
///* 事件描述 备注:*/
//commonItem.eventDesc=[returnDataBody objectForKey:@"eventDesc"];
///* 支付流水 备注:*/
//commonItem.paySeq=[returnDataBody objectForKey:@"paySeq"];
///* 支付流水状态 备注:支付、退款、补款*/
//commonItem.paySeqStatus=[returnDataBody objectForKey:@"paySeqStatus"];
///* 金额 备注:*/
//commonItem.payMoney=[returnDataBody objectForKey:@"payMoney"];
///* 流水操作状态 备注:*/
//commonItem.payOperStatus=[returnDataBody objectForKey:@"payOperStatus"];
///* 操作时间 备注:*/
//commonItem.payDealTime=[returnDataBody objectForKey:@"payDealTime"];
///* 银行流水 备注:*/
//commonItem.bankSeq=[returnDataBody objectForKey:@"bankSeq"];
///* 备注 备注:*/
//commonItem.payRemark=[returnDataBody objectForKey:@"payRemark"];
///* 子订单数量 备注:循环域开始*/
//commonItem.subOrderNum=[returnDataBody objectForKey:@"subOrderNum"];
///* 子订单号 备注:*/
//commonItem.subOrderNo1=[returnDataBody objectForKey:@"subOrderNo1"];
///* 子订单状态 备注:*/
//commonItem.subOrderStatus=[returnDataBody objectForKey:@"subOrderStatus"];
///* 子订单总金额 备注:*/
//commonItem.subOrderAmt=[returnDataBody objectForKey:@"subOrderAmt"];
///* 商品总金额 备注:*/
//commonItem.subMerchAmt=[returnDataBody objectForKey:@"subMerchAmt"];
///* 配送费用 备注:*/
//commonItem.subShipFee=[returnDataBody objectForKey:@"subShipFee"];
///* 子订单数量 备注:循环域结束*/
//commonItem.subOrderNum=[returnDataBody objectForKey:@"subOrderNum"];
///* 子订单号 备注:*/
//commonItem.subOrderNo2=[returnDataBody objectForKey:@"subOrderNo2"];
///* 处理时间 备注:yymmddhhmmss*/
//commonItem.subdealTime=[returnDataBody objectForKey:@"subdealTime"];
///* 处理类型 备注:*/
//commonItem.subdealType=[returnDataBody objectForKey:@"subdealType"];
///* 处理内容 备注:*/
//commonItem.subdealContent=[returnDataBody objectForKey:@"subdealContent"];
///* 处理人 备注:*/
//commonItem.subdealPerson=[returnDataBody objectForKey:@"subdealPerson"];
///* 子订单号 备注:*/
//commonItem.subOrderNo3=[returnDataBody objectForKey:@"subOrderNo3"];
///* 物流公司 备注:*/
//commonItem.logistCompany=[returnDataBody objectForKey:@"logistCompany"];
///* 物流单号 备注:yymmddhhmmss*/
//commonItem.logistNum=[returnDataBody objectForKey:@"logistNum"];
///* 处理时间 备注:yymmddhhmmss*/
//commonItem.logistDealTime=[returnDataBody objectForKey:@"logistDealTime"];
///* 商品代号 备注:*/
//commonItem.merchID=[returnDataBody objectForKey:@"merchID"];
///* 图片ID 备注:*/
//commonItem.merchPicID=[returnDataBody objectForKey:@"merchPicID"];
///* 商品名称 备注:*/
//commonItem.merchName=[returnDataBody objectForKey:@"merchName"];
///* 商品规格 备注:*/
//commonItem.normsType=[returnDataBody objectForKey:@"normsType"];
///* 模式单价 备注:*/
//commonItem.normsPrice=[returnDataBody objectForKey:@"normsPrice"];
///* 商品购买数量 备注:*/
//commonItem.merchNum=[returnDataBody objectForKey:@"merchNum"];
//}
//
//
//
//
//NSMutableArray *listData=[[NSMutableArray alloc]init];
///*订单取消0042*/
//if ([requestCode isEqualToString:n0042]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0042 *commonItem=[[RespondParam0042alloc]init];
//}
//
//
//
//
//NSMutableArray *listData=[[NSMutableArray alloc]init];
///*收货确认0043*/
//if ([requestCode isEqualToString:n0043]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0043 *commonItem=[[RespondParam0043alloc]init];
//}
//


