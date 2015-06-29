//注入网络请求,响应,等待提示



#import "ShoppingCarViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
#import "ShoppingCarTableViewCell.h"
#import "RespondParam0032.h"
#import <UIKit/NSStringDrawing.h>
//注入table功能
 NSString *ShoppingCarIdentifier = @"ShoppingCarTableViewCell";
@implementation ShoppingCarViewController
@synthesize cacheCells;
//list
@synthesize tableView;
//back
@synthesize backImageView;
//购物车
@synthesize titleTextView;
//合计
@synthesize totalTitleTextView;
//¥22.00
@synthesize totalValueTextView;
//提交订单
@synthesize commitOrderFormButton;
NSMutableArray *listData;

- (void)viewDidLoad
{
    [super viewDidLoad];
//table
    [tableView setDelegate:self];//指定委托
    [tableView setDataSource:self];//指定数据委托
     cacheCells = [NSMutableDictionary dictionary];
    
    //使用自定义的Cell,需要向UITableView进行注册
    UINib *cellNib = [UINib nibWithNibName:@"ShoppingCarTableViewCell" bundle:nil];
    [tableView registerNib:cellNib forCellReuseIdentifier:ShoppingCarIdentifier];
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handTap)];
    //[self.modifyPwdTextView addGestureRecognizer:tap];
    
   listData=[[NSMutableArray alloc]init];
    [self request0032];
}

//-(void)handTap{
//    [self presentViewController:updatePwdViewController animated:NO completion:^{}];
//[self dismissViewControllerAnimated:NO completion:^(){}]; 
//};


-(void) viewWillAppear:(BOOL)animated{
//table
[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}


//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return title;
//  
//}
//
////自定义SectionHeader
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//}
//
////自定义SectionHeader高度
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 22.0;
//}
//
//指定有多少个分区(Section)，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;//[sectionAZDicArray count];//返回标题数组中元素的个数来确定分区的个数
}

//指定每个分区中有多少行，默认为1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    
    return  [listData count];
    
}

//绘制Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

 ShoppingCarTableViewCell *cell = (ShoppingCarTableViewCell*)[self.tableView dequeueReusableCellWithIdentifier:ShoppingCarIdentifier];
    if (!cell)
    {
       cell = [[[NSBundle mainBundle] loadNibNamed:@"ShoppingCarTableViewCell" owner:self options:nil] lastObject];
    }
//四方连限购
cell.productNameTextView.text= ((RespondParam0032*)[listData objectAtIndex:indexPath.row]).shoppingCartID;

    

    
    cell.checkOneButton.tag=(indexPath.section)*1000+indexPath.row;
    
    [cell.checkOneButton addTarget:self action:@selector(checkOneButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
   // [cell.checkOneButton  setImage:[UIImage imageNamed:@"checkbox_off.png"] forState:UIControlStateNormal];
   // [cell.checkOneButton  setImage:[UIImage imageNamed:@"checkbox_on.png"] forState:UIControlStateSelected];

  //  [myTextField addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    
 
    
////四方连加
////[cell.fourAddImageView setImageWithURL:[NSURL URLWithString:[listData objectAtIndex:indexPath.row].fourAddImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////四方连数量
//cell.fourNumEditText.text= ((RespondParam0032*)[listData objectAtIndex:indexPath.row]).shoppingCartID;
////fourReduce
////[cell.fourReduceImageView setImageWithURL:[NSURL URLWithString:[listData objectAtIndex:indexPath.row].fourReduceImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////四方连
//cell.fourCheckTitleTextView.text= [listData objectAtIndex:indexPath.row].fourCheckTitleTextView;
////限购五套
//cell.oneLimitTextView.text= [listData objectAtIndex:indexPath.row].oneLimitTextView;
////加
//[cell.oneAddImageView setImageWithURL:[NSURL URLWithString:[listData objectAtIndex:indexPath.row].oneAddImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////单套数量
//cell.oneNumEditText.text= [listData objectAtIndex:indexPath.row].oneNumEditText;
////减少
//[cell.reduceImageView setImageWithURL:[NSURL URLWithString:[listData objectAtIndex:indexPath.row].reduceImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////单套
//cell.checkOneTitleTextView.text= [listData objectAtIndex:indexPath.row].checkOneTitleTextView;
////36.00
//cell.fourPriceTextView.text= [listData objectAtIndex:indexPath.row].fourPriceTextView;
////四方红
//cell.fourTextView.text= [listData objectAtIndex:indexPath.row].fourTextView;
////12.00
//cell.onePriceTextView.text= [listData objectAtIndex:indexPath.row].onePriceTextView;
////单套
//cell.oneTextView.text= [listData objectAtIndex:indexPath.row].oneTextView;
////产品名字
//cell.productNameTextView.text= [listData objectAtIndex:indexPath.row].productNameTextView;
////productPic
//[cell.productPicImageView setImageWithURL:[NSURL URLWithString:[listData objectAtIndex:indexPath.row].productPicImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////cancelX
//[cell.cancelXImageView setImageWithURL:[NSURL URLWithString:[listData objectAtIndex:indexPath.row].cancelXImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////shoppingCarCheck
//[cell.shoppingCarCheckImageView setImageWithURL:[NSURL URLWithString:[listData objectAtIndex:indexPath.row].shoppingCarCheckImageView placeholderImage:[UIImage imageNamed:@"default.jpg"]];
return cell;
    
}
-(void)checkOneButtonClicked:(UIButton *)btn{
    int tab=btn.tag;
    int row= btn.tag%1000;
    int section=btn.tag/1000;
   // btn.selected = !btn.selected 用与button做checkBox
    
}

//关键方法，获取复用的Cell后模拟赋值，然后取得Cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

NSString *reuseIdentifier = ShoppingCarIdentifier;
ShoppingCarTableViewCell *cell= [self.cacheCells objectForKey:reuseIdentifier];
if (!cell) {
  cell=[self.tableView dequeueReusableCellWithIdentifier:ShoppingCarIdentifier];
  [self.cacheCells setObject:cell forKey:reuseIdentifier];
}


 CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    int height=cell.contentView.frame.size.height;
    
return height;
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

////back
//[backImageView setImage:[UIImage imageNamed:@"1.jpeg"]]
//[backImageView setImageWithURL:[NSURL URLWithString:  placeholderImage:[UIImage imageNamed:@"default.jpg"]];
////购物车
//[titleTextView setValue:]
////合计
//[totalTitleTextView setValue:]
////¥22.00
//[totalValueTextView setValue:]
}





/*购物车查询0032*/
NSString  *n0032=@"0032";
/*购物车查询0032*/
-(void) request0032{
    
      RespondParam0032 *a=[[RespondParam0032 alloc]init];
    a.shoppingCartID=@"dd";
    [listData addObject:a];
NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
/* 会员编号 备注:必填*/
[businessparam setValue:@"" forKey:@"cstmNo"];
/* 业务代号 备注:必填*/
[businessparam setValue:@"" forKey:@"busiNo"];
// [serviceInvoker callWebservice:businessparam formName:n0032 ];
    
    NSString *baseUrl=@"http://localhost:8080/Servlet/Serverlet0032?parameter=";
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
                                   
                                   NSDictionary *root=[responseString objectFromJSONString] ;
                                   
                                   /*购物车查询0032*/
                                 //  if ([requestCode isEqualToString:n0032])
                                   {
                                       NSDictionary *returnData=[root objectForKey:@"returnData"];
                                       NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
                                       NSString *respDesc=[returnHead objectForKey:@"respDesc"];
                                       NSString *respCode=[returnHead objectForKey:@"respCode"];
                                       NSDictionary *returnDataBody=[returnData objectForKey:@"returnBody"];
                                       
                                       RespondParam0032 *commonItem=[[RespondParam0032 alloc]init];
                                       /* 返回的记录数 备注:循环域开始*/
                                       commonItem.recordNum=[returnDataBody objectForKey:@"recordNum"];
                                       /* 购物车代号 备注:*/
                                       commonItem.shoppingCartID=[returnDataBody objectForKey:@"shoppingCartID"];
                                       /* 业务代号 备注:*/
                                       commonItem.busiNo=[returnDataBody objectForKey:@"busiNo"];
                                       /* 商品代号 备注:*/
                                       commonItem.merchID=[returnDataBody objectForKey:@"merchID"];
                                       /* 图片ID 备注:*/
                                       commonItem.merchPicID=[returnDataBody objectForKey:@"merchPicID"];
                                       /* 商品名称 备注:*/
                                       commonItem.merchName=[returnDataBody objectForKey:@"merchName"];
                                       /* 所属机构 备注:店铺名称*/
                                       commonItem.brchNo=[returnDataBody objectForKey:@"brchNo"];
                                       /* 商品规格 备注:单张、四方连*/
                                       commonItem.normsType=[returnDataBody objectForKey:@"normsType"];
                                       /* 购买价格 备注:*/
                                      NSString *price= [returnDataBody objectForKey:@"buyPrice"];
                                       commonItem.buyPrice=[price floatValue];
                                       /* 创建时间 备注:*/
                                       commonItem.gmtCreate=[returnDataBody objectForKey:@"gmtCreate"];
                                       /* 修改时间 备注:*/
                                       commonItem.gmtModify=[returnDataBody objectForKey:@"gmtModify"];
                                       /* 返回的记录数 备注:循环域结束*/
                                      // commonItem.recordNum=[returnDataBody objectForKey:@"recordNum"];
                                       [listData addObject:commonItem];
                                       [listData addObject:commonItem];
                                       [listData addObject:commonItem];
                                       [listData addObject:commonItem];
                                   }

                                   
   dispatch_async(dispatch_get_main_queue(), ^{
       //[self.totalValueTextView setText:@"ffff"];
       
       [self.tableView reloadData];
   });
                               }
                           }];
}




///*购物车修改0034*/
//NSString  *n0034=@"0034";
///*购物车修改0034*/
//-(void) request0034{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 购物车代号 备注:*/
//[businessparam setValue:@"" forKey:@"shoppingCartID"];
///* 会员编号 备注:必填*/
//[businessparam setValue:@"" forKey:@"cstmNo"];
///* 购买数量 备注:*/
//[businessparam setValue:@"" forKey:@"buyNum"];
// [serviceInvoker callWebservice:businessparam formName:n0034 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0034?parameter=";
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
///*购物车删除0035*/
//NSString  *n0035=@"0035";
///*购物车删除0035*/
//-(void) request0035{
//NSMutableDictionary *businessparam=[[NSMutableDictionary alloc] init];
///* 购物车代号 备注:*/
//[businessparam setValue:@"" forKey:@"shoppingCartID"];
///* 会员编号 备注:必填*/
//[businessparam setValue:@"" forKey:@"cstmNo"];
// [serviceInvoker callWebservice:businessparam formName:n0035 ];
//    NSString *baseUrl=@"http://localhost:8080/Serlet/Serverlet0035?parameter=";
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
///*购物车修改0034*/
//if ([requestCode isEqualToString:n0034]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0034 *commonItem=[[RespondParam0034alloc]init];
//}
//
//
//
//
//NSMutableArray *listData=[[NSMutableArray alloc]init];
///*购物车删除0035*/
//if ([requestCode isEqualToString:n0035]){
//NSDictionary *returnData=[root objectForKey:@"returnData"];
//NSDictionary *returnHead=[returnData objectForKey:@"returnHead"];
//NSString *respDesc=[returnHead objectForKey:@"respDesc"];
//NSString *respCode=[returnHead objectForKey:@"respCode"];
//NSDictionary *returnBody=[returnData objectForKey:@"returnBody"];
//RespondParam0035 *commonItem=[[RespondParam0035alloc]init];
//}



//NSString+Ext.h
//@interface NSString (Ext)
//- (CGSize)calculateSize:(CGSize)size font:(UIFont *)font;
//@end
//
//@implementation NSString (Ext)
//- (CGSize)calculateSize:(CGSize)size font:(UIFont *)font {
//    CGSize expectedLabelSize = CGSizeZero;
//    
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
//        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
//        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
//        
//        expectedLabelSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
//    }
//    else {
//        expectedLabelSize = [self sizeWithFont:font
//                             constrainedToSize:size
//                                 lineBreakMode:NSLineBreakByWordWrapping];
//    }
//    
//    return CGSizeMake(ceil(expectedLabelSize.width), ceil(expectedLabelSize.height));
//}
//@end

