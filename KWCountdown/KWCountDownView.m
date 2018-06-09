//
//  KWCountDownView.m
//  KWCountdown
//
//  Created by KW on 18/6/9.
//  Copyright © 2018年 KW. All rights reserved.
//

#import "KWCountDownView.h"

@interface KWCountDownView ()
{
    NSTimer *timer;
}
@property (assign, nonatomic) float labelWidth;
@end

@implementation KWCountDownView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.labelWidth = (frame.size.width - 40) / 3;
        
        [self setupSubview];
    }
    return self;
}


- (void)setTimestamp:(NSInteger)timestamp {
    _timestamp = timestamp;
    if (_timestamp != 0) {
        timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    }
}

- (void)setBackgroundImage:(NSString *)backgroundImage{
    _backgroundImage = backgroundImage;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:backgroundImage]];
    imageView.frame = self.bounds;
    [self addSubview:imageView];
}

-(void)timer:(NSTimer*)timerr{
    _timestamp --;
    [self getDetailTimeWithTimestamp:_timestamp];
    if (_timestamp == 0) {
        [timer invalidate];
        timer = nil;
        // 执行block回调
        self.timerStopBlock();
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
    
    //    self.dayLabel.text = [NSString stringWithFormat:@"%zd天",day];
    UILabel *hourLabel = [self viewWithTag:100];
    hourLabel.text = [NSString stringWithFormat:@"%zd",hour];
    UILabel *minuesLabel = [self viewWithTag:101];
    minuesLabel.text = [NSString stringWithFormat:@"%zd",minute];
    UILabel *secondsLabel = [self viewWithTag:102];
    secondsLabel.text = [NSString stringWithFormat:@"%zd",second];
}

- (void)setupSubview {
    for (int i = 0; i < 3; i ++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((self.labelWidth + 20) * i, 0, self.labelWidth, self.labelWidth)];
        label.tag = 100 + i;
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.masksToBounds = YES;
        label.layer.cornerRadius = 5;
        label.layer.borderWidth = 1;
        label.layer.borderColor = [UIColor blackColor].CGColor;
        [self addSubview:label];
        
        if (i < 2) {
            UILabel *maohao = [[UILabel alloc] initWithFrame:CGRectMake(self.labelWidth + (self.labelWidth + 20) * i, 0, 20, self.labelWidth)];
            maohao.text = @":";
            maohao.textAlignment = NSTextAlignmentCenter;
            maohao.font = [UIFont systemFontOfSize:20];
            [self addSubview:maohao];
        }
    }
}


@end
