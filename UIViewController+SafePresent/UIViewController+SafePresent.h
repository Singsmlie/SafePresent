//
//  UIViewController+SafePresent.h
//  
//
//  Created by kevin on 15/12/28.
//  Copyright © 2015年 kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SafePresent)

/**
 *  当前控制器 的模态控制器 最上层modal 控制器
 *
 *  @return
 */
- (UIViewController  * _Nullable )currentTopModalViewController;


/**
 *  安全present 防止当前presentViewController 已经存在 这里应要注意多层dismiss 不要跨层dismiss
 *
 *  @param viewControllerToPresent 将要present的vc
 *  @param animated                flag
 *  @param completion              completion
 */
- (void)safePresentViewController:( UIViewController * _Nonnull )viewControllerToPresent
                         animated:(BOOL)animated
                       completion:(void (^ __nullable)(void))completion;

@end
