//
//  LTCustomSwitch.h
//  UISwitch
//
//  Created by 凌甜 on 2018/5/6.
//  Copyright © 2018年 凌甜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTCustomSwitch : UIControl
/** 开的时候, 显示的文字*/
@property (nonatomic,strong) NSString *onText;
/** 关的时候, 显示的文字*/
@property (nonatomic,strong) NSString *offText;
/** 开的时候, 背景色*/
@property (nonatomic,strong) UIColor *onTintColor;
/** 关的时候, 背景色*/
@property (nonatomic,strong) UIColor *tintColor;
/** 左边拇指的颜色*/
@property (nonatomic,strong) UIColor *leftThumbTintColor;
/** 右边拇指的颜色*/
@property (nonatomic,strong) UIColor *rightThumbTintColor;
/** 是否开*/
@property (nonatomic,assign,getter=isOn) BOOL on;
/** 文字的字体*/
@property (nonatomic,strong) UIFont *textFont;
/** 文字的颜色*/
@property (nonatomic,strong) UIColor *textColor;
/** 边框的颜色*/
@property (nonatomic,strong) UIColor *borderColor;

- (id)initWithFrame:(CGRect)frame onColor:(UIColor *)onColor offColor:(UIColor *)offColor font:(UIFont *)font leftBallSize:(NSInteger )leftBallSize rightBallSize:(NSInteger)rightBallSize;
@end
