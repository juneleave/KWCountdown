//
//  KWCountDown.h
//  KWCountdown
//
//  Created by KW on 18/6/9.
//  Copyright © 2018年 KW. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^KWTimerBlock)(NSDictionary *dic);

@interface KWCountDown : NSObject
@property (nonatomic,assign) NSInteger timestamp;
@property (nonatomic, copy) KWTimerBlock timerBlock;
@end
