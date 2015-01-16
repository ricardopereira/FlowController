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
    var buttonTeste: UIButton!

    required override init() {
        super.init()

    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

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
        if let navCtrl = navigationController {
            navCtrl.showDetailViewController(list[0](), sender: nil)
            println("New detail")
        }
        else {
            dismissViewControllerAnimated(true, completion: nil)
            println("No navigation")
        }
    }
}