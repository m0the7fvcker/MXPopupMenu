//
//  ViewController.m
//  MXPopupMenu
//
//  Created by maRk on 16/1/1.
//  Copyright © 2016年 maRk. All rights reserved.
//

#import "ViewController.h"
#import "MXPopupMenu.h"

@interface ViewController ()<MXPopupMenuDelegate>

@end

#define TITLES @[@"修改", @"删除", @"扫一扫",@"付款"]
#define ICONS  @[@"motify",@"delete",@"saoyisao",@"pay"]


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    centerView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:centerView];
    
    // 创建一个圆形path
         UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 0)
                                                                                                     radius:50
                                                                                                 startAngle:0
                                                                                                   endAngle:2 * M_PI
                                                                clockwise:NO];
    
         CAShapeLayer *shapeLayer = [CAShapeLayer layer];
         shapeLayer.path = circlePath.CGPath;
         centerView.layer.mask = shapeLayer;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.center = self.view.center;
    [button addTarget:self action:@selector(onPopupClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    

    
}

- (IBAction)onPopupClick:(UIButton *)sender {
    [MXPopupMenu showRelyOnView:sender titles:TITLES icons:ICONS menuWidth:120 delegate:self];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView: self.view];
    
    MXPopupMenu *popupMenu = [[MXPopupMenu alloc] initWithTitles:TITLES icons:nil menuWidth:110 delegate:nil];
    popupMenu.dismissOnSelected = NO;
    popupMenu.isShowShadow = YES;
    popupMenu.delegate = self;
    popupMenu.offset = 10;
    popupMenu.type = MXPopupMenuTypeDark;
    [popupMenu showAtPoint:p];
}

#pragma mark - MXPopupMenuDelegate
- (void)mx_PopupMenuDidSelectedAtIndex:(NSInteger)index popupMenu:(MXPopupMenu *)MXPopupMenu
{
    NSLog(@"点击了 %@ 选项",TITLES[index]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
