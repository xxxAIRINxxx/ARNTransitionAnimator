//
//  TransitionAnimatable.swift
//  ARNTransitionAnimator
//
//  Created by xxxAIRINxxx on 2016/07/25.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation
import UIKit

public protocol TransitionAnimatable : class {
    
    func sourceVC() -> UIViewController
    func destVC() -> UIViewController
    
    func willAnimation(_ transitionType: TransitionType, containerView: UIView)
    func updateAnimation(_ transitionType: TransitionType, percentComplete: CGFloat)
    func finishAnimation(_ transitionType: TransitionType, didComplete: Bool)
}

