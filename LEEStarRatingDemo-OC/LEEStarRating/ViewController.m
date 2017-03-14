//
//  ViewController.m
//  LEEStarRating
//
//  Created by 李响 on 2017/3/13.
//  Copyright © 2017年 lee. All rights reserved.
//

#import "ViewController.h"

#import "LEEStarRating.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    /** 整颗星星类型 */
    {
        
        UICountingLabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 30)];
        
        scoreLabel.textAlignment = NSTextAlignmentCenter;
        
        scoreLabel.
        
        LEEStarRating *ratingView = [[LEEStarRating alloc] initWithFrame:CGRectMake(15, 100, CGRectGetWidth(self.view.frame) - 30, 0) Count:10]; //初始化并设置frame和个数
        
        ratingView.spacing = 10.0f; //间距
        
        ratingView.checkedImage = [UIImage imageNamed:@"star_orange"]; //选中图片
        
        ratingView.uncheckedImage = [UIImage imageNamed:@"star_gray"]; //未选中图片
        
        ratingView.type = RatingTypeWhole; //评分类型
        
        ratingView.scoreEnabled = YES; //是否启用评分 如果纯为展示则不需要设置
        
        ratingView.maximumScore = 10.0f; //最大分数
        
        ratingView.minimumScore = 0.0f; //最小分数
        
        [self.view addSubview:ratingView];
        
        // 当前分数变更事件回调
        
        ratingView.currentScoreChangeBlock = ^(CGFloat score){
            
            NSLog(@"一 [%.2f]" , score);
        };
        
        // 请在设置完成最大最小的分数后再设置当前分数 并确保当前分数在最大和最小分数之间
        
        ratingView.currentScore = 2.3f;
    }
    
    
    /** 半颗星星类型 */
    {

        LEEStarRating *ratingView = [[LEEStarRating alloc] initWithFrame:CGRectMake(15, 200, CGRectGetWidth(self.view.frame) - 30, 0) Count:10];
        
        ratingView.spacing = 10.0f;
        
        ratingView.checkedImage = [UIImage imageNamed:@"star_orange"];
        
        ratingView.uncheckedImage = [UIImage imageNamed:@"star_gray"];
        
        ratingView.type = RatingTypeHalf;
        
        ratingView.scoreEnabled = YES;
        
        ratingView.maximumScore = 10.0f;
        
        ratingView.minimumScore = 0.0f;
        
        [self.view addSubview:ratingView];
        
        ratingView.currentScoreChangeBlock = ^(CGFloat score){
            
            NSLog(@"二 [%.2f]" , score);
        };
        
        // 请在设置完成最大最小的分数后再设置当前分数
        
        ratingView.currentScore = 2.3f;
    }
    
    
    /** 无限制类型 */
    {
        
        LEEStarRating *ratingView = [[LEEStarRating alloc] initWithFrame:CGRectMake(15, 300, CGRectGetWidth(self.view.frame) - 30, 0) Count:10];
        
        ratingView.spacing = 10.0f;
        
        ratingView.checkedImage = [UIImage imageNamed:@"star_orange"];
        
        ratingView.uncheckedImage = [UIImage imageNamed:@"star_gray"];
        
        ratingView.type = RatingTypeUnlimited;
        
        ratingView.scoreEnabled = YES;
        
        ratingView.maximumScore = 10.0f;
        
        ratingView.minimumScore = 0.0f;
        
        [self.view addSubview:ratingView];
        
        ratingView.currentScoreChangeBlock = ^(CGFloat score){
            
            NSLog(@"三 [%.2f]" , score);
        };
        
        // 请在设置完成最大最小的分数后再设置当前分数
        
        ratingView.currentScore = 2.3f;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
