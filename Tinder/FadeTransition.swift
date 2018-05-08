//
//  FadeTransition.swift
//  Tinder
//
//  Created by Judy Gatobu on 5/7/18.
//  Copyright © 2018 Judy Gatobu. All rights reserved.
//

import UIKit
    
class FadeTransition: BaseTransition {
        
        override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
            
            toViewController.view.alpha = 0
            UIView.animate(withDuration: duration, animations: {
                toViewController.view.alpha = 1
            }) { (finished: Bool) -> Void in
                self.finish()
            }
        }
        
        override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
            
            fromViewController.view.alpha = 1
            UIView.animate(withDuration: duration, animations: {
                fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                self.finish()
            }
        }
}
