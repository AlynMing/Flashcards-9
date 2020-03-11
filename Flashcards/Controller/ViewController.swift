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
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    var currentIndex: Int = 0
    var flashcards = [FlashCard]()
    var isHidden:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readSavedFlashCards()
        setUpView()
        
    }
    
    func setUpView(){
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
        if currentIndex == flashcards.count-1 || flashcards.count == 0{
                       nextButton.isEnabled = false
                   }
                   else {
                       nextButton.isEnabled = true
                   }
                   
                   if currentIndex == 0 {
                       prevButton.isEnabled = false
                   }
                   else {
                       prevButton.isEnabled = true
                   }
        if flashcards.count == 0 {
            flashcards.append(FlashCard(question: "My Question", answer1: "My Answer", answer2: " ", answer3: " ", answer4: " "))
        }
        else {
    updateLabels(flashCard: flashcards[0])
        }
            
    }
    
    
    @IBAction func didButtonTap(_ sender: UIButton) {
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

    }
    
    @IBAction func didTapOnFlash(_ sender: Any) {
        isHidden = !isHidden
        backLabel.isHidden = isHidden
    }
  
    func updateCard(){
        correctButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        incorrectButtonTwo.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        incorrectButtonOne.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        incorrectButtonThree.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        incorrectButtonOne.alpha = 1
        incorrectButtonTwo.alpha = 1
        incorrectButtonThree.alpha = 1
        
        if currentIndex == flashcards.count-1 || flashcards.count == 0{
                       nextButton.isEnabled = false
                   }
                   else {
                       nextButton.isEnabled = true
                   }
                   
                   if currentIndex == 0 {
                       prevButton.isEnabled = false
                   }
                   else {
                       prevButton.isEnabled = true
                   }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        
        creationController.flashCardController = self
        if segue.identifier == "edit" {
        creationController.isEdit = true
        creationController.initialQuestion = frontLabel.text
        creationController.initialAnswer = backLabel.text
        creationController.extraAnswerText1 = incorrectButtonOne.currentTitle
        creationController.extraAnswerText2 =
            incorrectButtonTwo.currentTitle
        creationController.extraAnswerText3 =
            incorrectButtonThree.currentTitle
        }
        
        if segue.identifier == "new"{
            creationController.isEdit = false
        }
       
        
        
    }
    @IBAction func didTapOnDelete(_ sender: UIButton) {
        let alert = UIAlertController(title: "Delete FlashCard?", message: "Are you sure you want to delete this flashcard", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
            self.deleteCurrentFlashCard()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)


        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
        
    }
    
    func deleteCurrentFlashCard(){
        flashcards.remove(at: currentIndex)
        
        if currentIndex > flashcards.count-1 {
            currentIndex = flashcards.count-1
        }
        if currentIndex == -1 {
            flashcards.append(FlashCard(question: "Add a Card", answer1: "Or Edit this One", answer2: "", answer3: "", answer4: ""))
            currentIndex = 0
        }
        saveAllFlashcardsToDisk()
        updateLabels(flashCard: flashcards[currentIndex])
    }
    
    
    @IBAction func updateNextPrevButton(_ sender: UIButton) {
        if(sender.currentTitle == "Next"){
            currentIndex = currentIndex + 1
        }
        else
        if (sender.currentTitle == "Prev"){
            currentIndex = currentIndex - 1
        }
       
        updateLabels(flashCard: flashcards[currentIndex])
    }
    
    func updateLabels(flashCard:FlashCard){
        
        frontLabel.text = flashCard.Question
        backLabel.text = flashCard.Answer1
        
           

        correctButton.setTitle(flashCard.Answer1, for: .normal)
        incorrectButtonOne.setTitle(flashCard.Answer2, for: .normal)
        incorrectButtonTwo.setTitle(flashCard.Answer3, for: .normal)
        incorrectButtonThree.setTitle(flashCard.Answer4, for: .normal)
        
        updateCard()
       
       
        
        
       }
    
    func saveAllFlashcardsToDisk() {
        
        let dictionaryArray = flashcards.map { (card) ->[String:String] in
            return ["Question": card.Question, "Answer": card.Answer1, "ExtraAnswer1": card.Answer2!, "ExtraAnswer2": card.Answer3!, "ExtraAnswer3": card.Answer4!]
        }
     
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
    }
    
    func readSavedFlashCards() {
        if let  dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String:String]]{
            
            let savedCards = dictionaryArray.map { dictionary  -> FlashCard in
                return FlashCard(question: dictionary["Question"]!, answer1: dictionary["Answer"]!, answer2: dictionary["ExtraAnswer1"], answer3: dictionary["ExtraAnswer2"], answer4: dictionary["ExtraAnswer3"])
            }
            flashcards.append(contentsOf: savedCards)
        }
    
    }
}
