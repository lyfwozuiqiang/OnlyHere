//
//  OrderTypeDefine.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/3.
//  Copyright © 2020 None. All rights reserved.
//

#ifndef OrderTypeDefine_h
#define OrderTypeDefine_h

typedef NS_ENUM(NSInteger,OrderStateType) {
    OrderStateWaitPayment,
    OrderStateWaitBussinessAccept,
    OrderStateWaitBussinessPrepare,
    OrderStateRiderGoToBussiness,
    OrderStateRiderDeliver,
    OrderStateFinishiDeliver,
    OrderStateFinish,
    OrderStateCancel
};

#endif /* OrderTypeDefine_h */
