//
//  ViewController.swift
//  Counter
//  Created by Nareshri Babu on 2020-05-07.
//  Copyright © 2020 Nareshri Babu. All rights reserved.
//  This app was created for learning purposes.
//  All images were only used for learning purposes and do not belong to me.
//  All sounds were only used for learning purposes and do not belong to me.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var goalNumber: UITextField!
    @IBOutlet weak var startCounting: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startCounting.layer.cornerRadius = 10
        goalNumber.layer.cornerRadius = 10
        goalNumber.clipsToBounds = true
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        
        
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    @IBAction func startCountingButtonPressed(_ sender: UIButton) {
        
        //make the button to half the opacity
        sender.alpha = 0.5
        
        //make it last for 0.2 seconds
        DispatchQueue.main.asyncAfter(deadline:.now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        
        self.performSegue(withIdentifier: "goToCounter", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToCounter" {
            
            let destinationVC = segue.destination as! CounterViewController
            
            let number = Int(goalNumber.text ?? "0") ?? 0
            
            destinationVC.sendGoalNumber(goal: number)
            
            
        }
    }
    
}

