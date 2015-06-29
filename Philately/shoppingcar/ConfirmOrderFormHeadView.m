


#import "ConfirmOrderFormHeadView.h"
#import "UIImageView+WebCache.h"
#import <Foundation/Foundation.h>
#import <PublicFramework/JSONKit.h>
@implementation ConfirmOrderFormHeadView
//开具发票
@synthesize invoiceTitleTextView;
//invoiceCheck
@synthesize invoiceCheckButton;
//发票类型
@synthesize invoiceTypeTitleTextView;
//invoiceTypePesonCheck
@synthesize invoiceTypePesonCheckButton;
//个人
@synthesize invoiceTypePesonTitleTextView;
//invoiceTypeCompanyCheck
@synthesize invoiceTypeCompanyCheckButton;
//单位
@synthesize invoiceTypeCompanyTileTextView;
//lineblcak
@synthesize lineblcakImageView;
//发票抬头:
@synthesize invoiceHeadTitleTextView;
//请输入发票抬头
@synthesize invoiceHeadValueEditText;
//配送方式:
@synthesize deliverWayTitleTextView;
//emsCheck
@synthesize emsCheckButton;
//ems
@synthesize emsTextView;
//smallpackCheck
@synthesize smallPackCheckButton;
//国内小包
@synthesize smallpackTitleTextView;
//寄递费
@synthesize deliverMoneyTitleTextView;
//10元
@synthesize deliverMoneyValueTextView;
//小记:
@synthesize totalmoneyTextView;
//90元
@synthesize totalmoneyValueTextView;
- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated{
}



@end

