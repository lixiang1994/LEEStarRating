# LEEStarRating

简单易用的星星评分视图控件 支持整颗 , 半颗 , 无限制评分 可自定义分数范围和星星个数等.

演示
==============
![演示](https://github.com/lixiang1994/LEEStarRating/blob/master/demo.gif)

特性
==============
- 支持三种评分类型 整颗 半颗 无限制.
- 支持自定义星星数量以及间距.
- 支持不同分数范围并自动计算当前分数
- 支持点击评分 滑动评分.
- 支持自定义图标.

用法
==============

### Objective-c

#### 初始化并设置

```
        // 初始化并设置frame和个数
        
        LEEStarRating *ratingView = [[LEEStarRating alloc] initWithFrame:CGRectMake(15, 100, CGRectGetWidth(self.view.frame) - 30, 0) Count:10]; 
        
        ratingView.spacing = 10.0f; //间距
        
        ratingView.checkedImage = [UIImage imageNamed:@"star_orange"]; //选中图片
        
        ratingView.uncheckedImage = [UIImage imageNamed:@"star_gray"]; //未选中图片
        
        ratingView.type = RatingTypeWhole; //评分类型
        
        ratingView.touchEnabled = YES; //是否启用点击评分 如果纯为展示则不需要设置
        
        ratingView.slideEnabled = YES; //是否启用滑动评分 如果纯为展示则不需要设置
        
        ratingView.maximumScore = 10.0f; //最大分数
        
        ratingView.minimumScore = 0.0f; //最小分数
        
        [self.view addSubview:ratingView]; //添加到父视图
        
```

#### 设置当前分数及回调

```
        // 当前分数变更事件回调
        
        ratingView.currentScoreChangeBlock = ^(CGFloat score){
            
            scoreLabel.text = [NSString stringWithFormat:@"%.1f" , score];
            
            NSLog(@"当前分数 [%.2f]" , score);
        };
        
        // 请在设置完成最大最小的分数后再设置当前分数 并确保当前分数在最大和最小分数之间
        
        ratingView.currentScore = 2.3f;
```
    
### Swift
待更新


安装
==============

### 手动安装

1. 下载 LEEStarRating 文件夹内的所有内容。
2. 将 LEEStarRating 内的源文件添加(拖放)到你的工程。
3. 导入 `LEEStarRating.h`。

系统要求
==============
该控件最低支持 `iOS 7.0` 和 `Xcode 7.0` (其他未测)

许可证
==============
LEEStarRating 使用 GPL V3 许可证，详情见 LICENSE 文件。

友情链接
==============
[一行代码搞定主题管理 - LEETheme](https://github.com/lixiang1994/LEETheme)

[一行代码搞定Alert - LEEAlert](https://github.com/lixiang1994/LEEAlert)

[一行代码搞定ActionSheet - LEEActionSheet](https://github.com/lixiang1994/LEEActionSheet)

个人主页
==============
[我的简书](http://www.jianshu.com/users/a6da0db100c8)
[我的博客](http://www.lee1994.com)
