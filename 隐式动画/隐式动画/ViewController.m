//
//  ViewController.m
//  隐式动画
//
//  Created by apple on 2016/11/17.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 UIView的内部会自动创建一个图层(CALayer对象)，这个图层只有一个层即主层也叫做根层。自己创建的图层也是只有一个层，这个层叫做非根层。只有非根层的图层才具有隐式动画，即自己创建的图层具有隐式动画，而UIView不具有隐式动画；
 隐式动画：当对非根层的部分属性进行修改时，系统默认会自动产生一些动画效果，这种系统默认自动产生的动画叫做隐式动画。这些可以产生隐式动画的属性被称为可动画属性(Animatable Properties)；
 常见的可动画属性：
 1、bounds：用于设置图层的宽度和高度，修改这个属性会产生缩放动画；
 2、backgroundColor：用于设置图层的背景色，修改这个属性会产生背景色的渐变动画；
 3、position：用于设置图层在父视图中的位置，修改这个属性会产生平移动画。
 
 动画主要分为如下的三种类型：
 1、隐式动画(Implicit Animation)：修改自己创建的图层（非根层）的属性时系统自动产生的动画，参考本Demo；
 2、核心动画(Core Animation)：使用抽象类CAAnimation中的各种子类来制作的动画，参考"ZPCABasicAnimation"等Demo；
 3、UIView封装的动画：
 （1）在修改UIView中的某些属性的代码前后加上其他代码而产生的动画效果；
 （2）调用UIView类中的封装好的设置动画的方法而产生的动画效果。
 上述的两种情况参考"ZPUIViewPackagedAnimationAndCoreAnimationDifference"Demo。
 */
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *layer;

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.layer = [CALayer layer];
    self.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    self.layer.position = CGPointZero;  //设置图层在父视图中的位置
    self.layer.anchorPoint = CGPointZero;  //设置图层的锚点
    [self.view.layer addSublayer:self.layer];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    /**
     想要去掉隐式动画的话就要撰写如下的关于"CATransaction"的三句代码。
     */
    [CATransaction begin];  //开启事物
    [CATransaction setDisableActions:YES];  //去掉隐式动画
    self.layer.bounds = CGRectMake(0, 0, 200, 200);
    self.layer.backgroundColor = [UIColor blueColor].CGColor;
    self.layer.position = CGPointMake(100, 100);
    [CATransaction commit];  //提交事物
}

@end
