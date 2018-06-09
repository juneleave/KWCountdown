//
//  ViewController.m
//  KWCountdown
//
//  Created by KW on 18/6/9.
//  Copyright © 2018年 KW. All rights reserved.
//

#import "ViewController.h"
#import "KWCountDown.h"
#import "KWCountDownView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.nsobject
    KWCountDown *cd = [[KWCountDown alloc] init];
    cd.timestamp = 23;
    cd.timerBlock = ^ (NSDictionary *dic) {
        NSLog(@"===%@", dic);
    };
    
    //2.
    KWCountDownView *cdv = [[KWCountDownView alloc] initWithFrame:CGRectMake(60, 100, 160, 40)];
    cdv.timestamp = 100;
    cdv.timerStopBlock = ^ {
        NSLog(@"finish");
    };
    [self.view addSubview:cdv];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
