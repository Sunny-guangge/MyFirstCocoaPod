//
//  CKRollImageView.h
//  new_alading
//
//  Created by user on 15/7/16.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CKRollImageViewDelegate <NSObject>

//传递滚动图片的链接
- (void)theRollImageURL:(NSString *)imageURL;

@end

@interface CKRollImageView : UIView<UIScrollViewDelegate>

@property (nonatomic,assign) id<CKRollImageViewDelegate>delegate;
@property (nonatomic,strong) NSMutableArray *imageArray;

@end
