


#import "FirstPageViewController.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
#import "FirstPageHeadView.h"
#import "FirstPageTableViewCell.h"
@implementation FirstPageViewController
//table

//注入table功能
  NSString *FirstPageCellIdentifier = @"FirstPageTableViewCell";
  NSString *HeadIdentifier = @"FirstPageHeadView";

@synthesize tableView;

int kDeviceWidth=0;
int kDeviceHeight=0;
NSArray * imageArr;//图片路径字符串数组


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    kDeviceWidth=[UIScreen mainScreen].bounds.size.width;
    kDeviceHeight=[UIScreen mainScreen].bounds.size.height;
    [self initImgArr];
    [self initScrollView];
    [self initPageControl];
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(handleSchedule) userInfo:nil repeats:YES];
    
    self.scrollview.showsHorizontalScrollIndicator=NO;
    
    self.pagecontrol.pageIndicatorTintColor = [UIColor blackColor];//设置点的默认颜色，非选中的点
    
    self.pagecontrol.currentPageIndicatorTintColor = [UIColor redColor];;//设置点的选中颜色
    

    
    
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handTap)];
    
   // [self.modifyPwdTextView addGestureRecognizer:tap];
}

//-(void)handTap{
//    [self presentViewController:updatePwdViewController animated:NO completion:^{}];
//[self dismissViewControllerAnimated:NO completion:^(){}]; 
//};


-(void) viewWillAppear:(BOOL)animated{
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
//    NSMutableDictionary *sectionADic=[sectionAZDicArray objectAtIndex:section];  
//    
//    NSMutableDictionary *sectionHeaderDic=[sectionADic objectForKey:@"SectionHeaderDic"];
//    
//    NSString *title= [sectionHeaderDic objectForKey:@"title"];
    
    return nil ;
  
}

//自定义SectionHeader
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    FirstPageHeadView *cell = (FirstPageHeadView*)[self.tableView  dequeueReusableHeaderFooterViewWithIdentifier: HeadIdentifier];
    
    if (!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FirstPageHeadView" owner:self options:nil] lastObject];
    }
    
    //a
    //cell.aTextView.text= [listData objectAtIndex:indexPath.row].aTextView;
    return cell;
    
}

//自定义SectionHeader高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 22.0;
}

//指定有多少个分区(Section)，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    //return [sectionAZDicArray count];//返回标题数组中元素的个数来确定分区的个数
}

//指定每个分区中有多少行，默认为1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//    NSMutableDictionary *sectionADic=[sectionAZDicArray objectAtIndex:section];  
//    
//    NSMutableArray *sectionChirldsArray=[sectionADic objectForKey:@"SectionChirldsArray"];
//    
//    return  [sectionChirldsArray count];
    
    
    return 1;
    
}

//绘制Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FirstPageTableViewCell *cell = (FirstPageTableViewCell*)[self.tableView  dequeueReusableCellWithIdentifier:FirstPageCellIdentifier];
                                                             
    if (!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FirstPageTableViewCell" owner:self options:nil] lastObject];
    }
    //a
//    cell.aTextView.text= [listData objectAtIndex:indexPath.row].aTextView;

    return cell ;
}

//关键方法，获取复用的Cell后模拟赋值，然后取得Cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString *reuseIdentifier = FirstPageCellIdentifier;
    FirstPageTableViewCell *cell= [self.cacheCells objectForKey:reuseIdentifier];
    if (!cell) {
        cell=[self.tableView dequeueReusableCellWithIdentifier:FirstPageCellIdentifier];
        [self.cacheCells setObject:cell forKey:reuseIdentifier];
    }
    
    //a
    //cell.aTextView.text= [listData objectAtIndex:indexPath.row].aTextView;
    
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

}






//1 实现手动滚动效果：

-(void)initScrollView{
    
    // scrollView=[[UIScrollViewalloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth,kDeviceHeight/3*2)];
    
    self.scrollview.contentSize=CGSizeMake(kDeviceWidth*imageArr.count,kDeviceHeight/3*2);
    
    self.scrollview.delegate=self;
    
    self.scrollview.scrollEnabled=YES;
    
    for(int i=0;i<imageArr.count;i++){
        
        UIImageView * firstImg=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[imageArr objectAtIndex:i]]];
        
        firstImg.frame=CGRectMake(kDeviceWidth*i, 0, kDeviceWidth, kDeviceHeight/3*2);
        
        [ self.scrollview addSubview:firstImg];
        
    }
    
}

-(void)initImgArr{
    
    imageArr=@[@"right.png",@"back.png"];
    
}

// 2 加UIPageControl，做翻页效果，即产生白点
//方法实现如下：

-(void)initPageControl{
    
    // self.pagecontrol=[[UIPageControlalloc]initWithFrame:CGRectMake(kDeviceWidth/2-10, kDeviceHeight/3*2-20, 20, 20)];
    
    self.pagecontrol.numberOfPages=imageArr.count;
    
    self.pagecontrol.currentPage=0;
    
    [self.pagecontrol addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
}

//可以不要下面这个方法，此方法是手动点击白点的时候跳转相应页面视图

//点击page控件时，即白点
-(void)changePage:(id)sender{
    int page=self.pagecontrol.currentPage;
    [self.scrollview setContentOffset:CGPointMake(kDeviceWidth*page, 0) animated:YES];
}

//并且记得在手动滚动的时候更改pageControl的页码

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int page=scrollView.contentOffset.x/kDeviceWidth;
    
    self.pagecontrol.currentPage=page;
    
}


bool Tend=YES;

//3 定时任务方法调用：（注意计算好最后一页循环滚动）

-(void)handleSchedule{
    
    ++self.pagecontrol.currentPage;
    
    if(Tend){
        
        [self.scrollview setContentOffset:CGPointMake(0, 0) animated:YES];
        
        self.pagecontrol.currentPage=0;
        
    }else{
        
        [self.scrollview setContentOffset:CGPointMake(self.pagecontrol.currentPage*kDeviceWidth, 0) animated:YES];
        
    }
    
    if (self.pagecontrol.currentPage==self.pagecontrol.numberOfPages-1) {
        
        Tend=YES;
        
    }else{
        
        Tend=NO;
        
    }
}


@end

