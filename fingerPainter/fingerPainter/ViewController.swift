//
//  ViewController.swift
//  fingerPainter
//
//  Created by abdelrahman mohamed on 12/6/15.
//  Copyright © 2015 Abdulrhman dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canavas: UIImageView!
    
    var start:CGPoint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first! as UITouch
        start = touch.locationInView(canavas)
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {

        let touch = touches.first! as UITouch

        let end = touch.locationInView(canavas)
        if let start = self.start{
            drawFromPoint(start, toPoint: end)
        }
        
        start = end
    }

    func drawFromPoint(start: CGPoint, toPoint end: CGPoint){
        // set the context to that of an image  
        UIGraphicsBeginImageContext(canavas.frame.size)
        let context = UIGraphicsGetCurrentContext()
        // draw the existing image onto the current context  
        canavas.image?.drawInRect(CGRect(x: 0, y: 0, width: canavas.frame.size.width, height: canavas.frame.size.height))
        // draw the new line segment  
        CGContextSetLineWidth(context, 5)
        CGContextSetStrokeColorWithColor(context,UIColor.magentaColor().CGColor)
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, start.x, start.y)
        CGContextAddLineToPoint(context, end.x, end.y)
        CGContextStrokePath(context)
        // obtain a UIImage object from the context
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        // Set the UIImageView's image to the new, generated image  
        canavas.image = newImage
    }
}

