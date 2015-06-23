


#import <Foundation/Foundation.h>
/*订单查询0040*/
@interface RespondParam0040:NSObject
/* totalNum 备注:*/
@property ( nonatomic) int 最大记录数;
/* recordNum 备注:循环域开始*/
@property ( nonatomic) int 返回的记录数;
/* orderNo 备注:*/
@property ( nonatomic) NSString *订单号;
/* busiNo 备注:*/
@property ( nonatomic) NSString *业务代号;
/* orderAmt 备注:*/
@property ( nonatomic) float 订单总金额;
/* bookDate 备注:格式:yyyymmdd*/
@property ( nonatomic) NSString *下单日期;
/* payStatus 备注:*/
@property ( nonatomic) NSString *支付状态;
/* dealStatus 备注:*/
@property ( nonatomic) NSString *处理状态;
/* channelNo 备注:*/
@property ( nonatomic) NSString *渠道代号;
/* recordNum 备注:循环域结束*/
@property ( nonatomic) int 返回的记录数;
@end


