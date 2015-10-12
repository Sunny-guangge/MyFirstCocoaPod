//
//  ViewController.m
//  new_alading
//
//  Created by user on 15/7/16.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "ViewController.h"
#import "CKViewController.h"
#import "CKRollImageView.h"
#import "CKImageViewController.h"
#import "CKOneMessageTableViewCell.h"
#import "CKTwoMessageTableViewCell.h"

#define CELL_WIDTH ((self.view.bounds.size.width - 10) / 3)
#define CELL_COUNT 100
#define CELL_IDENTIFIER @"WaterfallCell"

#define NavBarFrame self.navigationController.navigationBar.frame
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate,CKRollImageViewDelegate>

@property (nonatomic,strong) UITableView *newtableView;

@property (nonatomic,strong) UIView *titleView;

@property (nonatomic,strong) UIPanGestureRecognizer *panGesture;

@property (nonatomic,assign) BOOL isHidden;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self cerateUInterface];
    
    
}

- (void)cerateUInterface
{
    CKRollImageView *rollImageView = [[CKRollImageView alloc] init];
    rollImageView.backgroundColor = [UIColor grayColor];
    rollImageView.delegate = self;
//    [self.view addSubview:rollImageView];
    
    self.newtableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, self.view.frame.size.height)];
    self.newtableView.delegate = self;
    self.newtableView.dataSource = self;
    [self.view addSubview:self.newtableView];
    self.newtableView.tableHeaderView = rollImageView;
    
    
    self.title = @"UITableView";
    
    self.panGesture = [[UIPanGestureRecognizer alloc] init];
    self.panGesture.delegate=self;
    self.panGesture.minimumNumberOfTouches = 1;
    [self.panGesture addTarget:self action:@selector(handlePanGesture:)];
    [self.newtableView addGestureRecognizer:self.panGesture];
    
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didClickBack)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    self.titleView = [[UIView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    self.titleView.alpha = 0;
//    self.titleView.backgroundColor = self.navigationController.navigationBar.barTintColor;
    self.titleView.backgroundColor = [UIColor redColor];
    [self.navigationController.navigationBar addSubview:self.titleView];
    [self.navigationController.navigationBar bringSubviewToFront:self.titleView];
}

- (void)theRollImageURL:(NSString *)imageURL
{
    CKImageViewController *iamgeVC = [[CKImageViewController alloc] init];
    [self.navigationController pushViewController:iamgeVC animated:YES];
}

#pragma mark - 兼容其他手势
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)pan
{
    CGPoint translation = [pan translationInView:[self.newtableView superview]];
    
    //显示
    if (translation.y >= 5) {
        if (self.isHidden) {
            
            self.titleView.alpha=0;
            CGRect navBarFrame=NavBarFrame;
            CGRect scrollViewFrame=self.newtableView.frame;
            
            navBarFrame.origin.y = 20;
            scrollViewFrame.origin.y += 44;
            scrollViewFrame.size.height -= 44;
            
            [UIView animateWithDuration:0.2 animations:^{
                NavBarFrame = navBarFrame;
                self.newtableView.frame=scrollViewFrame;
            }];
            self.isHidden= NO;
        }
    }
    
    //隐藏
    if (translation.y <= -20) {
        if (!self.isHidden) {
            CGRect frame =NavBarFrame;
            CGRect scrollViewFrame=self.newtableView.frame;
            frame.origin.y = -24;
            scrollViewFrame.origin.y -= 44;
            scrollViewFrame.size.height += 44;
            
            [UIView animateWithDuration:0.2 animations:^{
                NavBarFrame = frame;
                self.newtableView.frame=scrollViewFrame;
                self.titleView.alpha=1;
            } completion:^(BOOL finished) {
                self.titleView.alpha=1;
            }];
            self.isHidden=YES;
        }
    }
}

- (void)didClickBack
{
    CKViewController *ckVC = [[CKViewController alloc] init];
    [self.navigationController pushViewController:ckVC animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 4 == 0) {
        
        if (indexPath.row == 0) {
            CKTwoMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"two"];
            
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"CKTwoMessageTableViewCell" owner:self options:nil] lastObject];
            }
            
            return cell;
        }else
        {
            CKOneMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"one"];
            
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"CKOneMessageTableViewCell" owner:self options:nil] lastObject];
            }
            
            return cell;
        }
        
    }else
    {
        CKTwoMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"two"];
        
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"CKTwoMessageTableViewCell" owner:self options:nil] lastObject];
        }
        
        [cell.oneButton addTarget:self action:@selector(didClickOneButton:) forControlEvents:UIControlEventTouchUpInside];
        cell.oneButton.tag = indexPath.row * 2;
        [cell.twoButton addTarget:self action:@selector(didClickTwoButton:) forControlEvents:UIControlEventTouchUpInside];
        cell.twoButton.tag = indexPath.row * 2 + 1;
        return cell;
    }
    
    return nil;
    
}

- (void)didClickOneButton:(UIButton *)button
{
    NSLog(@"%ld",(long)button.tag);
}

- (void)didClickTwoButton:(UIButton *)button
{
    NSLog(@"%ld",(long)button.tag);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
