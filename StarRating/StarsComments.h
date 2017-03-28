//
//  StarsComments.h
//  星级评论
//
//  Created by cyf on 2017/3/23.
//  Copyright © 2017年 mc. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef enum : NSUInteger {
    StarsCommentsLocationLeft,
    StarsCommentsLocationCenter,
    StarsCommentsLocationRight,
} StarsCommentsLocation;

@protocol StarsCommentsDelegate <NSObject>

/**
 选中几星

 @param number 星级
 */
- (void)starsSelectNumber:(NSInteger)number;

@end

@interface StarsComments : UIView
@property (nonatomic, weak) id<StarsCommentsDelegate>delegate;

/**
 星级的位置 默认是 StarsCommentsLocationLeft
 */
@property (nonatomic, assign) StarsCommentsLocation starsCommentsLocation;

/**
 默认横向间距 默认是 10
 */
@property (nonatomic, assign) CGFloat crossPadding;

/**
 默认纵向间距 默认是 10
 */
@property (nonatomic, assign) CGFloat verticalPadding;

/**
 初始化

 @param frame frame
 @param totalNumber 星级总数
 @param numberSelect 默认选中星级
 */
- (instancetype)initWithFrame:(CGRect)frame withTotalNumber:(NSInteger)totalNumber withNumberSelect:(NSInteger)numberSelect;
@end
