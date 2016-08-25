//
//  AnimatedTransitioning .swift
//  ARNTransitionAnimator
//
//  Created by xxxAIRINxxx on 2016/07/25.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

final class AnimatedTransitioning : NSObject {
    
    let animator: TransitionAnimator
    let duration: NSTimeInterval
    
    init(animator: TransitionAnimator, duration: NSTimeInterval) {
        self.animator = animator
        self.duration = duration
        
        super.init()
    }
}

extension AnimatedTransitioning : UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return self.duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        self.animator.willAnimation(transitionContext.containerView())
        
        self.animator.animate(self.duration, animations: { self.animator.updateAnimation(1.0) }) { finished in
            self.animator.finishAnimation(true)
            transitionContext.completeTransition(true)
        }
    }
}

