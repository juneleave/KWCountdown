//
//  KWCountDown.m
//  KWCountdown
//
//  Created by KW on 18/6/9.
//  Copyright © 2018年 KW. All rights reserved.
//

#import "KWCountDown.h"

@interface KWCountDown ()
{
    NSTimer *timer;
}
@property (nonatomic, strong) NSMutableDictionary *timeDic;
@end

@implementation KWCountDown
- (instancetype)init {
    if ([super init]) {
        
    }
    return self;
}


- (void)setTimestamp:(NSInteger)timestamp {
    _timestamp = timestamp;
    if (_timestamp != 0) {
        timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    }
}


-(void)timer:(NSTimer*)timerr{
    _timestamp --;
    [self getDetailTimeWithTimestamp:_timestamp];
    
    if (self.timerBlock) {
        self.timerBlock(self.timeDic);
    }
    
    if (_timestamp == 0) {
        [timer invalidate];
        timer = nil;
    }
}

- (void)getDetailTimeWithTimestamp:(NSInteger)timestamp{
    NSInteger ms = timestamp;
    NSInteger ss = 1;
    NSInteger mi = ss * 60;
    NSInteger hh = mi * 60;
    NSInteger dd = hh * 24;
    
    // 剩余的
    NSInteger day = ms / dd;// 天
    NSInteger hour = (ms - day * dd) / hh;// 时
    NSInteger minute = (ms - day * dd - hour * hh) / mi;// 分
    NSInteger second = (ms - day * dd - hour * hh - minute * mi) / ss;// 秒
    
    [self.timeDic setObject:[NSString stringWithFormat:@"%ld",day] forKey:@"day"];
    [self.timeDic setObject:[NSString stringWithFormat:@"%ld",hour] forKey:@"hour"];
    [self.timeDic setObject:[NSString stringWithFormat:@"%ld",minute] forKey:@"minute"];
    [self.timeDic setObject:[NSString stringWithFormat:@"%ld",second] forKey:@"second"];
    
}


- (NSMutableDictionary *)timeDic {
    if (!_timeDic) {
        _timeDic = [NSMutableDictionary dictionary];
    }
    return _timeDic;
}

@end
