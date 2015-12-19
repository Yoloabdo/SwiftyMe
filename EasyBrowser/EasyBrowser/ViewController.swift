//
//  ViewController.swift
//  EasyBrowser
//
//  Created by abdelrahman mohamed on 11/30/15.
//  Copyright © 2015 Abdulrhman dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

   
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func goForward(sender: UIBarButtonItem) {
        webView.goForward()
    }

    @IBAction func goBack(sender: UIBarButtonItem) {
        webView.goBack()
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.becomeFirstResponder()
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let url = NSURL(string:textField.text!) {
            webView.loadRequest(NSURLRequest(URL: url))
        }
        return true

    }
    
    
}

