//
//  StopWatch.swift
//  StopWatch
//
//  Created by abdelrahman mohamed on 11/9/15.
//  Copyright © 2015 Abdulrhman dev. All rights reserved.
//

import Foundation

class StopWatch{
    private var startTime: NSDate?
    
    var isRunning: Bool {
        return startTime != nil
    }
    
    var elapsedTime: NSTimeInterval {
        if let startTime = self.startTime {
            return -startTime.timeIntervalSinceNow
        } else {
            return 0
        }
    }
    
    func start(){
        startTime = NSDate()
    }
    func stop(){
        startTime = nil
    }
    
    var elapsedTimeAsString: String {
        return String(format:"%02d:%02d.%d",Int(elapsedTime / 60),
        Int(elapsedTime % 60), Int(elapsedTime * 10 % 10))
    }
}