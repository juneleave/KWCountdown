//
//  KWCountDownView.h
//  KWCountdown
//
//  Created by KW on 18/6/9.
//  Copyright © 2018年 KW. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^KWTimerStopBlock)();

@interface KWCountDownView : UIView
// 时间戳
@property (nonatomic,assign) NSInteger timestamp;
// 背景
@property (nonatomic,copy)NSString *backgroundImage;
@property (nonatomic, copy) KWTimerStopBlock timerStopBlock;
@end
