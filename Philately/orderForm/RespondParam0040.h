


#import <Foundation/Foundation.h>
/*订单查询0040*/
@interface RespondParam0040:NSObject
/* 最大记录数 备注:*/
@property ( nonatomic) int totalNum;
/* 返回的记录数 备注:循环域开始*/
@property ( nonatomic) int recordNum;
/* 订单号 备注:*/
@property ( nonatomic) NSString *orderNo;
/* 业务代号 备注:*/
@property ( nonatomic) NSString *busiNo;
/* 订单总金额 备注:*/
@property ( nonatomic) float orderAmt;
/* 下单日期 备注:格式:yyyymmdd*/
@property ( nonatomic) NSString *bookDate;
/* 支付状态 备注:*/
@property ( nonatomic) NSString *payStatus;
/* 处理状态 备注:*/
@property ( nonatomic) NSString *dealStatus;
/* 渠道代号 备注:*/
@property ( nonatomic) NSString *channelNo;
/* 返回的记录数 备注:循环域结束*/

@end


