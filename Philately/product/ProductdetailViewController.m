//注入网络请求,响应,等待提示



#import "ProductdetailViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
#import "ProductdetailTableViewCell.h"
//注入table功能
 NSString *ProductdetailIdentifier = @"ProductdetailTableViewCell";
@implementation ProductdetailViewController
@synthesize cacheCells;
//产品图片
@synthesize productpicImageView;
//back
@synthesize backButton;
//产品详情
@synthesize titleTextView;
//car
@synthesize carImageView;
//购物车数量
@synthesize carnumTextView;
//预订
@synthesize preOrderTextView;
//中国古代文学
@synthesize productNameTextView;
//lineblack
@synthesize lineblackImageView;
//单套价格:
@synthesize onePriceTextView;
//12
@synthesize onePriceValueTextView;
//四个方连价格:
@synthesize fourPriceTitleTextView;
//48
@synthesize fourPriceValueTextView;
//oneCheck
@synthesize oneCheckButton;
//单套
@synthesize oneCheckTitleTextView;
//oneCheckReduce
@synthesize oneCheckReduceButton;
//oneCheckNum
@synthesize oneCheckNumEditText;
//oneCheckAdd
@synthesize oneCheckAddButton;
//单套限购
@synthesize oneCheckLimiteTextView;
//fourCheck
@synthesize fourCheckButton;
//四方连
@synthesize fourCheckTitleTextView;
//fourCheckReduce
@synthesize fourCheckReduceButton;
//4
@synthesize fourCheckNumEditText;
//fourCheckAdd
@synthesize fourCheckAddButton;
//四方限购
@synthesize fourCheckLimiteTextView;
//所需最低积分
@synthesize needFenTitleTextView;
//0
@synthesize needFenValueTextView;
//获得积分:
@synthesize getFenTitleTextView;
//3
@synthesize getFenValueTextView;
//扣除积分:
@synthesize deleteFenTextView;
//0
@synthesize deleteFenValueTextView;
//所属机构:
@synthesize belongTitleTextView;
//中国邮政网上
@synthesize belongValueTextView;
//发行时间:
@synthesize timeTextView;
//2015
@synthesize timeValueTextView;
//销售时间
@synthesize saletimeTextView;
//2015
@synthesize saletimeValueTextView;
//开始
@synthesize startTextView;
//简要描述
@synthesize detailTitleTextView;
//作者
@synthesize detailValueTextView;
//猜你喜欢
@synthesize youlikeTextView;
//list
@synthesize tableView;
//立即购买
@synthesize buyButton;
//放进购物车
@synthesize addbuycarButton;
NSMutableArray *listData;
- (void)viewDidLoad
{
    [super viewDidLoad];
//table
    [tableView setDelegate:self];//指定委托
    [tableView setDataSource:self];//指定数据委托
     cacheCells = [NSMutableDictionary dictionary];
    
    //使用自定义的Cell,需要向UITableView进行注册
    UINib *cellNib = [UINib nibWithNibName:@"ProductdetailTableViewCell" bundle:nil];
    [tableView registerNib:cellNib forCellReuseIdentifier:ProductdetailIdentifier];
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

 ProductdetailTableViewCell *cell = (ProductdetailTableViewCell*)[self.tableView dequeueReusableCellWithIdentifier:ProductdetailIdentifier];
    if (!cell)
    {
       cell = [[[NSBundle mainBundle] loadNibNamed:@"ProductdetailTableViewCell" owner:self options:nil] lastObject];
    }
////product3Price
//cell.product3PriceTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).product3PriceTextView;
////product3Name
//cell.product3NameTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).product3NameTextView;
////product3
//[cell.product3ImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).product3ImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////product2Price
//cell.product2PriceTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).product2PriceTextView;
////product2Name
//cell.product2NameTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).product2NameTextView;
////product2
//[cell.拍roduct2ImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).拍roduct2ImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////product1Price
//cell.product1PriceTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).product1PriceTextView;
////productName
//cell.productNameTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).productNameTextView;
////product1
//[cell.product1ImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).product1ImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
return cell;
    
}

//关键方法，获取复用的Cell后模拟赋值，然后取得Cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

NSString *reuseIdentifier = ProductdetailIdentifier;
ProductdetailTableViewCell *cell= [self.cacheCells objectForKey:reuseIdentifier];
if (!cell) {
  cell=[self.tableView dequeueReusableCellWithIdentifier:ProductdetailIdentifier];
  [self.cacheCells setObject:cell forKey:reuseIdentifier];
}

////product3Price
//cell.product3PriceTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).product3PriceTextView;
////product3Name
//cell.product3NameTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).product3NameTextView;
////product3
//[cell.product3ImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).product3ImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////product2Price
//cell.product2PriceTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).product2PriceTextView;
////product2Name
//cell.product2NameTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).product2NameTextView;
////product2
//[cell.拍roduct2ImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).拍roduct2ImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////product1Price
//cell.product1PriceTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).product1PriceTextView;
////productName
//cell.productNameTextView.text= ((..*)[listData objectAtIndex:indexPath.row]).productNameTextView;
////product1
//[cell.product1ImageView setImageWithURL:[NSURL URLWithString:((..*)[listData objectAtIndex:indexPath.row]).product1ImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];

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

////产品图片
//[productpicImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[productpicImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////产品详情
//[titleTextView setValue:]
////car
//[carImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[carImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////购物车数量
//[carnumTextView setValue:]
////预订
//[preOrderTextView setValue:]
////中国古代文学
//[productNameTextView setValue:]
////lineblack
//[lineblackImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[lineblackImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////单套价格:
//[onePriceTextView setValue:]
////12
//[onePriceValueTextView setValue:]
////四个方连价格:
//[fourPriceTitleTextView setValue:]
////48
//[fourPriceValueTextView setValue:]
////单套
//[oneCheckTitleTextView setValue:]
////oneCheckNum
//[oneCheckNumEditText setValue:]
////单套限购
//[oneCheckLimiteTextView setValue:]
////四方连
//[fourCheckTitleTextView setValue:]
////4
//[fourCheckNumEditText setValue:]
////四方限购
//[fourCheckLimiteTextView setValue:]
////所需最低积分
//[needFenTitleTextView setValue:]
////0
//[needFenValueTextView setValue:]
////获得积分:
//[getFenTitleTextView setValue:]
////3
//[getFenValueTextView setValue:]
////扣除积分:
//[deleteFenTextView setValue:]
////0
//[deleteFenValueTextView setValue:]
////所属机构:
//[belongTitleTextView setValue:]
////中国邮政网上
//[belongValueTextView setValue:]
////发行时间:
//[timeTextView setValue:]
////2015
//[timeValueTextView setValue:]
////销售时间
//[saletimeTextView setValue:]
////2015
//[saletimeValueTextView setValue:]
////开始
//[startTextView setValue:]
////简要描述
//[detailTitleTextView setValue:]
////作者
//[detailValueTextView setValue:]
////猜你喜欢
//[youlikeTextView setValue:]
}





///*商品详情0026*/
//NSString  *n0026=@"0026";
///*商品详情0026*/
//-(void) request0026{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 业务代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"busiNo"];
///* 商品代号 备注:必填*/
//[businessparam setValue:@"" forKey:@"merchID"];
// [serviceInvoker callWebservice:businessparam formName:n0026 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0026?parameter=";
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
///*猜你喜欢0027*/
//NSString  *n0027=@"0027";
///*猜你喜欢0027*/
//-(void) request0027{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 商品代号 备注:选填*/
//[businessparam setValue:@"" forKey:@"merchID"];
///* 当前页码 备注:必填*/
//[businessparam setValue:@"" forKey:@"pageCode"];
///* 页码大小 备注:必填*/
//[businessparam setValue:@"" forKey:@"pageNum"];
// [serviceInvoker callWebservice:businessparam formName:n0027 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0027?parameter=";
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
///*商品详情0026*/
//if ([requestCode isEqualToString:n0026]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0026 *commonItem=[[RespondParam0026alloc]init];
///* 业务代号 备注:*/
//commonItem.busiNo=[returnDataBody objectForKey:@"busiNo"];
///* 商品代号 备注:*/
//commonItem.merchID=[returnDataBody objectForKey:@"merchID"];
///* 商品类别代号 备注:*/
//commonItem.merchType=[returnDataBody objectForKey:@"merchType"];
///* 商品名称 备注:*/
//commonItem.merchName=[returnDataBody objectForKey:@"merchName"];
///* 商品状态 备注:内容待定*/
//commonItem.merchStatus=[returnDataBody objectForKey:@"merchStatus"];
///* 商品内部编号 备注:*/
//commonItem.merchInterNum=[returnDataBody objectForKey:@"merchInterNum"];
///* 商品销售价格 备注:*/
//commonItem.merchPrice=[returnDataBody objectForKey:@"merchPrice"];
///* 上架机构 备注:*/
//commonItem.brchNo=[returnDataBody objectForKey:@"brchNo"];
///* 商品简单描述 备注:*/
//commonItem.merchDesc=[returnDataBody objectForKey:@"merchDesc"];
///* 商品描述（URL） 备注:*/
//commonItem.merchURL=[returnDataBody objectForKey:@"merchURL"];
///* 商品销售属性 备注:预售、销售等*/
//commonItem.merchSaleType=[returnDataBody objectForKey:@"merchSaleType"];
///* 志号编号（专业编号） 备注:*/
//commonItem.professionNum=[returnDataBody objectForKey:@"professionNum"];
///* 发行日期 备注:格式：yyyymmdd*/
//commonItem.launchDate=[returnDataBody objectForKey:@"launchDate"];
///* 当前商品所属销售阶段 备注:针对新邮业务：以旧换新阶段、增量阶段*/
//commonItem.saleStage=[returnDataBody objectForKey:@"saleStage"];
///* 是否实名验证商品 备注:0：需要
//1：不需要*/
//commonItem.needAutonym=[returnDataBody objectForKey:@"needAutonym"];
///* 是否手机验证码商品 备注:0：需要
//1：不需要*/
//commonItem.needVerification=[returnDataBody objectForKey:@"needVerification"];
///* 包括图片数量 备注:循环域开始*/
//commonItem.picNum=[returnDataBody objectForKey:@"picNum"];
///* 图片ID 备注:*/
//commonItem.merchPicID=[returnDataBody objectForKey:@"merchPicID"];
///* 图片属性 备注:主图、缩略图等*/
//commonItem.picType=[returnDataBody objectForKey:@"picType"];
///* 尺寸类型 备注:小、中、大*/
//commonItem.sizeType=[returnDataBody objectForKey:@"sizeType"];
///* 图片顺序号 备注:*/
//commonItem.picIndex=[returnDataBody objectForKey:@"picIndex"];
///* 包括图片数量 备注:循环域结束*/
//commonItem.picNum=[returnDataBody objectForKey:@"picNum"];
///* 包括商品规格数量 备注:循环域开始*/
//commonItem.merchNormsNum=[returnDataBody objectForKey:@"merchNormsNum"];
///* 商品规格 备注:单张、四方连*/
//commonItem.normsType=[returnDataBody objectForKey:@"normsType"];
///* 模式单价 备注:*/
//commonItem.normsPrice=[returnDataBody objectForKey:@"normsPrice"];
///* 限购数量 备注:*/
//commonItem.limitNum=[returnDataBody objectForKey:@"limitNum"];
///* 获取积分 备注:*/
//commonItem.gainScore=[returnDataBody objectForKey:@"gainScore"];
///* 包括商品规格数量 备注:循环域结束*/
//commonItem.merchNormsNum=[returnDataBody objectForKey:@"merchNormsNum"];
///* 商品销售时间属性数量 备注:循环域开始*/
//commonItem.saleTimeNum=[returnDataBody objectForKey:@"saleTimeNum"];
///* 时间类型 备注:销售时间、以旧换新时间、增量时间*/
//commonItem.saleTimeType=[returnDataBody objectForKey:@"saleTimeType"];
///* 起始时间 备注:格式：yymmddhhmmss*/
//commonItem.startTime=[returnDataBody objectForKey:@"startTime"];
///* 截止时间 备注:*/
//commonItem.endTime=[returnDataBody objectForKey:@"endTime"];
///* 商品销售时间属性数量 备注:循环域结束*/
//commonItem.saleTimeNum=[returnDataBody objectForKey:@"saleTimeNum"];
//}
//
//
//
//
//NSMutableArray *listData=[[NSMutableArray alloc]init];
///*猜你喜欢0027*/
//if ([requestCode isEqualToString:n0027]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0027 *commonItem=[[RespondParam0027alloc]init];
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




