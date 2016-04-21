//
//  RYNewFeatureCollectionViewController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/20.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYNewFeatureCollectionViewController.h"
#import "RYNewFeatureCollectionViewCell.h"
#import "RYTabBarController.h"

#define RYNewFeaturePageCount 4

/**
 *  知识点总结:
 *  1.使用UICollectionViewController时，必须在创建的时候指定布局样式（一般使用系统提供的流水布局）
 *  2.UICollectionViewController的根视图（self.view）并非UICollectionView,而是将self.collectionView添加到self.view上
 *  3.一般使用UICollectionViewController时，不必要把布局类型暴露在外面设置，需要自己封装到UICollectionViewController控制器中,
 *    此时只需要设置一次布局类型即可，因此一般重写- (instancetype)init方法中设置
 *  4.使用UICollectionViewCell时必须注册，此时只需要注册一次，因此一般在- (void)viewDidLoad中注册(因为我这里复写了init方法，
 *    而且布局类型也在这里定义的，并且在这里也已经创建出了self，所以就在这里注册了)
 *  5.一般情况下我们会自定义UICollectionViewCell
 */
@interface RYNewFeatureCollectionViewController ()

@property (nonatomic, strong) UIImageView *guideImageView;
@property (nonatomic, strong) UIImageView *guideLineImageView;
@property (nonatomic, strong) UIImageView *guideLargeTextImageView;
@property (nonatomic, strong) UIImageView *guideSmallTextImageView;
@property (nonatomic, strong) UIButton *startButton;

/** 最后一次滚动内容视图x的偏移量 */
@property (nonatomic, assign) CGFloat lastContentOffsetX;

@end

@implementation RYNewFeatureCollectionViewController

static NSString *collectionViewCellIdentifier = @"RYCollectionViewCellIdentifier";

/**
 *  重写此方法，在这里设置布局类型，避免暴露在外面创建时设置
 */
- (instancetype)init {
    // 创建流水布局对象
    UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    // 创建一个流水布局的UICollectionViewController对象
    if (self = [super initWithCollectionViewLayout:collectionViewFlowLayout]) {
        // 设置每个Cell（item）的大小
        collectionViewFlowLayout.itemSize = self.view.bounds.size;
        
        // 设置每个Cell（item）的最小列间距
        collectionViewFlowLayout.minimumInteritemSpacing = 0;
        
        // 设置每个Cell（item）的最小行间距
        collectionViewFlowLayout.minimumLineSpacing = 0;
        
        // 设置UICollectionView的滚动方向
        collectionViewFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        // 设置每组的内边距
        collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        // 注册一个UICollectionViewCell
        [self.collectionView registerClass:[RYNewFeatureCollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellIdentifier];
    }
    
    return self;
}

/**
 *  控制器视图加载完成
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    // 设置collectionView的背景色
    self.collectionView.backgroundColor = [UIColor orangeColor];
    
    // 设置collectionView的弹簧效果
    self.collectionView.bounces = NO;
    
    // 设置collectionView的分页效果
    self.collectionView.pagingEnabled = YES;
    
    // 设置collectionView的滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    // 设置子控件
    [self setUpChildSubviews];
}

/**
 *  设置子控件
 */
- (void)setUpChildSubviews {
    // 1.引导主图片
    self.guideImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    self.guideImageView.centerX = self.view.centerX;
    [self.collectionView addSubview:self.guideImageView];
    
    // 2.引导线图片
    self.guideLineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    self.guideLineImageView.x -= 200;
    [self.collectionView addSubview:self.guideLineImageView];
    
    // 3.引导大标题图片
    self.guideLargeTextImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    self.guideLargeTextImageView.centerX = self.view.centerX;
    self.guideLargeTextImageView.y = self.view.height * 0.7;
    [self.collectionView addSubview:self.guideLargeTextImageView];
    
    // 4.引导小标题图片
    self.guideSmallTextImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    self.guideSmallTextImageView.centerX = self.view.centerX;
    self.guideSmallTextImageView.y = self.view.height * 0.8;
    [self.collectionView addSubview:self.guideSmallTextImageView];
    
    // 5.最后一页开始按钮
    self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *buttonImage = [UIImage imageNamed:@"guideStart"];
    [self.startButton setImage:buttonImage forState:UIControlStateNormal];
    
    self.startButton.centerX = self.view.centerX;
    self.startButton.y = self.view.height * 0.9;
    self.startButton.bounds = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    self.startButton.hidden = YES;
    
    [self.startButton addTarget:self action:@selector(startButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.collectionView addSubview:self.startButton];
}

/**
 *  ScrollView滑动减速结束代理方法
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 1.获取当前X的偏移量
    CGFloat currentContentOffsetX = scrollView.contentOffset.x;
    
    // 2.切换引导图片
    // 2.1.计算当前滚动到第几页
    NSInteger currentPage = currentContentOffsetX / self.view.width + 1;
    
    if (RYNewFeaturePageCount == currentPage) {
        self.startButton.hidden = NO;
    } else {
        self.startButton.hidden = YES;
    }
    
    // 2.2.引导主图片
    self.guideImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%ld", currentPage]];
    // 2.3.引导大标题图片
    self.guideLargeTextImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%ld", currentPage]];
    // 2.4.引导小标题图片
    self.guideSmallTextImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%ld", currentPage]];
    
    // 3.获取当前x的偏移和上一次偏移的差值
    CGFloat contentOffsetDelta = currentContentOffsetX - self.lastContentOffsetX;
    
    // 4.动画显示引导图片：手指往左划，图片从右往左滚出;手指往右划，图片从左往右滚出
    // 4.1.这里先让子视图滚动2倍的差值，然后在动画中滚动回来，实现动画效果
    self.guideImageView.centerX += contentOffsetDelta * 2;
    self.guideLargeTextImageView.centerX += contentOffsetDelta * 2;
    self.guideSmallTextImageView.centerX += contentOffsetDelta * 2;
    self.startButton.centerX += contentOffsetDelta * 2;
    
    // 4.2.这里减掉原来加上去的2倍距离的一半就刚好为正确的位置
    [UIView animateWithDuration:0.25 animations:^{
        self.guideImageView.centerX -= contentOffsetDelta;
        self.guideLargeTextImageView.centerX -= contentOffsetDelta;
        self.guideSmallTextImageView.centerX -= contentOffsetDelta;
        self.startButton.centerX -= contentOffsetDelta;
    }];
    
    // 5.记录上一次滚动的位置
    self.lastContentOffsetX = currentContentOffsetX;
}

/**
 *  开始体验按钮点击事件
 */
- (void)startButtonClickAction:(UIButton *)button {
    // 创建一个主界面的对象
    RYTabBarController *tabBarController = [[RYTabBarController alloc] init];
    
    // 更换主窗口的根控制器
    RYKeyWindow.rootViewController = tabBarController;
    
    // 添加转场动画
    CATransition *transitionAnimation = [[CATransition alloc] init];
    transitionAnimation.type = @"cube";
    [RYKeyWindow.layer addAnimation:transitionAnimation forKey:nil];
}

#pragma mark - UICollectionViewController数据源代理方法实现
/**
 *  返回UICollectionView的组数
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

/**
 *  返回UICollectionView当前组的行数（Items数）
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return RYNewFeaturePageCount;
}

/**
 *  返回每组每行的每个UICollectionViewCell
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 1.从缓存池中取出标记的UICollectionViewCell
    RYNewFeatureCollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellIdentifier forIndexPath:indexPath];
    
    // 2.给UICollectionViewCell添加背景色
    collectionViewCell.backgroundColor = [UIColor blackColor];
    
    // 3.给自定义的UICollectionViewCell添加图片
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%ldBackground", indexPath.item + 1]];
    
    collectionViewCell.image = image;
    
    // 4.返回UICollectionViewCell
    return collectionViewCell;
}

@end
