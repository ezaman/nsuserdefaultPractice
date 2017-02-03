//
//  ViewController.swift
//  nsuserdefaultPractice
//
//  Created by Ehsan Zaman on 1/26/17.
//  Copyright © 2017 Ehsan Zaman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var counterButton: UIButton!
    
    var score = 0
    var highScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the viewcd, typically from a nib.
        
        var highscoreDefault = UserDefaults.standard
        if (highscoreDefault.value(forKey: "highScore") != nil) {
        highScore = highscoreDefault.value(forKey: "highScore") as! Int
            highscoreLabel.text = String(format: "Highscore: %i", highScore)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetAction(_ sender: Any) {
        score = 0
        scoreLabel.text = String(format: "Score: %i", score)
    }

    @IBAction func counterAction(_ sender: Any) {
        
        score += 1
        scoreLabel.text = String(format: "Score: %i", score)
        if score > highScore {
            highScore = score
            highscoreLabel.text = String(format: "Highscore: %i", highScore)
        }
        
        var highscoreDefault = UserDefaults.standard
        highscoreDefault.set(highScore, forKey: "highScore")
        highscoreDefault.synchronize()
        
    }
  
    
}

