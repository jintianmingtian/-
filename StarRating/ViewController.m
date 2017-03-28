//
//  ViewController.m
//  星级评论
//
//  Created by cyf on 2017/3/23.
//  Copyright © 2017年 mc. All rights reserved.
//

#import "ViewController.h"
#import "StarsComments.h"


@interface ViewController ()<StarsCommentsDelegate>{
    StarsComments * _starsComments;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _starsComments = [[StarsComments alloc] initWithFrame:CGRectMake(0, 150, self.view.bounds.size.width, 50) withTotalNumber:5 withNumberSelect:0];
    _starsComments.delegate = self;
    _starsComments.backgroundColor = [UIColor redColor];
    _starsComments.starsCommentsLocation = StarsCommentsLocationCenter;
    [self.view addSubview:_starsComments];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)starsSelectNumber:(NSInteger)number{
    NSLog(@"%ld", number);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
