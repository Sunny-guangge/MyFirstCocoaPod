//
//  CKViewController.m
//  new_alading
//
//  Created by user on 15/7/16.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "CKViewController.h"
#import "BTSpiderPlotterView.h"

@interface CKViewController ()

@end

@implementation CKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *dic = @{@"Design": @"7",
                          @"Display Life": @"9",
                          @"Camera" : @"6",
                          @"Reception": @"9",
                          @"Performance" : @"8",
                          @"Software": @"7",
                          @"Battery Life" : @"9",
                          @"Ecosystem": @"8"};
    
    BTSpiderPlotterView *spiderView = [[BTSpiderPlotterView alloc] initWithFrame:self.view.frame valueDictionary:dic];
    spiderView.plotColor = [UIColor redColor];
    [self.view addSubview:spiderView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
