//
//  LTCustomSwitch.m
//  UISwitch
//
//  Created by 凌甜 on 2018/5/6.
//  Copyright © 2018年 凌甜. All rights reserved.
//

#import "LTCustomSwitch.h"
#define LTSwitchMaxHeight 80.0f
#define LTSwitchMinHeight 20.0f

#define LTSwitchMinWidth 40.0f
@interface LTCustomSwitch()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *onContentView;
@property (nonatomic, strong) UIView *offContentView;
@property (nonatomic, strong) UIColor *onColor;
@property (nonatomic, assign) NSInteger leftBallSize;
@property (nonatomic, assign) NSInteger rightBallSize;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *offColor;
@property (nonatomic, strong) UIView *leftKnobView;
@property (nonatomic, strong) UIView *rightKnobView;
@property (nonatomic, strong) UILabel *onLabel;
@property (nonatomic, strong) UILabel *offLabel;

@end

@implementation  LTCustomSwitch

- (id)initWithFrame:(CGRect)frame onColor:(UIColor *)onColor offColor:(UIColor *)offColor font:(UIFont *)font leftBallSize:(NSInteger )leftBallSize rightBallSize:(NSInteger)rightBallSize{
    self = [super initWithFrame:[self roundRect:frame]];
    if (self) {
        self.leftBallSize = leftBallSize;
        self.rightBallSize = rightBallSize;
        self.font = font;
        self.onColor = onColor;
        self.offColor = offColor;
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)setBounds:(CGRect)bounds
{
    [super setBounds:[self roundRect:bounds]];
    
    [self setNeedsLayout];
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:[self roundRect:frame]];
    
    [self setNeedsLayout];
}

- (void)setOnText:(NSString *)onText
{
    if (_onText != onText) {
        _onText = onText;
        
        _onLabel.text = onText;
    }
}

- (void)setOffText:(NSString *)offText
{
    if (_offText != offText) {
        _offText = offText;
        
        _offLabel.text = offText;
    }
}

- (void)setOnTintColor:(UIColor *)onTintColor
{
    if (_onTintColor != onTintColor) {
        _onTintColor = onTintColor;
        
        _onContentView.backgroundColor = onTintColor;
    }
}

- (void)setTintColor:(UIColor *)tintColor
{
    if (_tintColor != tintColor) {
        _tintColor = tintColor;
        
        _offContentView.backgroundColor = tintColor;
    }
}

- (void)setLeftThumbTintColor:(UIColor *)leftThumbTintColor{
    if (_leftThumbTintColor != leftThumbTintColor) {
        _leftThumbTintColor = leftThumbTintColor;
        
        _leftKnobView.backgroundColor = _leftThumbTintColor;
        
    }
}

- (void)setRightThumbTintColor:(UIColor *)rightThumbTintColor{
    
    if (_rightThumbTintColor != rightThumbTintColor) {
        _rightThumbTintColor = rightThumbTintColor;
        _rightKnobView.backgroundColor = _rightThumbTintColor;
    }
    
}

- (void)setBorderColor:(UIColor *)borderColor{
    if (_borderColor != borderColor) {
        _borderColor = borderColor;
        _containerView.layer.borderColor = borderColor.CGColor;
    }
    
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.containerView.frame = self.bounds;
    
    CGFloat r = CGRectGetHeight(self.containerView.bounds) / 2.0;
    
    self.containerView.layer.cornerRadius = r;
    self.containerView.layer.masksToBounds = YES;
    
    CGFloat leftMargin = (CGRectGetHeight(self.bounds) - self.leftBallSize) / 2.0;
    CGFloat rightMargin = (CGRectGetHeight(self.bounds) - self.rightBallSize) / 2.0;
    
    if (!self.isOn) {
        // frame of off status
        self.onContentView.frame = CGRectMake(-1 * CGRectGetWidth(self.containerView.bounds),
                                              0,
                                              CGRectGetWidth(self.containerView.bounds),
                                              CGRectGetHeight(self.containerView.bounds));
        
        self.offContentView.frame = CGRectMake(0,
                                               0,
                                               CGRectGetWidth(self.containerView.bounds),
                                               CGRectGetHeight(self.containerView.bounds));
        
        self.leftKnobView.frame = CGRectMake(leftMargin,
                                        leftMargin,
                                         self.leftBallSize,
                                         self.leftBallSize);
        self.leftKnobView.hidden = NO;
        self.rightKnobView.hidden = YES;
       // NSLog(@"---------%@",NSStringFromCGRect(self.knobView.frame));
    } else {
        // frame of on status
        self.onContentView.frame = CGRectMake(0,
                                              0,
                                              CGRectGetWidth(self.containerView.bounds),
                                              CGRectGetHeight(self.containerView.bounds));
        
        self.offContentView.frame = CGRectMake(0,
                                               CGRectGetWidth(self.containerView.bounds),
                                               CGRectGetWidth(self.containerView.bounds),
                                               CGRectGetHeight(self.containerView.bounds));
        
        self.rightKnobView.frame = CGRectMake(CGRectGetWidth(self.containerView.bounds) - rightMargin - self.rightBallSize,
                                         rightMargin,
                                         self.rightBallSize,
                                         self.rightBallSize);
        self.leftKnobView.hidden = NO;
        self.rightKnobView.hidden = YES;
        // NSLog(@"---------------------%@",NSStringFromCGRect(self.knobView.frame));
    }
    
    CGFloat lHeight = 20.0f;
    CGFloat lMargin = r - (sqrtf(powf(r, 2) - powf(lHeight / 2.0, 2))) + leftMargin;
    
    self.onLabel.frame = CGRectMake(lMargin,
                                    r - lHeight / 2.0,
                                    CGRectGetWidth(self.onContentView.bounds) - lMargin - self.leftBallSize - 2 * leftMargin,
                                    lHeight);
    
    self.offLabel.frame = CGRectMake(self.rightBallSize + 2 * rightMargin,
                                     r - lHeight / 2.0,
                                     CGRectGetWidth(self.onContentView.bounds) - lMargin - self.rightBallSize - 2 * rightMargin,
                                     lHeight);
}

- (void)setOn:(BOOL)on
{
    [self setOn:on animated:NO];
}

- (void)setOn:(BOOL)on animated:(BOOL)animated
{
    if (_on == on) {
        return;
    }
    
    _on = on;
    
    CGFloat leftMargin = (CGRectGetHeight(self.bounds) - self.leftBallSize) / 2.0;
    CGFloat rightMargin = (CGRectGetHeight(self.bounds) - self.rightBallSize) / 2.0;
    
    if (!animated) {
        if (!self.isOn) {
            // frame of off status
            self.onContentView.frame = CGRectMake(-1 * CGRectGetWidth(self.containerView.bounds),
                                                  0,
                                                  CGRectGetWidth(self.containerView.bounds),
                                                  CGRectGetHeight(self.containerView.bounds));
            
            self.offContentView.frame = CGRectMake(0,
                                                   0,
                                                   CGRectGetWidth(self.containerView.bounds),
                                                   CGRectGetHeight(self.containerView.bounds));
            
            self.leftKnobView.frame = CGRectMake(leftMargin,
                                             leftMargin,
                                             self.leftBallSize,
                                             self.leftBallSize);
            self.rightKnobView.hidden = YES;
            self.leftKnobView.hidden = NO;
           // NSLog(@"%@",NSStringFromCGRect(self.knobView.frame));
        } else {
            // frame of on status
            self.onContentView.frame = CGRectMake(0,
                                                  0,
                                                  CGRectGetWidth(self.containerView.bounds),
                                                  CGRectGetHeight(self.containerView.bounds));
            
            self.offContentView.frame = CGRectMake(0,
                                                   CGRectGetWidth(self.containerView.bounds),
                                                   CGRectGetWidth(self.containerView.bounds),
                                                   CGRectGetHeight(self.containerView.bounds));
            
            self.rightKnobView.frame = CGRectMake(CGRectGetWidth(self.containerView.bounds) - rightMargin - self.rightBallSize,
                                             rightMargin,
                                             self.rightBallSize,
                                             self.rightBallSize);
            self.leftKnobView.hidden = YES;
            self.rightKnobView.hidden = NO;
           // NSLog(@"%@",NSStringFromCGRect(self.knobView.frame));
        }
    } else {
        if (self.isOn) {
            [UIView animateWithDuration:0.25
                             animations:^{
                                 self.leftKnobView.frame = CGRectMake(CGRectGetWidth(self.containerView.bounds) - leftMargin - self.leftBallSize,
                                                                  leftMargin,
                                                                  self.leftBallSize,
                                                                  self.leftBallSize);
                             }
                             completion:^(BOOL finished){
                                 self.onContentView.frame = CGRectMake(0,
                                                                       0,
                                                                       CGRectGetWidth(self.containerView.bounds),
                                                                       CGRectGetHeight(self.containerView.bounds));
                                 
                                 self.offContentView.frame = CGRectMake(0,
                                                                        CGRectGetWidth(self.containerView.bounds),
                                                                        CGRectGetWidth(self.containerView.bounds),
                                                                        CGRectGetHeight(self.containerView.bounds));
                             }];
        } else {
            [UIView animateWithDuration:0.25
                             animations:^{
                                 self.rightKnobView.frame = CGRectMake(rightMargin,
                                                                  rightMargin,
                                                                  self.rightBallSize,
                                                                  self.rightBallSize);
                             }
                             completion:^(BOOL finished){
                                 self.onContentView.frame = CGRectMake(-1 * CGRectGetWidth(self.containerView.bounds),
                                                                       0,
                                                                       CGRectGetWidth(self.containerView.bounds),
                                                                       CGRectGetHeight(self.containerView.bounds));
                                 
                                 self.offContentView.frame = CGRectMake(0,
                                                                        0,
                                                                        CGRectGetWidth(self.containerView.bounds),
                                                                        CGRectGetHeight(self.containerView.bounds));
                             }];
        }
    }
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

#pragma mark - Private API

- (void)commonInit
{
    self.backgroundColor = [UIColor clearColor];
    
    _onTintColor = self.onColor;
    _tintColor = self.offColor;
    _rightThumbTintColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    _leftThumbTintColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    _borderColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    
    _textFont = self.font;
    _textColor = [UIColor whiteColor];
    
    _containerView = [[UIView alloc] initWithFrame:self.bounds];
    _containerView.backgroundColor = [UIColor clearColor];
    _containerView.layer.borderColor = _borderColor.CGColor;
    _containerView.layer.borderWidth = 2;
    [self addSubview:_containerView];
    
    _onContentView = [[UIView alloc] initWithFrame:self.bounds];
    _onContentView.backgroundColor = _onTintColor;
    [_containerView addSubview:_onContentView];
    
    _offContentView = [[UIView alloc] initWithFrame:self.bounds];
    _offContentView.backgroundColor = _tintColor;
    [_containerView addSubview:_offContentView];
    
    _rightKnobView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.rightBallSize, self.rightBallSize)];
    _rightKnobView.backgroundColor = _rightThumbTintColor;
    _rightKnobView.layer.cornerRadius = self.rightBallSize / 2.0;
    [_containerView addSubview:_rightKnobView];
    
    _leftKnobView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.leftBallSize, self.leftBallSize)];
    _leftKnobView.backgroundColor = _leftThumbTintColor;
    _leftKnobView.layer.cornerRadius = self.leftBallSize / 2.0;
    _leftKnobView.layer.masksToBounds = YES;
    [_containerView addSubview:_leftKnobView];
    
    _onLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _onLabel.backgroundColor = [UIColor clearColor];
    _onLabel.textAlignment = NSTextAlignmentCenter;
    _onLabel.textColor = _textColor;
    _onLabel.font = _font;
    _onLabel.text = _onText;
    [_onContentView addSubview:_onLabel];
    
    _offLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _offLabel.backgroundColor = [UIColor clearColor];
    _offLabel.textAlignment = NSTextAlignmentCenter;
    _offLabel.textColor = _textColor;
    _offLabel.font = _font;
    _offLabel.text = _offText;
    [_offContentView addSubview:_offLabel];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleTapTapGestureRecognizerEvent:)];
    [self addGestureRecognizer:tapGesture];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handlePanGestureRecognizerEvent:)];
    [self addGestureRecognizer:panGesture];
}

- (CGRect)roundRect:(CGRect)frameOrBounds
{
    CGRect newRect = frameOrBounds;
    
    if (newRect.size.height > LTSwitchMaxHeight) {
        newRect.size.height = LTSwitchMaxHeight;
    }
    
    if (newRect.size.height < LTSwitchMinHeight) {
        newRect.size.height = LTSwitchMinHeight;
    }
    
    if (newRect.size.width < LTSwitchMinWidth) {
        newRect.size.width = LTSwitchMinWidth;
    }
    
    return newRect;
}

- (void)handleTapTapGestureRecognizerEvent:(UITapGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [self setOn:!self.isOn animated:NO];
    }
}

- (void)handlePanGestureRecognizerEvent:(UIPanGestureRecognizer *)recognizer
{
    CGFloat leftMargin = (CGRectGetHeight(self.bounds) - self.leftBallSize) / 2.0;
    CGFloat rightMargin = (CGRectGetHeight(self.bounds) - self.rightBallSize) / 2.0;
    CGFloat offset = 6.0f;
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:{
            if (!self.isOn) {
                [UIView animateWithDuration:0.25
                                 animations:^{
                                     self.leftKnobView.frame = CGRectMake(leftMargin,
                                                                      leftMargin,
                                                                      self.leftBallSize + offset,
                                                                      self.leftBallSize);
                                 }];
            } else {
                [UIView animateWithDuration:0.25
                                 animations:^{
                                     self.rightKnobView.frame = CGRectMake(CGRectGetWidth(self.containerView.bounds) - leftMargin - (self.leftBallSize + offset),
                                                                      rightMargin,
                                                                      self.rightBallSize + offset,
                                                                      self.rightBallSize);
                                 }];
            }
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed: {
            if (!self.isOn) {
                [UIView animateWithDuration:0.25
                                 animations:^{
                                     self.leftKnobView.frame = CGRectMake(leftMargin,
                                                                      leftMargin,
                                                                      self.leftBallSize,
                                                                      self.leftBallSize);
                                 }];
            } else {
                [UIView animateWithDuration:0.25
                                 animations:^{
                                     self.rightKnobView.frame = CGRectMake(CGRectGetWidth(self.containerView.bounds) - self.leftBallSize,
                                                                      rightMargin,
                                                                      self.rightBallSize,
                                                                      self.rightBallSize);
                                 }];
            }
            break;
        }
        case UIGestureRecognizerStateChanged:{
            break;
        }
        case UIGestureRecognizerStateEnded:
            [self setOn:!self.isOn animated:YES];
            break;
        case UIGestureRecognizerStatePossible:
            break;
    }
}


@end


