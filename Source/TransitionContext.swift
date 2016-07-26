//
//  TransitionContext.swift
//  ARNTransitionAnimator
//
//  Created by xxxAIRINxxx on 2016/07/25.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

public enum TransitionType {
    case Push
    case Pop
    case Present
    case Dismiss
}

public final class TransitionContext<From: UIViewController, To: UIViewController> {
    
    private(set) weak var fromVC: From!
    private(set) weak var toVC: To!
  
    func animateTransition(duration: NSTimeInterval, animations: (Void -> Void), completion: ((Bool) -> Void)? = nil) {
        UIView.animateWithDuration(duration,
                                   delay: 0.0,
                                   options: .CurveEaseOut,
                                   animations: animations,
                                   completion: completion)
    }
}
