//
//  StarsView.m
//  星级评论
//
//  Created by cyf on 2017/3/27.
//  Copyright © 2017年 mc. All rights reserved.
//

#import "StarsView.h"

/**
 @param nonatomic  配置颜色 星星的颜色
 @param  Stars_SelectColor  //选中的颜色
 @param  Stars_NormalColor  //正常的颜色
 */
#define Stars_SelectColor [UIColor yellowColor]
#define Stars_NormalColor  [UIColor lightGrayColor]


@interface StarsView ()

@property (nonatomic, strong) UIColor * backColor;

@end

@implementation StarsView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.backColor = Stars_NormalColor;
        self.starsState = NO;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{    //定义一个开始路径
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    UIBezierPath *startPath = [UIBezierPath bezierPath];
    //开始画五角星
    [startPath moveToPoint:CGPointMake(width / 2, 0.0)];
    [startPath addLineToPoint:CGPointMake(width * 3 / 8, height * 3 / 8)];
    [startPath addLineToPoint:CGPointMake(0.0, height * 3 / 8)];
    [startPath addLineToPoint:CGPointMake(width / 4, height * 5 / 8)];
    [startPath addLineToPoint:CGPointMake(width / 8, height)];
    [startPath addLineToPoint:CGPointMake(width / 2, height * 3 / 4)];
    [startPath addLineToPoint:CGPointMake(width * 7 / 8, height)];
    [startPath addLineToPoint:CGPointMake(width * 3 / 4, height * 5 / 8)];
    [startPath addLineToPoint:CGPointMake(width, height * 3 / 8)];
    [startPath addLineToPoint:CGPointMake(width * 5 / 8, height * 3 / 8)];
    [startPath closePath];
    
    //设置当前的颜色
    UIColor* fillColor = self.backColor;
    [fillColor setFill];
    [startPath fill];
}

- (void)setStarsState:(BOOL)starsState{
    _starsState = starsState;
    if (!_starsState) {
        self.backColor = Stars_NormalColor;
    }else{
        self.backColor = Stars_SelectColor;
    }
    
    [self setNeedsDisplay];
}

@end
