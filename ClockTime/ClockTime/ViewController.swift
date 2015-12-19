//
//  ViewController.swift
//  ClockTime
//
//  Created by abdelrahman mohamed on 10/28/15.
//  Copyright © 2015 Abdulrhman dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var CurrentTime: UILabel!
    

    var timer: NSTimer?
    
    let clock = Clock()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        NSNotificationCenter.defaultCenter().addObserver(self,  selector: "updateTimeLabel",
//            name: UIApplicationWillEnterForegroundNotification,  object: nil)
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self,
                        selector: "updateTimeLabel", userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateTimeLabel()
    }

    func updateTimeLabel(){
        CurrentTime.text = ("\(clock.currentDate)")
    }
    
    deinit {
        //NSNotificationCenter.defaultCenter().removeObserver(self)
        if let timerView = self.timer {
            timerView.invalidate()
            }
    }
}


class Clock {
    var currentDate:String {
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.timeStyle = .MediumStyle
        return formatter.stringFromDate(date)
        
    }
}

