//
//  ViewController.m
//  customSwitch
//
//  Created by 凌甜 on 2018/5/7.
//  Copyright © 2018年 凌甜. All rights reserved.
//

#import "ViewController.h"
#import "LTCustomSwitch.h"
@interface ViewController ()
@property (nonatomic,strong) LTCustomSwitch *switchView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LTCustomSwitch *switchView = [[LTCustomSwitch alloc]initWithFrame:CGRectMake(80, 100, 65, 30) onColor:[UIColor clearColor] offColor:[UIColor grayColor] font:[UIFont systemFontOfSize:15] leftBallSize:10 rightBallSize:20];
    switchView.backgroundColor = [UIColor greenColor];
    switchView.tintColor = [UIColor clearColor];
    switchView.onTintColor = [UIColor colorWithWhite:0.8 alpha:1];
    switchView.leftThumbTintColor = [UIColor colorWithWhite:0.8 alpha:1];
    switchView.rightThumbTintColor = [UIColor whiteColor];
    switchView.borderColor = [UIColor colorWithWhite:0.8 alpha:1];
    self.switchView = switchView;
    [self.view addSubview:switchView];
    [switchView addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
}

- (void)change:(UISwitch *)switch1{
    NSLog(@"%s",__func__);
    
}
- (void)changeValue:(LTCustomSwitch *)switchView{
    
    
    NSLog(@"%s",__func__);
}

@end
