//
//  LSHttpParameter.h
//  LookScore
//
//  Created by wr on 2018/1/16.
//  Copyright © 2018年 ChongQingXunTiCompany. All rights reserved.
//
//#import <objc/runtime.h>
#ifndef LSHttpParameter_h
#define LSHttpParameter_h

#ifdef DEBUG // 处于开发阶段

#define MyLog(...) NSLog(__VA_ARGS__)

#else //处于发布阶段
#define MyLog(...)
#endif


#define GetAuditInfo @"common/softUpdateV2"//审核模式

#define FreeCoinsList @"common/freeCoinsList"

#define PostsList @"analytics/postsList"

#define RankList @"rank/rankList"//排行数据

#define AddErrorlog @"common/addErrorLog"


//#define Index @"test/index"

#define GetGrowthList @"Analytics/getGrowthList"

/**用户中心Api*/
#define GetHeader @"account/getHeader"

#define GetAccount @"accountnew/getAccount"

#define GetUserName @"accountnew/getInsUserName"

#define GetUserDetail @"user/userDetail"
#define AccountMedias @"accountnew/accountMedias"
#define GoodList @"goods/goodsList"
#define GoldList @"goods/goldList"
#define BuyGoods @"pay/buyGoods" //购买粉丝或者赞
#define BuyGoldMakeOrder @"pay/buyGoldMakeOrder" //购买金币
#define OrderList @"order/orderList"//订单列表

#define SignAddCoins @"user/signAddCoins"

#define BuyGoldAppleCallback @"pay/buyGoldAppleCallback"//回调

#define SoftUpdate @"common/softUpdate" //软件更新

#define FeedBackAdd @"user/feedBackAdd" //反馈

#define FaqList @"user/faqList"

#define TagsList @"user/tagsList"

#define AppMessageList @"user/appMessageLogList"

#define BindRegistration @"user/bindRegistrationIDtoUser"

#define SignAddCoins @"user/signAddCoins"
#define FreeCoinsAdd @"freeCoins/freeCoinsAdd"
#define BuyGoodsEdit @"pay/buyGoodsEdit"

#define mark --------sh
#define FavoritesAdd @"sh.v2.favorites/favoritesAdd"
#define FavoritesList @"sh.v2.favorites/favoritesList"
#define FavoritesEdit @"sh.v2.favorites/favoritesEdit"
#define FavoritesDel @"sh.v2.favorites/favoritesDel"

#define SHTagsList @"sh.v2.user/tagsList"
#define SearchList @"sh.user/searchList"
#define SHUserDetail @"sh.v2.user/userDetail"


#define AddUserPeanut @"sh.v2.user/addUserPeanut"
#define PicList @"sh.v2.pic/picList"//图片列表

#define SHRegister @"sh.v2.user/register"
#define SHLogin @"sh.v2.user/login"


#endif /* LSHttpParameter_h */
