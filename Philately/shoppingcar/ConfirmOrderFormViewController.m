//注入网络请求,响应,等待提示



#import "ConfirmOrderFormViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
@implementation ConfirmOrderFormViewController
//productlist
@synthesize productlistImageView;
//商品列表
@synthesize productlistTitleTextView;
//back
@synthesize backImageView;
//确认订单
@synthesize titleTextView;
//addressPoint
@synthesize addressPointImageView;
//配送地址
@synthesize addressTitleTextView;
//收件人
@synthesize receiverTitleTextView;
//张三
@synthesize receiverValueTextView;
//13339489
@synthesize receiverPhoneTextView;
//广东省什么
@synthesize receiverAddressTextView;
//寄递
@synthesize receiverWayTitleTextView;
//right
@synthesize rightButton;
//营销员号:
@synthesize salerNoTitleTextView;
//请输入营销员号
@synthesize salerNoValueEditText;
//验证码:
@synthesize codeTitleTextView;
//请输入验证码
@synthesize codeValueEditText;
//获取验证码
@synthesize getCodeButton;
//合计:
@synthesize totalTitleTextView;
//¥170
@synthesize totalValueTextView;
//提交订单
@synthesize submitOrderFromTextView;
- (void)viewDidLoad
{
    [super viewDidLoad];
  //UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handTap)];
    //[self.modifyPwdTextView addGestureRecognizer:tap];
}

//-(void)handTap{
//    [self presentViewController:updatePwdViewController animated:NO completion:^{}];
//[self dismissViewControllerAnimated:NO completion:^(){}]; 
//};
-(void) viewWillAppear:(BOOL)animated{
}


-(void) setUiValue{

////productlist
//[productlistImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[productlistImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////商品列表
//[productlistTitleTextView setValue:]
////back
//[backImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[backImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////确认订单
//[titleTextView setValue:]
////addressPoint
//[addressPointImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[addressPointImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////配送地址
//[addressTitleTextView setValue:]
////收件人
//[receiverTitleTextView setValue:]
////张三
//[receiverValueTextView setValue:]
////13339489
//[receiverPhoneTextView setValue:]
////广东省什么
//[receiverAddressTextView setValue:]
////寄递
//[receiverWayTitleTextView setValue:]
////营销员号:
//[salerNoTitleTextView setValue:]
////请输入营销员号
//[salerNoValueEditText setValue:]
////验证码:
//[codeTitleTextView setValue:]
////请输入验证码
//[codeValueEditText setValue:]
////合计:
//[totalTitleTextView setValue:]
////¥170
//[totalValueTextView setValue:]
////提交订单
//[submitOrderFromTextView setValue:]
}




//
///*订单预处理0037*/
//NSString  *n0037=@"0037";
///*订单预处理0037*/
//-(void) request0037{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 会员编号 备注:必填*/
//[businessparam setValue:@"" forKey:@"cstmNo"];
///* 业务代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"busiNo"];
///* 渠道代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"channelNo"];
///* 配送方式 备注:必填*/
//[businessparam setValue:@"" forKey:@"shipType"];
///* 结算商品数量 备注:必填*/
//[businessparam setValue:@"" forKey:@"recordNum"];
///* 业务代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"busiNo"];
///* 商品代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"merchID"];
///* 商品名称 备注:必填*/
//[businessparam setValue:@"" forKey:@"merchName"];
///* 商品规格 备注:必填*/
//[businessparam setValue:@"" forKey:@"normsType"];
///* 购买价格 备注:必填*/
//[businessparam setValue:@"" forKey:@"buyPrice"];
///* 结算的商品 备注:必填*/
//[businessparam setValue:@"" forKey:@"recordNum"];
// [serviceInvoker callWebservice:businessparam formName:n0037 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0037?parameter=";
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
///*订单生成0038*/
//NSString  *n0038=@"0038";
///*订单生成0038*/
//-(void) request0038{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 下单数量 备注:*/
//[businessparam setValue:@"" forKey:@"orderBookNum"];
///* 预处理单号 备注:必填*/
//[businessparam setValue:@"" forKey:@"prepNumber"];
///* 会员编号 备注:必填*/
//[businessparam setValue:@"" forKey:@"cstmNo"];
///* 业务代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"busiNo"];
///* 配送方式 备注:必填*/
//[businessparam setValue:@"" forKey:@"shipType"];
///* 自提网点代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"brchNo"];
///* 收货人姓名 备注:必填*/
//[businessparam setValue:@"" forKey:@"recvName"];
///* 省份代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"provCode"];
///* 市代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"cityCode"];
///* 县代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"countCode"];
///* 详细地址 备注:必填*/
//[businessparam setValue:@"" forKey:@"detailAddress"];
///* 收件手机号码 备注:必填*/
//[businessparam setValue:@"" forKey:@"mobileNo"];
///* 邮编 备注:选填*/
//[businessparam setValue:@"" forKey:@"postCode"];
///* 订单总金额 备注:必填*/
//[businessparam setValue:@"" forKey:@"orderAmt"];
///* 订单备注信息 备注:选填*/
//[businessparam setValue:@"" forKey:@"orderRemark"];
///* 发票开具类型 备注:必填*/
//[businessparam setValue:@"" forKey:@"invoiceType"];
///* 发票抬头 备注:选填*/
//[businessparam setValue:@"" forKey:@"invoiceTitle"];
///* 手机验证码 备注:必填*/
//[businessparam setValue:@"" forKey:@"verificationCode"];
///* 营业员联系方式 备注:选填*/
//[businessparam setValue:@"" forKey:@"brchMobNum"];
///* 下单数量 备注:*/
//[businessparam setValue:@"" forKey:@"orderBookNum"];
///* 预受理单关联商品数量 备注:必填*/
//[businessparam setValue:@"" forKey:@"merchInfoNum"];
///* 关联预受理单编号 备注:必填*/
//[businessparam setValue:@"" forKey:@"LinkprepNumber"];
///* 业务代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"busiNo"];
///* 商品代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"merchID"];
///* 商品规格 备注:必填*/
//[businessparam setValue:@"" forKey:@"normsType"];
///* 商品价格 备注:必填*/
//[businessparam setValue:@"" forKey:@"merchPrice"];
///* 购买价格 备注:必填*/
//[businessparam setValue:@"" forKey:@"buyPrice"];
///* 预受理单关联商品数量 备注:*/
//[businessparam setValue:@"" forKey:@"merchInfoNum"];
// [serviceInvoker callWebservice:businessparam formName:n0038 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0038?parameter=";
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
///*订单支付流水生成0039*/
//NSString  *n0039=@"0039";
///*订单支付流水生成0039*/
//-(void) request0039{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 会员编号 备注:必填*/
//[businessparam setValue:@"" forKey:@"cstmNo"];
///* 订单数量 备注:必填*/
//[businessparam setValue:@"" forKey:@"orderNoNum"];
///* 订单号 备注:必填*/
//[businessparam setValue:@"" forKey:@"orderNo"];
///* 支付方式 备注:必填*/
//[businessparam setValue:@"" forKey:@"payType"];
///* 订单数量 备注:必填*/
//[businessparam setValue:@"" forKey:@"orderNoNum"];
// [serviceInvoker callWebservice:businessparam formName:n0039 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0039?parameter=";
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
@end



//NSMutableArray *listData=[[NSMutableArray alloc]init];
///*订单预处理0037*/
//if ([requestCode isEqualToString:n0037]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0037 *commonItem=[[RespondParam0037alloc]init];
///* 预受理单数量 备注:循环域开始*/
//commonItem.preOrderNum=[returnDataBody objectForKey:@"preOrderNum"];
///* 预处理单编号 备注:2015/6/17增加*/
//commonItem.prepNumber=[returnDataBody objectForKey:@"prepNumber"];
///* 配送方式 备注:*/
//commonItem.shipType=[returnDataBody objectForKey:@"shipType"];
///* 预受理单数量 备注:循环域结束*/
//commonItem.preOrderNum=[returnDataBody objectForKey:@"preOrderNum"];
///* 预受理单关联商品数量 备注:2015/6/17增加
//循环域开始*/
//commonItem.merchInfoNum=[returnDataBody objectForKey:@"merchInfoNum"];
///* 关联预受理单编号 备注:为了避免嵌套循环，通过预受理单关联对应的商品，一个预受理单可关联多个商品*/
//commonItem.LinkprepNumber1=[returnDataBody objectForKey:@"LinkprepNumber1"];
///* 业务代号 备注:*/
//commonItem.busiNo=[returnDataBody objectForKey:@"busiNo"];
///* 商品代号 备注:*/
//commonItem.merchID=[returnDataBody objectForKey:@"merchID"];
///* 商品规格 备注:单张、四方连*/
//commonItem.normsType=[returnDataBody objectForKey:@"normsType"];
///* 商品价格 备注:*/
//commonItem.merchPrice=[returnDataBody objectForKey:@"merchPrice"];
///* 购买价格 备注:*/
//commonItem.buyPrice=[returnDataBody objectForKey:@"buyPrice"];
///* 预受理单关联商品数量 备注:2015/6/17增加
//循环域结束*/
//commonItem.merchInfoNum=[returnDataBody objectForKey:@"merchInfoNum"];
///* 预受理单关联配送模式数量 备注:2015/6/17增加
//循环域开始*/
//commonItem.shipModeNum=[returnDataBody objectForKey:@"shipModeNum"];
///* 关联预受理单编号 备注:为了避免嵌套循环，通过预受理单关联对应的佩服模式，一个预受理单可关联配送模式*/
//commonItem.LinkprepNumber1=[returnDataBody objectForKey:@"LinkprepNumber1"];
///* 配送模式 备注:01：EMS
//02：小包*/
//commonItem.shipMode=[returnDataBody objectForKey:@"shipMode"];
///* 配送费用 备注:*/
//commonItem.shipFee=[returnDataBody objectForKey:@"shipFee"];
///* 预受理单关联配送费用 备注:2015/6/17增加
//循环域结束*/
//commonItem.shipModeNum=[returnDataBody objectForKey:@"shipModeNum"];
//}
//
//
//
//
//NSMutableArray *listData=[[NSMutableArray alloc]init];
///*订单生成0038*/
//if ([requestCode isEqualToString:n0038]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0038 *commonItem=[[RespondParam0038alloc]init];
///* 订单数量 备注:循环域开始*/
//commonItem.orderNoNum=[returnDataBody objectForKey:@"orderNoNum"];
///* 订单号 备注:*/
//commonItem.orderNo=[returnDataBody objectForKey:@"orderNo"];
///* 个性化订单号 备注:默认为空*/
//commonItem.perOrderId=[returnDataBody objectForKey:@"perOrderId"];
///* 订单总金额 备注:*/
//commonItem.orderTotalAmount=[returnDataBody objectForKey:@"orderTotalAmount"];
///* 运费 备注:*/
//commonItem.freight=[returnDataBody objectForKey:@"freight"];
///* 订单数量 备注:循环域结束*/
//commonItem.orderNoNum=[returnDataBody objectForKey:@"orderNoNum"];
//}
//
//
//
//
//NSMutableArray *listData=[[NSMutableArray alloc]init];
///*订单支付流水生成0039*/
//if ([requestCode isEqualToString:n0039]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0039 *commonItem=[[RespondParam0039alloc]init];
///* 支付流水 备注:*/
//commonItem.paySeq=[returnDataBody objectForKey:@"paySeq"];
///* 应付金额 备注:*/
//commonItem.payAmt=[returnDataBody objectForKey:@"payAmt"];
//}
//
//
//
