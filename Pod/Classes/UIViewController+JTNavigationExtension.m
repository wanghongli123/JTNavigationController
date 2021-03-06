//
//  UIViewController+JTNavigationExtension.m
//  JTNavigationController
//
//  Created by Tian on 16/2/17.
//  Copyright © 2016年 JiananTian. All rights reserved.
//

#import "UIViewController+JTNavigationExtension.h"
#import "JTWeakObjectContainer.h"
#import <objc/runtime.h>

@implementation UIViewController (JTNavigationExtension)

- (BOOL)jt_fullScreenPopGestureEnabled {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setJt_fullScreenPopGestureEnabled:(BOOL)fullScreenPopGestureEnabled {
    objc_setAssociatedObject(self, @selector(jt_fullScreenPopGestureEnabled), @(fullScreenPopGestureEnabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (JTNavigationController *)jt_navigationController {
    return [objc_getAssociatedObject(self, _cmd) weakObject];
}

- (void)setJt_navigationController:(JTNavigationController *)navigationController {
//    objc_setAssociatedObject(self, @selector(jt_navigationController), navigationController, OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(self, @selector(jt_navigationController), [[JTWeakObjectContainer alloc] initWithWeakObject:navigationController], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
