//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes = ["Soft" : 5, "Medium": 7, "Hard": 12]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    @IBOutlet weak var progressBar: UIProgressView!
    
    var doneSound: AVAudioPlayer!
    
    /* in playground
    var player1Username: String? = nil
    player1Username = "Jack"
    var unwrapperP1Username = player1Username!
    if player1Username != nil{
        print(player1Username!)
    }
    */

    
//    if conditions>5 -> luchwe switch, esli menwe,to ifelse
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        secondsPassed = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed)/Float(totalTime)
            print(Float(secondsPassed)/Float(totalTime))
                
        } else if secondsPassed == totalTime{
            timer.invalidate()
            playSound()
            titleLabel.text = "DONE!"
        }
    }
       /* switch hardness {
        case "Soft":
            print(eggTimes["Soft"])
        case "Medium":
            print(eggTimes["Medium"])
        case "Hard":
            print(eggTimes["Hard"])
        default:
            print("Error")
        }*/
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        doneSound = try! AVAudioPlayer(contentsOf: url!)
        doneSound.play()
    }
}

