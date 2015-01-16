//
//  FlowController.swift
//  FlowController
//
//  Created by Ricardo Pereira on 16/01/2015.
//  Copyright (c) 2015 Ricardo Pereira. All rights reserved.
//

import UIKit

class FlowController: UINavigationController
{
    func printStack() {
        println("\nStack of FlowController")
        for any in viewControllers {
            let view = any as UIViewController
            println("View: \(view.description)")
        }
    }

    override func showViewController(vc: UIViewController, sender: AnyObject!) {
        if sender is UIViewController {
            println("Sender is UIViewController")
        }
        println("Called FlowController.showViewController")
        printStack()
        super.showViewController(vc, sender: sender)
    }

    override func targetViewControllerForAction(action: Selector, sender: AnyObject?) -> UIViewController? {
        println("Called FlowControllertargetViewControllerForAction")
        if let sender = sender as? UIViewController {
            println("With action: \(action)")
        }
        return super.targetViewControllerForAction(action, sender: sender)
    }
}