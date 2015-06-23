//注入网络请求,响应,等待提示



#import "OrderFormListViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
#import "OrderFormListTableViewCell.h"
//注入table功能
static NSString *CellIdentifier = @"OrderFormListTableViewCell";
@implementation OrderFormListViewController
@synthesize cacheCells;
//list
@synthesize tableView;
//back
@synthesize backImageView;
//新邮预订订单
@synthesize titleTextView;
//down
@synthesize downImageView;
//query
@synthesize queryImageView;
//近一月
@synthesize nearMonthTextView;
//一年
@synthesize yearTextView;
//全部
@synthesize allTextView;
- (void)viewDidLoad
{
    [super viewDidLoad];
//table
    [tableView setDelegate:self];//指定委托
    [tableView setDataSource:self];//指定数据委托
     cacheCells = [NSMutableDictionary dictionary];
    
    //使用自定义的Cell,需要向UITableView进行注册
    UINib *cellNib = [UINib nibWithNibName:@"OrderFormListTableViewCell" bundle:nil];
    [tableView registerNib:cellNib forCellReuseIdentifier:CellIdentifier];
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handTap)];
    [self.modifyPwdTextView addGestureRecognizer:tap];
}

-(void)handTap{
    [self presentViewController:updatePwdViewController animated:NO completion:^{}];
[self dismissViewControllerAnimated:NO completion:^(){}]; 
};
-(void) viewWillAppear:(BOOL)animated{
//table
[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSMutableDictionary *sectionADic=[sectionAZDicArray objectAtIndex:section];  
    
    NSMutableDictionary *sectionHeaderDic=[sectionADic objectForKey:@"SectionHeaderDic"];
    
    NSString *title= [sectionHeaderDic objectForKey:@"title"];
    
    return title;
  
}

//自定义SectionHeader
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
}

//自定义SectionHeader高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 22.0;
}

//指定有多少个分区(Section)，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [sectionAZDicArray count];//返回标题数组中元素的个数来确定分区的个数
}

//指定每个分区中有多少行，默认为1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSMutableDictionary *sectionADic=[sectionAZDicArray objectAtIndex:section];  
    
    NSMutableArray *sectionChirldsArray=[sectionADic objectForKey:@"SectionChirldsArray"];
    
    return  [sectionChirldsArray count];
    
}

//绘制Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

 OrderFormListTableViewCell *cell = (OrderFormListTableViewCell*)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
       cell = [[[NSBundle mainBundle] loadNibNamed:@"OrderFormListTableViewCell" owner:self options:nil] lastObject];
    }
//订单号
cell.orderFormNumTitleTextView.text= [listData objectAtIndex:indexPath.row].orderFormNumTitleTextView;
//7899898
cell.orderFormNumValueTextView.text= [listData objectAtIndex:indexPath.row].orderFormNumValueTextView;
//订单金额
cell.orderFormMoneyTitleTextView.text= [listData objectAtIndex:indexPath.row].orderFormMoneyTitleTextView;
//money
[cell.moneyImageView setImageWithURL:[NSURL URLWithString:[listData objectAtIndex:indexPath.row].moneyImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
//243
cell.orderFormMoneyValueTextView.text= [listData objectAtIndex:indexPath.row].orderFormMoneyValueTextView;
//下单时间
cell.orderFormTimeTitleTextView.text= [listData objectAtIndex:indexPath.row].orderFormTimeTitleTextView;
//23434343
cell.orderFormTimeTextView.text= [listData objectAtIndex:indexPath.row].orderFormTimeTextView;
//订单状态
cell.orderFormStatteTitleTextView.text= [listData objectAtIndex:indexPath.row].orderFormStatteTitleTextView;
//等待支付
cell.orderFormStateValueTextView.text= [listData objectAtIndex:indexPath.row].orderFormStateValueTextView;
return cell;
    
}

//关键方法，获取复用的Cell后模拟赋值，然后取得Cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

NSString *reuseIdentifier = CellIdentifier;
OrderFormListTableViewCell *cell= [self.cacheCells objectForKey:reuseIdentifier];
if (!cell) {
  cell=[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  [self.cacheCells setObject:cell forKey:reuseIdentifier];
}

//订单号
cell.orderFormNumTitleTextView.text= [listData objectAtIndex:indexPath.row].orderFormNumTitleTextView;
//7899898
cell.orderFormNumValueTextView.text= [listData objectAtIndex:indexPath.row].orderFormNumValueTextView;
//订单金额
cell.orderFormMoneyTitleTextView.text= [listData objectAtIndex:indexPath.row].orderFormMoneyTitleTextView;
//money
[cell.moneyImageView setImageWithURL:[NSURL URLWithString:[listData objectAtIndex:indexPath.row].moneyImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
//243
cell.orderFormMoneyValueTextView.text= [listData objectAtIndex:indexPath.row].orderFormMoneyValueTextView;
//下单时间
cell.orderFormTimeTitleTextView.text= [listData objectAtIndex:indexPath.row].orderFormTimeTitleTextView;
//23434343
cell.orderFormTimeTextView.text= [listData objectAtIndex:indexPath.row].orderFormTimeTextView;
//订单状态
cell.orderFormStatteTitleTextView.text= [listData objectAtIndex:indexPath.row].orderFormStatteTitleTextView;
//等待支付
cell.orderFormStateValueTextView.text= [listData objectAtIndex:indexPath.row].orderFormStateValueTextView;

 CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
return size.height+1;
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

//back
[backImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
[backImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
//新邮预订订单
[titleTextView setValue:]
//down
[downImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
[downImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
//query
[queryImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
[queryImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
//近一月
[nearMonthTextView setValue:]
//一年
[yearTextView setValue:]
//全部
[allTextView setValue:]
}





/*订单查询0040*/
NSString  *n0040=@"0040";
/*订单查询0040*/
-(void) request0040{
NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
/* cstmNo 备注:必填*/
[businessparam setValue:@"" forKey:@"会员编号"];
/* orderNo 备注:必填*/
[businessparam setValue:@"" forKey:@"订单号"];
/* busiNo 备注:必填*/
[businessparam setValue:@"" forKey:@"业务代号"];
/* orderStatusNum 备注:必填*/
[businessparam setValue:@"" forKey:@"订单状态数量"];
/* orderStatus 备注:必填*/
[businessparam setValue:@"" forKey:@"订单状态"];
/* orderStatusNum 备注:必填*/
[businessparam setValue:@"" forKey:@"订单状态数量"];
/* startDate 备注:必填*/
[businessparam setValue:@"" forKey:@"开始日期"];
/* endDate 备注:必填*/
[businessparam setValue:@"" forKey:@"结束日期"];
/* channelNo 备注:选填*/
[businessparam setValue:@"" forKey:@"渠道代号"];
/* payType 备注:选填*/
[businessparam setValue:@"" forKey:@"支付方式"];
/* sortType 备注:选填*/
[businessparam setValue:@"" forKey:@"排序方式"];
/* sort FieldID 备注:选填*/
[businessparam setValue:@"" forKey:@"排序字段代号"];
/* queryTypeFlag 备注:选填*/
[businessparam setValue:@"" forKey:@"查询订单类型标志"];
/* pageCode 备注:必填*/
[businessparam setValue:@"" forKey:@"当前页码"];
/* pageNum 备注:必填*/
[businessparam setValue:@"" forKey:@"页码大小"];
 [serviceInvoker callWebservice:businessparam formName:n0040 ];
    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0040?parameter=";
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
/*订单查询0040*/
if ([requestCode isEqualToString:n0040]){
NSString *returnCode=[root objectForKey:@"returnCode"];
NSDictionary *returnData=[root objectForKey:@"returnData"];
NSDictionary *head=[returnData objectForKey:@"head"];
NSString *ret_errcode=[head objectForKey:@"ret_errcode"];
NSString *ret_msg=[head objectForKey:@"ret_msg"];
NSDictionary *body=[returnData objectForKey:@"body"];
RespondParam0040 *commonItem=[[RespondParam0040alloc]init];
/* totalNum 备注:*/
commonItem.最大记录数=[returnDataBody objectForKey:@"最大记录数"];
/* recordNum 备注:循环域开始*/
commonItem.返回的记录数=[returnDataBody objectForKey:@"返回的记录数"];
/* orderNo 备注:*/
commonItem.订单号=[returnDataBody objectForKey:@"订单号"];
/* busiNo 备注:*/
commonItem.业务代号=[returnDataBody objectForKey:@"业务代号"];
/* orderAmt 备注:*/
commonItem.订单总金额=[returnDataBody objectForKey:@"订单总金额"];
/* bookDate 备注:格式:yyyymmdd*/
commonItem.下单日期=[returnDataBody objectForKey:@"下单日期"];
/* payStatus 备注:*/
commonItem.支付状态=[returnDataBody objectForKey:@"支付状态"];
/* dealStatus 备注:*/
commonItem.处理状态=[returnDataBody objectForKey:@"处理状态"];
/* channelNo 备注:*/
commonItem.渠道代号=[returnDataBody objectForKey:@"渠道代号"];
/* recordNum 备注:循环域结束*/
commonItem.返回的记录数=[returnDataBody objectForKey:@"返回的记录数"];
}




