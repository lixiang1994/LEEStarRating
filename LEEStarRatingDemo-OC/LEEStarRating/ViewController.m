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
        
        UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, CGRectGetWidth(self.view.frame), 30)];
        
        scoreLabel.font = [UIFont boldSystemFontOfSize:20.0f];
        
        scoreLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:scoreLabel];
        
        LEEStarRating *ratingView = [[LEEStarRating alloc] initWithFrame:CGRectMake(15, 100, CGRectGetWidth(self.view.frame) - 30, 0) Count:10]; //初始化并设置frame和个数
        
        ratingView.spacing = 10.0f; //间距
        
        ratingView.checkedImage = [UIImage imageNamed:@"star_orange"]; //选中图片
        
        ratingView.uncheckedImage = [UIImage imageNamed:@"star_gray"]; //未选中图片
        
        ratingView.type = RatingTypeWhole; //评分类型
        
        ratingView.touchEnabled = YES; //是否启用点击评分 如果纯为展示则不需要设置
        
        ratingView.slideEnabled = YES; //是否启用滑动评分 如果纯为展示则不需要设置
        
        ratingView.maximumScore = 10.0f; //最大分数
        
        ratingView.minimumScore = 0.0f; //最小分数
        
        [self.view addSubview:ratingView];
        
        // 当前分数变更事件回调
        
        ratingView.currentScoreChangeBlock = ^(CGFloat score){
            
            scoreLabel.text = [NSString stringWithFormat:@"%.1f" , score];
            
            NSLog(@"一 [%.2f]" , score);
        };
        
        // 请在设置完成最大最小的分数后再设置当前分数 并确保当前分数在最大和最小分数之间
        
//        ratingView.currentScore = 2.3f;
    }
    
    
    /** 半颗星星类型 */
    {
        UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, CGRectGetWidth(self.view.frame), 30)];
        
        scoreLabel.font = [UIFont boldSystemFontOfSize:20.0f];
        
        scoreLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:scoreLabel];

        LEEStarRating *ratingView = [[LEEStarRating alloc] initWithFrame:CGRectMake(15, 200, CGRectGetWidth(self.view.frame) - 30, 0) Count:10];
        
        ratingView.spacing = 10.0f;
        
        ratingView.checkedImage = [UIImage imageNamed:@"star_orange"];
        
        ratingView.uncheckedImage = [UIImage imageNamed:@"star_gray"];
        
        ratingView.type = RatingTypeHalf;
        
        ratingView.touchEnabled = YES;
        
        ratingView.slideEnabled = YES;
        
        ratingView.maximumScore = 10.0f;
        
        ratingView.minimumScore = 0.0f;
        
        [self.view addSubview:ratingView];
        
        ratingView.currentScoreChangeBlock = ^(CGFloat score){
            
            scoreLabel.text = [NSString stringWithFormat:@"%.1f" , score];
            
            NSLog(@"二 [%.2f]" , score);
        };
        
        // 请在设置完成最大最小的分数后再设置当前分数
        
        ratingView.currentScore = 2.3f;
    }
    
    
    /** 无限制类型 */
    {
        UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 270, CGRectGetWidth(self.view.frame), 30)];
        
        scoreLabel.font = [UIFont boldSystemFontOfSize:20.0f];
        
        scoreLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:scoreLabel];
        
        LEEStarRating *ratingView = [[LEEStarRating alloc] initWithFrame:CGRectMake(15, 300, CGRectGetWidth(self.view.frame) - 30, 0) Count:10];
        
        ratingView.spacing = 10.0f;
        
        ratingView.checkedImage = [UIImage imageNamed:@"star_orange"];
        
        ratingView.uncheckedImage = [UIImage imageNamed:@"star_gray"];
        
        ratingView.type = RatingTypeUnlimited;
        
        ratingView.touchEnabled = YES;
        
        ratingView.slideEnabled = YES;
        
        ratingView.maximumScore = 10.0f;
        
        ratingView.minimumScore = 0.0f;
        
        [self.view addSubview:ratingView];
        
        ratingView.currentScoreChangeBlock = ^(CGFloat score){
            
            scoreLabel.text = [NSString stringWithFormat:@"%.1f" , score];
            
            NSLog(@"三 [%.2f]" , score);
        };
        
        // 请在设置完成最大最小的分数后再设置当前分数
        
        ratingView.currentScore = 4.32f;
    }
    
    /** 变色星星实现演示 */
    {
        UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 370, CGRectGetWidth(self.view.frame), 30)];
        
        scoreLabel.font = [UIFont systemFontOfSize:14.0f];
        
        scoreLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:scoreLabel];
        
        LEEStarRating *ratingView = [[LEEStarRating alloc] initWithFrame:CGRectMake(40, 400, CGRectGetWidth(self.view.frame) - 80, 0) Count:5];
        
        ratingView.spacing = 10.0f;
        
        ratingView.checkedImage = [UIImage imageNamed:@"star_orange"];
        
        ratingView.uncheckedImage = [UIImage imageNamed:@"star_gray"];
        
        ratingView.type = RatingTypeWhole;
        
        ratingView.touchEnabled = YES;
        
        ratingView.slideEnabled = YES;
        
        ratingView.maximumScore = 10.0f;
        
        ratingView.minimumScore = 0.0f;
        
        [self.view addSubview:ratingView];
        
        __strong LEEStarRating *strongRatingView = ratingView;
        
        ratingView.currentScoreChangeBlock = ^(CGFloat score){
            
            if (score == 0) {
                
                scoreLabel.text = @"点击星星评论";
                
            } else if (score > 0 && score <= 2.0f) {
                
                strongRatingView.checkedImage = [UIImage imageNamed:@"star_yellow"];
                
                scoreLabel.text = @"很差";
                
            } else if (score > 2.0f && score <= 4.0f) {
                
                strongRatingView.checkedImage = [UIImage imageNamed:@"star_yellow"];
                
                scoreLabel.text = @"一般";
                
            } else if (score > 4.0f && score <= 6.0f) {
                
                strongRatingView.checkedImage = [UIImage imageNamed:@"star_orange"];
                
                scoreLabel.text = @"还好";
                
            } else if (score > 6.0f && score <= 8.0f) {
                
                strongRatingView.checkedImage = [UIImage imageNamed:@"star_orange"];
                
                scoreLabel.text = @"很喜欢";
                
            } else if (score > 8.0f && score <= 10.0f) {
                
                strongRatingView.checkedImage = [UIImage imageNamed:@"star_red"];
                
                scoreLabel.text = @"棒极了";
            }
            
            NSLog(@"三 [%.2f]" , score);
        };
        
        // 请在设置完成最大最小的分数后再设置当前分数
        
        ratingView.currentScore = 4.32f;
    }
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
