//
//  ViewController.swift
//  Flashcards
//
//  Created by Jawny J on 2/15/20.
//  Copyright © 2020 Jawny Jules. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cardHidden = true;
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var answerToggle: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
            updateUI()
    }
    @IBAction func didButtonTap(_ sender: UIButton) {
        answerToggle.isHidden = false
        
        if sender.currentTitle == "Julian Parker"{
            /* TODO
             -Make Button Highlight Green Color
             -Add 'Vertical' Shake Animation
             -Drop Opacity of other options
             - Make other options unclickable
             */
            
        }
        else
            if sender.currentTitle == "Tavis Thompson"{
                /*
                 TODO
                 
                 -Make Button Highlight Red Color
                 -Add 'horizontal'  Shake Animation
                 
                 */
        }
        else
            if sender.currentTitle == "Cameron Thomas"{
                /* TODO
                 
                    -Make Button Highlight Red Color
                    -Add 'horizontal'  Shake Animation
                */

        }
        else
            if sender.currentTitle == "Bryson Hill"{
             /* TODO
                 
                    -Make Button Highlight Red Color
                    -Add 'horizontal'  Shake Animation
             */

        }
         
        /* TODO
         - add logic to stop user from being able to tap button after first tap */
        
        updateCard()
        updateUI()

    }
    
    
    @IBAction func didToggle(_ sender: UISwitch) {
        if sender.isOn {
            cardHidden = true
        }
        else {
            cardHidden = false
        }
        updateUI()
    }
    
    @IBAction func didTapOnFlash(_ sender: Any) {
       
       updateCard()
       updateUI()
    }
    func updateUI(){
        backLabel.isHidden = cardHidden
        answerToggle.setOn(cardHidden, animated: true)
    }
    
    func updateCard(){
        if cardHidden {
                   cardHidden = false
               }
               else {
                   cardHidden = true
               }
    }
    
}

