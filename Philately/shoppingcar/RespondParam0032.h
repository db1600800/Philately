


#import <Foundation/Foundation.h>
/*购物车查询0032*/
@interface RespondParam0032:NSObject
/* 返回的记录数 备注:循环域开始*/
@property ( nonatomic) int recordNum;
/* 购物车代号 备注:*/
@property ( nonatomic) NSString *shoppingCartID;
/* 业务代号 备注:*/
@property ( nonatomic) NSString *busiNo;
/* 商品代号 备注:*/
@property ( nonatomic) NSString *merchID;
/* 图片ID 备注:*/
@property ( nonatomic) NSString *merchPicID;
/* 商品名称 备注:*/
@property ( nonatomic) NSString *merchName;
/* 所属机构 备注:店铺名称*/
@property ( nonatomic) NSString *brchNo;
/* 商品规格 备注:单张、四方连*/
@property ( nonatomic) NSString *normsType;
/* 购买价格 备注:*/
@property ( nonatomic) float buyPrice;
/* 创建时间 备注:*/
@property ( nonatomic) NSString *gmtCreate;
/* 修改时间 备注:*/
@property ( nonatomic) NSString *gmtModify;
/* 返回的记录数 备注:循环域结束*/
//@property ( nonatomic) int recordNum;
@end


