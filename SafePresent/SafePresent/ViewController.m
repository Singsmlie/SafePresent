//
//  ViewController.m
//  SafePresent
//
//  Created by kevin on 16/1/20.
//  Copyright © 2016年 kevin. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+SafePresent.h"

@interface ViewController ()
{
    NSInteger count;
}

@property (strong, nonatomic) IBOutlet UIButton *TestButton;

- (IBAction)TestAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    count = 0;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TestAction:(id)sender {
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIViewController *v = [[UIViewController alloc]init];
        
        //!!!: 这里调用view 会打乱viewcontroller 一系列 调用顺序 just a test
        v.view.backgroundColor = [self randomColor];
        UILabel *label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:30];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [v.view addSubview:label];
        [v.view addConstraint:[NSLayoutConstraint constraintWithItem:v.view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:label attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
        [v.view addConstraint:[NSLayoutConstraint constraintWithItem:v.view attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:label attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
        [label setText:[NSString stringWithFormat:@"%ld", (long)count]];
        count++;
        [self safePresentViewController:v animated:YES completion:^{
            
            
        }];
        [self TestAction:nil];
    });
}

- (UIColor *)randomColor {
    //detail implementation
    //arc4random() % 78 will return a number between 0 and 77, for example.
    CGFloat hue = arc4random() % 100 / 100.0; //色调：0.0 ~ 1.0
    CGFloat saturation = (arc4random() % 50 / 100) + 0.5; //饱和度：0.5 ~ 1.0
    CGFloat brightness = (arc4random() % 50 / 100) + 0.5; //亮度：0.5 ~ 1.0
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
