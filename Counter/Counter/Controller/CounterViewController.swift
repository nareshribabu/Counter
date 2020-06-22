//
//  CounterViewController.swift
//  Counter
//  Created by Nareshri Babu on 2020-05-07.
//  Copyright © 2020 Nareshri Babu. All rights reserved.
//  This app was created for learning purposes.
//  All images were only used for learning purposes and do not belong to me.
//  All sounds were only used for learning purposes and do not belong to me.
//

import UIKit
import AVFoundation

class CounterViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var finalLabel: UILabel!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var reset: UIButton!
    
    var player: AVAudioPlayer!
    
    var goalNumber : Int = 0
    var count : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        minus.layer.cornerRadius = 10
        plus.layer.cornerRadius = 10
        reset.layer.cornerRadius = 10
        
        //outer progress bar
        progressBar.layer.cornerRadius = 10
        progressBar.clipsToBounds = true
        
        //inner progress bar
        progressBar.layer.sublayers![1].cornerRadius = 10
        progressBar.subviews[1].clipsToBounds = true
        
        progressBar.progress = 0.0
    }
    

    @IBAction func minusButtonPressed(_ sender: UIButton) {
        
        if count != 0 {
            
            count -= 1
            
            label.text = String(count)
            progressBar.progress = Float(count) / Float(goalNumber)
        }
        
        pressedAction(sender: sender)
        
        finalLabel.text = ""
        
    }
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        
        if count != goalNumber {
            if count == goalNumber - 1 {
                
                finalLabel.text = "Good Job! You finished!"
                count += 1
                label.text = String(count)
                playSound(soundName: "C")
            }
            else {
                count += 1
                label.text = String(count)
            }
        }
        
        progressBar.progress = Float(count) / Float(goalNumber)
        
        pressedAction(sender: sender)
        
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        
        count = 0
        
        label.text = String(count)
        finalLabel.text = ""
        
        progressBar.progress = Float(count) / Float(goalNumber)
        
        pressedAction(sender: sender)
        
    }
    
    
    func sendGoalNumber(goal: Int) {
        
        goalNumber = goal
        
    }
    
    func pressedAction (sender: UIButton) {
        
        //make the button to half the opacity
        sender.alpha = 0.5
        
        //make it last for 0.2 seconds
        DispatchQueue.main.asyncAfter(deadline:.now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
    }
    
    func playSound(soundName: String) {
        //file constant
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        //putting the url into the player: kind of like putting a CD in a CD player
        player = try! AVAudioPlayer(contentsOf: url!)
        //we are playing the CD
        player.play()
                
    }

}
