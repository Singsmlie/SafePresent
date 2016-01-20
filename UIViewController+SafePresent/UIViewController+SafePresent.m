//
//  UIViewController+SafePresent.m
//  YFNewsUI
//
//  Created by kevin on 15/12/28.
//  Copyright © 2015年 kevin. All rights reserved.
//

#import "UIViewController+SafePresent.h"

@implementation UIViewController (SafePresent)


- (UIViewController  * _Nullable )currentTopModalViewController
{
    UIViewController *presentedModalVC = [self presentedViewController];
    if (presentedModalVC) {
        
        while (presentedModalVC.presentedViewController) {
            presentedModalVC = presentedModalVC.presentedViewController;
        }
        
        return presentedModalVC;
        
    }else{
        return nil;
    }
}

- (void)safePresentViewController:( UIViewController * _Nonnull )viewControllerToPresent
                         animated:(BOOL)animated
                       completion:(void (^ __nullable)(void))completion
{
    
    if (self.isBeingPresented || self.isBeingDismissed) {
        //!!!: 当前控制器正在做present or dismiss 动画
        NSLog(@"presenting or dismissing fail to present");
        return;
    }
    
    UIViewController *presentedModalVC = [self presentedViewController];
    
    if (presentedModalVC) {
        while (presentedModalVC.presentedViewController) {
            presentedModalVC = presentedModalVC.presentedViewController;
        }
        
        if ([presentedModalVC isBeingDismissed] || [presentedModalVC isBeingPresented]) {
            NSLog(@"presenting or dismissing fail to present");
            return;
        }
        [presentedModalVC presentViewController:viewControllerToPresent animated:animated completion:completion];
    } else {
        [self presentViewController:viewControllerToPresent animated:animated completion:completion];
    }

}

@end
