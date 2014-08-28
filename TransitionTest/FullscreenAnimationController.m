//
//  FullscreenAnimationController.m
//  TransitionTest
//
//  Created by Daniel Tull on 28.08.2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "FullscreenAnimationController.h"

@implementation FullscreenAnimationController

- (instancetype)initWithSourceViewController:(UIViewController *)sourceViewController {
	self = [self init];
	if (!self) return nil;
	_sourceViewController = sourceViewController;
	return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
	return 5.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

	UIView *containerView = [transitionContext containerView];
	UIView *view;
	CGRect finalFrame;

	if (self.sourceViewController) { // Presenting

		UIViewController *presentedViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
		finalFrame = [transitionContext finalFrameForViewController:presentedViewController];
		view = presentedViewController.view;

		UIView *fromView = self.sourceViewController.view;
		view.frame = [containerView convertRect:fromView.frame fromView:fromView];
		[containerView addSubview:view];


	} else {




	}

	NSTimeInterval duration = [self transitionDuration:transitionContext];
	[UIView animateWithDuration:duration delay:0.0f usingSpringWithDamping:1.0f initialSpringVelocity:0.0f options:UIViewAnimationOptionTransitionNone animations:^{
		view.frame = finalFrame;
	} completion:^(BOOL finished) {
		[transitionContext completeTransition:finished];
	}];
}

@end
