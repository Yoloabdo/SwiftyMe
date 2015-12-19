//
//  ViewController.swift
//  Photooo
//
//  Created by abdelrahman mohamed on 11/26/15.
//  Copyright © 2015 Abdulrhman dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var secondryMenu: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var BottomMenu: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        secondryMenu.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        secondryMenu.translatesAutoresizingMaskIntoConstraints = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onFilter(sender: UIButton) {
        if(sender.selected){
            hideSecondaryView()
            sender.selected = false
        }else{
            showSecondaryMenu()
            sender.selected = true
        }
        
    }
    
    func hideSecondaryView(){

        UIView.animateWithDuration(0.4, animations:{
            self.secondryMenu.alpha = 0}) { completed in
                if(completed){
                    self.secondryMenu.removeFromSuperview()
                }
        }
    }

    func showSecondaryMenu(){
        view.addSubview(secondryMenu)

        // constrains programmatically
        let bottomConstraint = secondryMenu.bottomAnchor.constraintEqualToAnchor(BottomMenu.topAnchor)
        
        let leftConstraint = secondryMenu.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
        let rightConstraint = secondryMenu.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        
        let heightConstraint = secondryMenu.heightAnchor.constraintEqualToConstant(44)
        
        NSLayoutConstraint.activateConstraints([ leftConstraint, rightConstraint, heightConstraint, bottomConstraint])
        
        view.layoutIfNeeded()
        
        self.secondryMenu.alpha = 0
        
        UIView.animateWithDuration(0.4) {
            self.secondryMenu.alpha = 1.0
        }

    }
}

