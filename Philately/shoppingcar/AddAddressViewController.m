//注入网络请求,响应,等待提示



#import "AddAddressViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
@implementation AddAddressViewController
//back
@synthesize backButton;
//新建地址
@synthesize titleTextView;
//保存
@synthesize saveButton;
//必填
@synthesize mustinputImageView;
//姓名
@synthesize usernameTitleTextView;
//最少两个字
@synthesize usernameValueEditText;
//lineblack
@synthesize lineblackImageView;
//手机
@synthesize phoneTitleTextView;
//请输入手机号码
@synthesize phoneValueTextView;
//地区
@synthesize areaTitleTextView;
//广东
@synthesize provinceTextView;
//down
@synthesize downImageView;
//东莞
@synthesize cityTextView;
//虎门
@synthesize streemTextView;
//地址
@synthesize addressTitleTextView;
//最少五个字，精确到门牌号
@synthesize addressValueTextView;
//邮编:
@synthesize areacodeTitleTextView;
//6位邮政编码
@synthesize areacodeValueEditText;
//check
@synthesize checkButton;
//设为默认地址
@synthesize defaultTextView;
- (void)viewDidLoad
{
    [super viewDidLoad];
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handTap)];
    //[self.modifyPwdTextView addGestureRecognizer:tap];
}

//-(void)handTap{
//    [self presentViewController:updatePwdViewController animated:NO completion:^{}];
//[self dismissViewControllerAnimated:NO completion:^(){}]; 
//}

-(void) viewWillAppear:(BOOL)animated{
}


-(void) setUiValue{

////新建地址
//[titleTextView setValue:]
////必填
//[mustinputImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[mustinputImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////姓名
//[usernameTitleTextView setValue:]
////最少两个字
//[usernameValueEditText setValue:]
////lineblack
//[lineblackImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[lineblackImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////手机
//[phoneTitleTextView setValue:]
////请输入手机号码
//[phoneValueTextView setValue:]
////地区
//[areaTitleTextView setValue:]
////广东
//[provinceTextView setValue:]
////down
//[downImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[downImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////东莞
//[cityTextView setValue:]
////虎门
//[streemTextView setValue:]
////地址
//[addressTitleTextView setValue:]
////最少五个字，精确到门牌号
//[addressValueTextView setValue:]
////邮编:
//[areacodeTitleTextView setValue:]
////6位邮政编码
//[areacodeValueEditText setValue:]
////设为默认地址
//[defaultTextView setValue:]
}





///*收货地址新增0012*/
//NSString  *n0012=@"0012";
///*收货地址新增0012*/
//-(void) request0012{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 会员编号 备注:必填*/
//[businessparam setValue:@"" forKey:@"cstmNo"];
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
///* 是否默认地址 备注:必填*/
//[businessparam setValue:@"" forKey:@"isDefaultAddress"];
// [serviceInvoker callWebservice:businessparam formName:n0012 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0012?parameter=";
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
///*收货地址新增0012*/
//if ([requestCode isEqualToString:n0012]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0012 *commonItem=[[RespondParam0012alloc]init];
//}
//
//

