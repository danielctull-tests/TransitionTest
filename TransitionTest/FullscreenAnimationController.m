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
	return 10.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

	UIView *containerView = [transitionContext containerView];
	UIView *view;
	CGRect finalFrame;

	NSLayoutConstraint *heightConstraint;

	if (self.sourceViewController) { // Presenting

		UIViewController *presentedViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
		finalFrame = [transitionContext finalFrameForViewController:presentedViewController];
		view = presentedViewController.view;

		UIView *fromView = self.sourceViewController.view;
		CGRect fromFrame = [containerView convertRect:fromView.frame fromView:fromView];

		heightConstraint = [NSLayoutConstraint constraintWithItem:view
														attribute:NSLayoutAttributeHeight
														relatedBy:NSLayoutRelationEqual
														   toItem:nil
														attribute:NSLayoutAttributeNotAnAttribute
													   multiplier:1.0f
														 constant:fromFrame.size.height];
		heightConstraint.priority = 1000.0f;
		[view addConstraint:heightConstraint];

		NSLog(@"%@:%@ %@", self, NSStringFromSelector(_cmd), NSStringFromCGRect(fromFrame));
		view.frame = fromFrame;
		[view layoutIfNeeded];
		NSLog(@"%@:%@ %@", self, NSStringFromSelector(_cmd), NSStringFromCGRect(fromFrame));
		[containerView addSubview:view];

		heightConstraint.constant = finalFrame.size.height;

	} else {




	}

	NSTimeInterval duration = [self transitionDuration:transitionContext];
	[UIView animateWithDuration:duration delay:0.0f usingSpringWithDamping:1.0f initialSpringVelocity:0.0f options:UIViewAnimationOptionTransitionNone animations:^{
		view.frame = finalFrame;
		[view layoutIfNeeded];
	} completion:^(BOOL finished) {
		[transitionContext completeTransition:finished];
		[view removeConstraint:heightConstraint];
	}];
	
	
	
}

@end
