
#import "RespondParam0037.h"
@implementation RespondParam0037
/* 预受理单数量 备注:循环域开始*/
@synthesize preOrderNum;
/* 预处理单编号 备注:2015/6/17增加*/
@synthesize prepNumber;
/* 配送方式 备注:*/
@synthesize shipType;
/* 预受理单数量 备注:循环域结束*/
//@synthesize preOrderNum;
/* 预受理单关联商品数量 备注:2015/6/17增加
循环域开始*/
@synthesize merchInfoNum;
/* 关联预受理单编号 备注:为了避免嵌套循环，通过预受理单关联对应的商品，一个预受理单可关联多个商品*/
@synthesize LinkprepNumber1;
/* 业务代号 备注:*/
@synthesize busiNo;
/* 商品代号 备注:*/
@synthesize merchID;
/* 商品规格 备注:单张、四方连*/
@synthesize normsType;
/* 商品价格 备注:*/
@synthesize merchPrice;
/* 购买价格 备注:*/
@synthesize buyPrice;
/* 预受理单关联商品数量 备注:2015/6/17增加
循环域结束*/
//@synthesize merchInfoNum;
/* 预受理单关联配送模式数量 备注:2015/6/17增加
循环域开始*/
@synthesize shipModeNum;
/* 关联预受理单编号 备注:为了避免嵌套循环，通过预受理单关联对应的佩服模式，一个预受理单可关联配送模式*/
//@synthesize LinkprepNumber1;
/* 配送模式 备注:01：EMS
02：小包*/
@synthesize shipMode;
/* 配送费用 备注:*/
@synthesize shipFee;
/* 预受理单关联配送费用 备注:2015/6/17增加
循环域结束*/
//@synthesize shipModeNum;
@end

