//注入网络请求,响应,等待提示



#import "FindPwdViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
@implementation FindPwdViewController
//找回新密码
@synthesize findpwdButton;
//back
@synthesize backImageView;
//找回密码
@synthesize titleTextView;
//手机号码
@synthesize phoneTitleTextView;
//请输入手机号
@synthesize phoneValueEditText;
//获取验证码
@synthesize getcodeButton;
//验证码
@synthesize codeTitleTextView;
//请输入验证码
@synthesize codeValueEditText;
//新密码
@synthesize newpwdTitleTextView;
//请输入新密码
@synthesize newpwdValueEditText;
//确认新密码
@synthesize newpwd2TitleTextView;
//请再输入新密码
@synthesize newpwd2ValueEditText;
- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated{
}


-(void) setUiValue{

////back
//[backImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[backImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////找回密码
//[titleTextView setValue:]
////手机号码
//[phoneTitleTextView setValue:]
////请输入手机号
//[phoneValueEditText setValue:]
////验证码
//[codeTitleTextView setValue:]
////请输入验证码
//[codeValueEditText setValue:]
////新密码
//[newpwdTitleTextView setValue:]
////请输入新密码
//[newpwdValueEditText setValue:]
////确认新密码
//[newpwd2TitleTextView setValue:]
////请再输入新密码
//[newpwd2ValueEditText setValue:]
}





///*找回密码 0005*/
//NSString  *n0005=@"0005";
///*找回密码 0005*/
//-(void) request0005{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 手机号码 备注:必填*/
//[businessparam setValue:@"" forKey:@"mobileNo"];
///* 手机验证码 备注:必填*/
//[businessparam setValue:@"" forKey:@"verificationCode"];
///* 新密码 备注:必填*/
//[businessparam setValue:@"" forKey:@"newPassWord"];
// [serviceInvoker callWebservice:businessparam formName:n0005 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0005?parameter=";
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
///*找回密码 0005*/
//if ([requestCode isEqualToString:n0005]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0005 *commonItem=[[RespondParam0005alloc]init];
//}



