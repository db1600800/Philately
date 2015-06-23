


#import "RegistViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
@implementation RegistViewController
//注册
@synthesize rigistButton;
//back
@synthesize backImageView;
//用户注册
@synthesize titleTextView;
//登录
@synthesize loginButton;
//用户名:
@synthesize userNameTitleTextView;
//请输入用户名
@synthesize userNameValueEditText;
//手机号码:
@synthesize phoneTitleTextView;
//请输入手机号码
@synthesize phoneValueEditText;
//手机验证码:
@synthesize codeTitleTextView;
//请输入手机验证码
@synthesize codeValueEditText;
//重发验证码
@synthesize codepicButton;
//密码:
@synthesize pwdTitleTextView;
//请输入密码
@synthesize pwdValueEditText;
//重复密码
@synthesize pwd2TitleTextView;
//请输入密码
@synthesize pwd2ValueEditText;
- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated{
}


-(void) setUiValue{

//back
//[backImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[backImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
//用户注册
//[titleTextView setValue:]
////用户名:
//[userNameTitleTextView setValue:]
////请输入用户名
//[userNameValueEditText setValue:]
////手机号码:
//[phoneTitleTextView setValue:]
////请输入手机号码
//[phoneValueEditText setValue:]
////手机验证码:
//[codeTitleTextView setValue:]
////请输入手机验证码
//[codeValueEditText setValue:]
////密码:
//[pwdTitleTextView setValue:]
////请输入密码
//[pwdValueEditText setValue:]
////重复密码
//[pwd2TitleTextView setValue:]
////请输入密码
//[pwd2ValueEditText setValue:]
}


///*用户注册0003*/
//NSString  *n0003=@"0003";
///*用户注册0003*/
//-(void) request0003{
//    NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
//    /* 用户名 备注:必填*/
//    [businessparam setValue:@"" forKey:@"userName"];
//    /* 手机号码 备注:必填*/
//    [businessparam setValue:@"" forKey:@"mobileNo"];
//    /* 密码 备注:必填*/
//    [businessparam setValue:@"" forKey:@"passWord"];
//    /* 手机验证码 备注:必填*/
//    [businessparam setValue:@"" forKey:@"verificationCode"];
//    [serviceInvoker callWebservice:businessparam formName:n0003 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0003?parameter=";
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
//                                   dispatch_async(dispatch_get_main_queue(), ^{
//                                       [self.tableView reloadData];
//                                   });
//                               }
//                           }];
//}

@end





//
//NSMutableArray *listData=[[NSMutableArray alloc]init];
///*用户注册0003*/
//if ([requestCode isEqualToString:n0003]){
//    NSDictionary *returnData=[root objectForKey:@"returnData"];
//    NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//    NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//    NSString *respCode=[returnHead objectForKey:@"respCode"];
//    NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//    RespondParam0003 *commonItem=[[RespondParam0003alloc]init];
//    /* 会员编号 备注:*/
//    commonItem.cstmNo=[returnDataBody objectForKey:@"cstmNo"];
//}

