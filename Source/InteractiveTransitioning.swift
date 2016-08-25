//
//  InteractiveAnimator.swift
//  ARNTransitionAnimator
//
//  Created by xxxAIRINxxx on 2016/07/26.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

final class InteractiveTransitioning : UIPercentDrivenInteractiveTransition {
    
    let animator: TransitionAnimator
    let gestureHandler: TransitionGestureHandler
    let _duration: CGFloat
    
    private var transitionContext: UIViewControllerContextTransitioning?
    
    init(duration: CGFloat, animator: TransitionAnimator, _ gestureHandler: TransitionGestureHandler) {
        self._duration = duration
        self.animator = animator
        self.gestureHandler = gestureHandler
        
        super.init()
        
        self.handleGesture()
    }
    
    private func handleGesture() {
        self.gestureHandler.updateGestureHandler = { [weak self] state in
            switch state {
            case .Start:
                self?.startTransition()
            case .Update(let percentComplete):
                self?.updateInteractiveTransition(percentComplete)
            case .Finish:
                self?.finishInteractiveTransition()
            case .Cancel:
                self?.cancelInteractiveTransition()
            }
        }
    }
    
    private func completeTransition(didComplete: Bool) {
        self.transitionContext?.completeTransition(didComplete)
        self.transitionContext = nil
    }
    
    private func startTransition() {
        switch self.animator.transitionType {
        case .Push:
            self.animator.fromVC.navigationController?.pushViewController(self.animator.toVC, animated: true)
        case .Present:
            self.animator.fromVC.presentViewController(self.animator.toVC, animated: true, completion: nil)
        case .Pop:
            self.animator.fromVC.navigationController?.popViewControllerAnimated(true)
        case .Dismiss:
            self.animator.fromVC.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}

extension InteractiveTransitioning {
    
    override func startInteractiveTransition(transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        self.animator.willAnimation(transitionContext.containerView())
    }
    
    override func updateInteractiveTransition(percentComplete: CGFloat) {
        super.updateInteractiveTransition(percentComplete)
        
        self.animator.updateAnimation(percentComplete)
    }
    
    override func finishInteractiveTransition() {
        super.finishInteractiveTransition()
        
        let d = self._duration - (self._duration * self.percentComplete)
        
        self.animator.animate(NSTimeInterval(d), animations: { self.animator.updateAnimation(1.0) }) { finished in
            self.animator.finishAnimation(true)
            self.completeTransition(true)
        }
    }
    
    override func cancelInteractiveTransition() {
        super.cancelInteractiveTransition()
        
        let d = self._duration * (1.0 - self.percentComplete)
        
        self.animator.animate(NSTimeInterval(d), animations: { self.animator.updateAnimation(0.0) }) { finished in
            self.animator.finishAnimation(false)
            self.completeTransition(false)
        }
    }
}
