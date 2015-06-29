


#import <Foundation/Foundation.h>
/*订单生成0038*/
@interface RespondParam0038:NSObject
/* 订单数量 备注:循环域开始*/
@property ( nonatomic) int orderNoNum;
/* 订单号 备注:*/
@property ( nonatomic) NSString *orderNo;
/* 个性化订单号 备注:默认为空*/
@property ( nonatomic) NSString *perOrderId;
/* 订单总金额 备注:*/
@property ( nonatomic) float orderTotalAmount;
/* 运费 备注:*/
@property ( nonatomic) float freight;
/* 订单数量 备注:循环域结束*/
//@property ( nonatomic) int orderNoNum;
@end


