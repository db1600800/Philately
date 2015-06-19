//注入网络请求,响应,等待提示



#import "UpdatePwdViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
@implementation UpdatePwdViewController
//确定
@synthesize okButton;
//back
@synthesize backImageView;
//修改密码
@synthesize titleTextView;
//旧密码
@synthesize oldPwdTitleTextView;
//请输入旧密码
@synthesize oldPwdValueEditText;
//新密码
@synthesize newPwdTitleTextView;
//请输入新密码
@synthesize newPwdValueEditText;
//确认密码
@synthesize newPwd2TitleTextView;
//请再输入新密码
@synthesize newPwd2ValueEditText;
- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated{
}


-(void) setUiValue{

//back
[backImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
[backImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
//修改密码
[titleTextView setValue:]
//旧密码
[oldPwdTitleTextView setValue:]
//请输入旧密码
[oldPwdValueEditText setValue:]
//新密码
[newPwdTitleTextView setValue:]
//请输入新密码
[newPwdValueEditText setValue:]
//确认密码
[newPwd2TitleTextView setValue:]
//请再输入新密码
[newPwd2ValueEditText setValue:]
}





/*修改登录密码0006*/
NSString  *n0006=@"0006";
/*修改登录密码0006*/
-(void) request0006{
NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
/* 会员编号 备注:必填*/
[businessparam setValue:@"" forKey:@"cstmNo"];
/* 旧密码 备注:必填*/
[businessparam setValue:@"" forKey:@"oldPassWord"];
/* 新密码 备注:必填*/
[businessparam setValue:@"" forKey:@"newPassWord"];
 [serviceInvoker callWebservice:businessparam formName:n0006 ];
    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0006?parameter=";
    NSString *fullUrl = [baseUrl stringByAppendingString:[businessparam JSONString]];
    NSURL *url = [NSURL URLWithString:[fullUrl stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:30.0];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
                               if (error) {
                                   NSLog(@"Httperror:%@%d", error.localizedDescription,error.code);
                               }else{
                                   
                                   NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
                                   
                                   NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                   
                                   NSLog(@"HttpResponseCode:%d", responseCode);
                                   NSLog(@"HttpResponseBody %@",responseString);
   dispatch_async(dispatch_get_main_queue(), ^{
       [self.tableView reloadData];
   });
                               }
                           }];
}

@end



NSMutableArray *listData=[[NSMutableArray alloc]init];
/*修改登录密码0006*/
if ([requestCode isEqualToString:n0006]){
NSDictionary *returnData=[root objectForKey:@"returnData"];
NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
NSString *respDesc=[returnHead objectForKey:@"respDesc"];
NSString *respCode=[returnHead objectForKey:@"respCode"];
NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
RespondParam0006 *commonItem=[[RespondParam0006alloc]init];
}



