//
//  Animator.swift
//  ARNTransitionAnimator
//
//  Created by xxxAIRINxxx on 2016/07/26.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

final class Animator<From: UIViewController, To: UIViewController>: NSObject, UIViewControllerAnimatedTransitioning {
  
    let duration: NSTimeInterval
    let context: TransitionContext<From, To>
    
    init(duration: NSTimeInterval, context: TransitionContext<From, To>) {
        self.duration = duration
        self.context = context
        
        super.init()
    }
    
    @objc func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return self.duration
    }
    
    @objc func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        self.context.animateTransition(self.duration, animations: {
        }) { finished in
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
            transitionContext.completeTransition(finished)
        }
    }
}

