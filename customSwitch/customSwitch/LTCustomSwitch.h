//
//  LTCustomSwitch.h
//  UISwitch
//
//  Created by 凌甜 on 2018/5/6.
//  Copyright © 2018年 凌甜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTCustomSwitch : UIControl
@property (nonatomic,strong) NSString *onText;
@property (nonatomic,strong) NSString *offText;
@property (nonatomic,strong) UIColor *onTintColor;
@property (nonatomic,strong) UIColor *tintColor;
@property (nonatomic,strong) UIColor *leftThumbTintColor;
@property (nonatomic,strong) UIColor *rightThumbTintColor;
@property (nonatomic,assign,getter=isOn) BOOL on;
@property (nonatomic,strong) UIFont *textFont;
@property (nonatomic,strong) UIColor *textColor;
@property (nonatomic,strong) UIColor *borderColor;

- (id)initWithFrame:(CGRect)frame onColor:(UIColor *)onColor offColor:(UIColor *)offColor font:(UIFont *)font leftBallSize:(NSInteger )leftBallSize rightBallSize:(NSInteger)rightBallSize;
@end
