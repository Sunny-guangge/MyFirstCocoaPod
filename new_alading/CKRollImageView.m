//
//  CKRollImageView.m
//  new_alading
//
//  Created by user on 15/7/16.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "CKRollImageView.h"
#import "CKImageViewController.h"

@implementation CKRollImageView
{
    UIScrollView *scrollView;
    UIPageControl *pageContorl;
    NSInteger scroll;
}

#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW [UIScreen mainScreen].bounds.size.width

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREENW, 200)];
    if (self) {
        
        self.imageArray = [NSMutableArray array];
        
        [self createUInterface];
    }
    
    return self;
}

- (void)createUInterface
{
    scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.pagingEnabled = YES;
    scrollView.alwaysBounceVertical = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.directionalLockEnabled = YES;
    scrollView.bounces = NO;
    scrollView.alwaysBounceVertical = NO;
    scrollView.alwaysBounceHorizontal = NO;
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(SCREENW * 5, 200);
    [self addSubview:scrollView];
    
    for (NSInteger i=0; i<5; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*SCREENW, 0, SCREENW, 200)];
        NSString *imageURL = [NSString stringWithFormat:@"image%ld.jpg",(long)i];
        imageView.image = [UIImage imageNamed:imageURL];
        [scrollView addSubview:imageView];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*SCREENW, 0, SCREENW, 200);
        [button addTarget:self action:@selector(didclickImage:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i + 100;
        button.backgroundColor = [UIColor clearColor];
        [scrollView addSubview:button];
    }
    
    pageContorl = [[UIPageControl alloc] initWithFrame:CGRectMake(SCREENW / 2 - 50, 170, 100, 40)];
    pageContorl.numberOfPages = 5;
    pageContorl.currentPage = 0;
    [self addSubview:pageContorl];
    
    scroll = 0;
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(DidscrollViewautoScroll) userInfo:nil repeats:YES];
}

- (void)DidscrollViewautoScroll
{
    if (scroll > 4) {
        scroll = 0;
    }
    [scrollView setContentOffset:CGPointMake(scroll * SCREENW, 0) animated:YES];
    
    scroll += 1;
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    int index = fabs(scrollView.contentOffset.x) / scrollView.frame.size.width;
    pageContorl.currentPage = index;
    scroll = index;
}

- (void)didclickImage:(UIButton *)sender
{
    NSLog(@"点击图片，链接到某一个viewcontroller%ld",(long)sender.tag);
    
    [self.delegate theRollImageURL:@""];
}

@end
