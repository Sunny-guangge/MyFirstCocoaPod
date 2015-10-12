//
//  WaterfallCollectionViewCell.m
//  Waterfall
//
//  Created by 任龙宇 on 15/1/1.
//  Copyright (c) 2015年 renlongyu. All rights reserved.
//

#import "CollectionViewWaterfallCell.h"

@interface CollectionViewWaterfallCell ()

@end

@implementation CollectionViewWaterfallCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        _label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
//        [_label release];
    }
    return self;
}


@end
