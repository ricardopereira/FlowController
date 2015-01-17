//
//  OneViewController.swift
//  FlowController
//
//  Created by Ricardo Pereira on 16/01/2015.
//  Copyright (c) 2015 Ricardo Pereira. All rights reserved.
//

import UIKit

class OneViewController: UIViewController
{
    private var buttonTeste: UIButton!
    private var buttonClose: UIButton!

    private let counter: Int

    required init(_ startAt: Int) {
        counter = startAt
        super.init(nibName: nil, bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func showViewController(vc: UIViewController, sender: AnyObject?) {
        println("Called OneViewController.showViewController")
        super.showViewController(vc, sender: sender)
    }

    override func targetViewControllerForAction(action: Selector, sender: AnyObject?) -> UIViewController? {
        println("Called OneViewController.targetViewControllerForAction")
        if let sender = sender as? UIViewController {
            println("Sender: \(sender.description)")
        }
        return super.targetViewControllerForAction(action, sender: sender)
    }

    override func loadView() {
        super.loadView()

        let button = UIButton(frame: CGRectMake(20, 80, 70, 30))
        buttonTeste = button
        button.setTitle("Teste", forState: .Normal)
        button.layer.cornerRadius = 3.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = button.titleLabel?.textColor.CGColor
        button.addTarget(self, action: Selector("didTouchButtonTeste:"), forControlEvents: .TouchUpInside)
        view.addSubview(button)

        buttonClose = UIButton(frame: CGRectMake(button.frame.width+10+20, 80, 70, 30))
        buttonClose.setTitle("Close", forState: .Normal)
        buttonClose.layer.cornerRadius = 3.0
        buttonClose.layer.borderWidth = 1.0
        buttonClose.layer.borderColor = buttonClose.titleLabel?.textColor.CGColor
        buttonClose.addTarget(self, action: Selector("didTouchButtonClose:"), forControlEvents: .TouchUpInside)
        view.addSubview(buttonClose)
    }

    override func viewDidLoad() {
        // navigationController sempre a nil

    }

    override func viewWillAppear(animated: Bool) {
        if navigationController == nil {
            buttonTeste.setTitle("Close", forState: .Normal)
        }
    }

    func didTouchButtonTeste(sender: AnyObject?) {
        let list = [self.dynamicType]

        // Teste
        if counter <= 5 {
            if let navCtrl = navigationController {
                navCtrl.showViewController(list[0](counter+1), sender: nil)
                println("New on stack: \(counter)")
            }
        }
        else if let navCtrl = navigationController {
            navCtrl.showDetailViewController(list[0](counter+1), sender: nil)
            println("New detail")
        }
        else {
            dismissViewControllerAnimated(true, completion: nil)
            println("No navigation")
        }
    }

    func didTouchButtonClose(sender: AnyObject?) {
        if let navCtrl = navigationController {
            if navCtrl.viewControllers.count == 1 {
                // Teste
                //navCtrl.setViewControllers([], animated: false)
                //navCtrl.showViewController(self, sender: nil)
                println("Closed")
            }
            else {
                // Root
                //navCtrl.popToRootViewControllerAnimated(false)
                navCtrl.setViewControllers([], animated: false)
                navCtrl.showViewController(UIViewController(), sender: nil)
            }
        }
    }
}