//
//  ViewController.swift
//  PopoverExample
//
//  Created by Sreehari M Nambiar on 20/02/20.
//  Copyright © 2020 Sreehari M Nambiar. All rights reserved.
//

import UIKit
import SMPopover

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        showPopover(from: sender)
    }
    
    func showPopover(from view: UIView) {
        let popover = SMPopover()
        popover.autoDismiss = true
        popover.autoDismissTimeInterval = 1.0
        popover.contentSize = CGSize(width: 120, height: 36)
        popover.textFont = UIFont.systemFont(ofSize: 14)
        popover.textColor = .green
        popover.text = "Popover"
        popover.present(from: view)
    }
}

