//
//  ViewController.swift
//  StopWatch
//
//  Created by abdelrahman mohamed on 11/3/15.
//  Copyright © 2015 Abdulrhman dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let stopwatch = StopWatch()
    
    @IBOutlet weak var timeElapsed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func start(sender: AnyObject) {
        print("Starting stopwatch")
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self,
            selector: "updateElapsedTimeLabel:", userInfo: nil, repeats: true)
        stopwatch.start()

    }

    
    @IBAction func stop(sender: AnyObject) {
        stopwatch.stop()
        NSTimer.cancelPreviousPerformRequestsWithTarget(self)
    }
    
    func updateElapsedTimeLabel(timer: NSTimer) {
        if stopwatch.isRunning {
            timeElapsed.text = stopwatch.elapsedTimeAsString
        }else {
            timer.invalidate()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

