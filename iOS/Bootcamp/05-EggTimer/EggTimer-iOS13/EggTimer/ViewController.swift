//
//  ViewController.swift
//  EggTimer
//
//  Created by Lili Cabral on 23/05/2022
//
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300,
                    "Medium": 420,
                    "Hard": 720]
    
    var secondsRemaining = 60
    
    var timer = Timer()
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("/(secondsRemaining) seconds.")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
}
