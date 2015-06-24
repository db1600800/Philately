


#import <Foundation/Foundation.h>
/*订单详情0041*/
@interface RespondParam0041:NSObject
/* 订单号 备注:*/
@property ( nonatomic) NSString *orderNo;
/* 业务代号 备注:*/
@property ( nonatomic) NSString *busiNo;
/* 渠道代号 备注:*/
@property ( nonatomic) NSString *channelNo;
/* 支付方式 备注:*/
@property ( nonatomic) NSString *payType;
/* 下单日期 备注:*/
@property ( nonatomic) NSString *bookDate;
/* 处理机构 备注:*/
@property ( nonatomic) NSString *dealBrch;
/* 支付状态 备注:*/
@property ( nonatomic) NSString *payStatus;
/* 处理状态 备注:*/
@property ( nonatomic) NSString *dealStatus;
/* 配送方式 备注:自提方式：自提网点代号 、自提码生效；寄递方式：收件人信息 生效*/
@property ( nonatomic) NSString *shipType;
/* 自提网点代号 备注:*/
@property ( nonatomic) NSString *brchNo;
/* 自提码 备注:*/
@property ( nonatomic) NSString *toTheCode;
/* 收货人姓名 备注:收件人信息*/
@property ( nonatomic) NSString *recvName;
/* 详细地址 备注:*/
@property ( nonatomic) NSString *detailAddress;
/* 收件手机号码 备注:*/
@property ( nonatomic) NSString *mobileNo;
/* 邮编 备注:*/
@property ( nonatomic) NSString *postCode;
/* 订单总金额 备注:*/
@property ( nonatomic) float orderAmt;
/* 商品总金额 备注:*/
@property ( nonatomic) float merchAmt;
/* 配送费用 备注:*/
@property ( nonatomic) float shipFee;
/* 已付金额 备注:*/
@property ( nonatomic) float hasPayMoney;
/* 订单备注信息 备注:*/
@property ( nonatomic) NSString *orderRemark;
/* 发票开具类型 备注:不开、个人、单位*/
@property ( nonatomic) NSString *invoiceType;
/* 发票抬头 备注:当发票类型为“单位”时生效*/
@property ( nonatomic) NSString *invoiceTitle;
/* 预处理单号 备注:个性化定制业务才有预处理单号*/
@property ( nonatomic) NSString *prepNumber;
/* 操作类型 备注:支付、取消、换货等*/
@property ( nonatomic) NSString *operationType;
/* 操作截止日期 备注:*/
@property ( nonatomic) NSString *operationEndDate;
/* 处理时间 备注:yymmddhhmmss*/
@property ( nonatomic) NSString *dealTime;
/* 处理类型 备注:*/
@property ( nonatomic) NSString *dealType;
/* 处理内容 备注:*/
@property ( nonatomic) NSString *dealContent;
/* 处理人 备注:*/
@property ( nonatomic) NSString *dealPerson;
/* 事件类型 备注:退款、补款、摇号、换货*/
@property ( nonatomic) NSString *eventType;
/* 事件状态 备注:未审核、审核通过、审核不通过等*/
@property ( nonatomic) NSString *eventStatus;
/* 事件描述 备注:*/
@property ( nonatomic) NSString *eventDesc;
/* 支付流水 备注:*/
@property ( nonatomic) NSString *paySeq;
/* 支付流水状态 备注:支付、退款、补款*/
@property ( nonatomic) NSString *paySeqStatus;
/* 金额 备注:*/
@property ( nonatomic) float payMoney;
/* 流水操作状态 备注:*/
@property ( nonatomic) NSString *payOperStatus;
/* 操作时间 备注:*/
@property ( nonatomic) NSString *payDealTime;
/* 银行流水 备注:*/
@property ( nonatomic) NSString *bankSeq;
/* 备注 备注:*/
@property ( nonatomic) NSString *payRemark;
/* 子订单数量 备注:循环域开始*/
@property ( nonatomic) int subOrderNum;
/* 子订单号 备注:*/
@property ( nonatomic) NSString *subOrderNo1;
/* 子订单状态 备注:*/
@property ( nonatomic) NSString *subOrderStatus;
/* 子订单总金额 备注:*/
@property ( nonatomic) float subOrderAmt;
/* 商品总金额 备注:*/
@property ( nonatomic) float subMerchAmt;
/* 配送费用 备注:*/
@property ( nonatomic) float subShipFee;
/* 子订单数量 备注:循环域结束*/
@property ( nonatomic) int subOrderNum;
/* 子订单号 备注:*/
@property ( nonatomic) NSString *subOrderNo2;
/* 处理时间 备注:yymmddhhmmss*/
@property ( nonatomic) NSString *subdealTime;
/* 处理类型 备注:*/
@property ( nonatomic) NSString *subdealType;
/* 处理内容 备注:*/
@property ( nonatomic) NSString *subdealContent;
/* 处理人 备注:*/
@property ( nonatomic) NSString *subdealPerson;
/* 子订单号 备注:*/
@property ( nonatomic) NSString *subOrderNo3;
/* 物流公司 备注:*/
@property ( nonatomic) NSString *logistCompany;
/* 物流单号 备注:yymmddhhmmss*/
@property ( nonatomic) NSString *logistNum;
/* 处理时间 备注:yymmddhhmmss*/
@property ( nonatomic) NSString *logistDealTime;
/* 商品代号 备注:*/
@property ( nonatomic) NSString *merchID;
/* 图片ID 备注:*/
@property ( nonatomic) NSString *merchPicID;
/* 商品名称 备注:*/
@property ( nonatomic) NSString *merchName;
/* 商品规格 备注:*/
@property ( nonatomic) NSString *normsType;
/* 模式单价 备注:*/
@property ( nonatomic) float normsPrice;
/* 商品购买数量 备注:*/
@property ( nonatomic) int merchNum;
@end


