


#import <Foundation/Foundation.h>
/*订单预处理0037*/
@interface RespondParam0037:NSObject
/* 预受理单数量 备注:循环域开始*/
@property ( nonatomic) int preOrderNum;
/* 预处理单编号 备注:2015/6/17增加*/
@property ( nonatomic) NSString *prepNumber;
/* 配送方式 备注:*/
@property ( nonatomic) NSString *shipType;
/* 预受理单数量 备注:循环域结束*/
//@property ( nonatomic) int preOrderNum;
/* 预受理单关联商品数量 备注:2015/6/17增加
循环域开始*/
@property ( nonatomic) int merchInfoNum;
/* 关联预受理单编号 备注:为了避免嵌套循环，通过预受理单关联对应的商品，一个预受理单可关联多个商品*/
@property ( nonatomic) NSString *LinkprepNumber1;
/* 业务代号 备注:*/
@property ( nonatomic) NSString *busiNo;
/* 商品代号 备注:*/
@property ( nonatomic) NSString *merchID;
/* 商品规格 备注:单张、四方连*/
@property ( nonatomic) NSString *normsType;
/* 商品价格 备注:*/
@property ( nonatomic) float merchPrice;
/* 购买价格 备注:*/
@property ( nonatomic) float buyPrice;
/* 预受理单关联商品数量 备注:2015/6/17增加
循环域结束*/
//@property ( nonatomic) int merchInfoNum;
/* 预受理单关联配送模式数量 备注:2015/6/17增加
循环域开始*/
@property ( nonatomic) int shipModeNum;
/* 关联预受理单编号 备注:为了避免嵌套循环，通过预受理单关联对应的佩服模式，一个预受理单可关联配送模式*/
//@property ( nonatomic) NSString *LinkprepNumber1;
/* 配送模式 备注:01：EMS
02：小包*/
@property ( nonatomic) NSString *shipMode;
/* 配送费用 备注:*/
@property ( nonatomic) float shipFee;
/* 预受理单关联配送费用 备注:2015/6/17增加
循环域结束*/
//@property ( nonatomic) int shipModeNum;
@end


