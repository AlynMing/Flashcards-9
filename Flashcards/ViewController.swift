//
//  ViewController.swift
//  Flashcards
//
//  Created by Jawny J on 2/15/20.
//  Copyright © 2020 Jawny Jules. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var incorrectButtonThree: UIButton!
    @IBOutlet weak var incorrectButtonTwo: UIButton!
    @IBOutlet weak var incorrectButtonOne: UIButton!
    @IBOutlet weak var correctButton: UIButton!
    @IBOutlet weak var cardView: UIView!
    var cardHidden = true;
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var answerToggle: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.layer.cornerRadius = 20.0
        cardView.clipsToBounds = true
        cardView.layer.shadowRadius = 15.0
        cardView.layer.shadowOpacity = 0.2
        
        correctButton.layer.borderWidth = 3.0
        correctButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        incorrectButtonOne.layer.borderWidth = 3.0
        incorrectButtonOne.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        incorrectButtonTwo.layer.borderWidth = 3.0
        incorrectButtonTwo.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        incorrectButtonThree.layer.borderWidth = 3.0
        incorrectButtonThree.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        incorrectButtonOne.layer.cornerRadius = 20.0
        incorrectButtonTwo.layer.cornerRadius = 20.0
        incorrectButtonThree.layer.cornerRadius = 20.0
        correctButton.layer.cornerRadius = 20.0
        incorrectButtonOne.clipsToBounds = true
        incorrectButtonTwo.clipsToBounds = true
        incorrectButtonThree.clipsToBounds = true
        correctButton.clipsToBounds = true
        updateUI()
    }
    
    @IBAction func didButtonTap(_ sender: UIButton) {
        answerToggle.isHidden = false
        
            /* TODO
             - Add 'Vertical' Shake Animation on correct button
             - Add 'Horizontal' Shake Animation on incorrect button
             - Make other options unclickable
             */
        
            incorrectButtonOne.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            incorrectButtonTwo.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            incorrectButtonThree.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            correctButton.layer.borderColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            incorrectButtonOne.alpha = 0.5
            incorrectButtonTwo.alpha = 0.5
            incorrectButtonThree.alpha = 0.5
            
            
            
       
         
        
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
       answerToggle.isHidden = false
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

