//
//  StarsComments.m
//  星级评论
//
//  Created by cyf on 2017/3/23.
//  Copyright © 2017年 mc. All rights reserved.
//




#import "StarsComments.h"
#import <QuartzCore/QuartzCore.h>
#import "StarsView.h"

static CGFloat const tagStart = 100000;

@interface StarsComments ()
@property (nonatomic, assign) NSInteger totalNumber;
@property (nonatomic, assign) NSInteger numberSelect;
@property (nonatomic, assign) CGSize size;

@end


@implementation StarsComments
//setter
- (void)setStarsCommentsLocation:(StarsCommentsLocation)starsCommentsLocation{
    _starsCommentsLocation = starsCommentsLocation;
    [self layoutSubviews];
}

- (void)setCrossPadding:(CGFloat)crossPadding{
    _crossPadding = crossPadding;
    [self layoutSubviews];
}

- (void)setVerticalPadding:(CGFloat)verticalPadding{
    _verticalPadding = verticalPadding;
    [self layoutSubviews];
}

- (instancetype)initWithFrame:(CGRect)frame withTotalNumber:(NSInteger)totalNumber withNumberSelect:(NSInteger)numberSelect
{
    self = [super initWithFrame:frame];
    if (self) {
        self.totalNumber = totalNumber;
        self.numberSelect = numberSelect - 1;
        self.size = CGSizeMake(frame.size.height, frame.size.height);
        self.crossPadding = 10;
        self.verticalPadding = 10;
        self.starsCommentsLocation = StarsCommentsLocationLeft;
        [self addSubviews];
    }
    return self;
}


- (void)addSubviews{
    for (int i = 0; i < self.totalNumber; i++) {
        StarsView * starsView = [[StarsView alloc] init];
        starsView.tag = tagStart + i;
        [self addSubview:starsView];
        
        UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(starsCommentsAction:)];
        [starsView addGestureRecognizer:ges];
    }
    [self layoutSubviews];
}

- (void)starsCommentsAction:(UITapGestureRecognizer *)recognizer{
    self.numberSelect = recognizer.view.tag - tagStart;
    [self selectStarsViewsWithNumberSelect:self.numberSelect];
    if ([self.delegate respondsToSelector:@selector(starsSelectNumber:)]) {
        [self.delegate starsSelectNumber:self.numberSelect + 1];
    }
}

- (void)selectStarsViewsWithNumberSelect:(NSInteger)number{
    for (int i = 0; i < self.totalNumber; i++) {
        StarsView * starsView = [self viewWithTag:tagStart + i];
        if (i <= number) {
            starsView.starsState = YES;
        }else{
            starsView.starsState = NO;
        }
    }
}

- (void)layoutSubviews{
    
    CGFloat starX = 0.0;
    CGFloat starY = self.verticalPadding;
    CGFloat starW = self.size.height - 2 * self.verticalPadding;
    CGFloat starH = self.size.height - 2 * self.verticalPadding;
    
    switch (self.starsCommentsLocation) {
        case StarsCommentsLocationLeft:{
            starX = 0;
        }
            break;
            
        case StarsCommentsLocationCenter:{
            starX = self.bounds.size.width / 2 - (self.totalNumber * starW + (self.totalNumber - 1) * self.crossPadding ) / 2;
        }
            break;
            
        case StarsCommentsLocationRight:{
            starX = self.bounds.size.width - (self.totalNumber * (starW + self.crossPadding));

        }
            break;
            
        default:
            break;
    }
    
    for (int i = 0; i < self.totalNumber; i++) {
        StarsView * starsView = [self viewWithTag:tagStart + i];
        starsView.frame = CGRectMake(starX + (starW + self.crossPadding) * i, starY, starW, starH);
    }

    [self selectStarsViewsWithNumberSelect:self.numberSelect];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
