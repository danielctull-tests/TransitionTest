//
//  ViewController.m
//  TransitionTest
//
//  Created by Daniel Tull on 28.08.2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "ViewController.h"
#import "FullscreenAnimationController.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>
@end

@implementation ViewController
            
- (instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if (!self) return nil;
	self.transitioningDelegate = self;
	return self;
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
	return [[FullscreenAnimationController alloc] initWithSourceViewController:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
																  presentingController:(UIViewController *)presenting
																	  sourceController:(UIViewController *)source {

	return [[FullscreenAnimationController alloc] initWithSourceViewController:source];
}

@end
