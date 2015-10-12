//
//  WaterfallCollectionViewLayout.h
//  Waterfall
//
//  Created by 任龙宇 on 15/1/1.
//  Copyright (c) 2015年 renlongyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CollectionViewWaterfallLayout;

@protocol CollectionViewDelegateWaterfallLayout <UICollectionViewDelegate>
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(CollectionViewWaterfallLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface CollectionViewWaterfallLayout : UICollectionViewLayout

@property (nonatomic, assign) id<CollectionViewDelegateWaterfallLayout> delegate;
@property (nonatomic, assign) NSInteger columnCount;
@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, assign) UIEdgeInsets sectionInset;

@end
