//
//  FullscreenAnimationController.h
//  TransitionTest
//
//  Created by Daniel Tull on 28.08.2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

@import UIKit;

@interface FullscreenAnimationController : NSObject <UIViewControllerAnimatedTransitioning>

- (instancetype)initWithSourceViewController:(UIViewController *)sourceViewController;
@property (nonatomic) UIViewController *sourceViewController;

@end
