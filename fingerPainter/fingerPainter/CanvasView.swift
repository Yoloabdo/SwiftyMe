//
//  CanvasView.swift
//  fingerPainter
//
//  Created by abdelrahman mohamed on 12/19/15.
//  Copyright © 2015 Abdulrhman dev. All rights reserved.
//

import UIKit

class CanvasView: UIView {

    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(context, UIColor.magentaColor().CGColor)
        CGContextSetLineWidth(context, 10)
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, 0, 0)
        CGContextAddLineToPoint(context, 150, 400)
        CGContextStrokePath(context)
    }
}
