//
//  ViewController.swift
//  Flashcards
//
//  Created by Jawny J on 2/15/20.
//  Copyright © 2020 Jawny Jules. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnOptionFour: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    var currentIndex: Int = 0
    var flashcards = [FlashCard]()
    var isHidden: Bool = false
    var isNext: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readSavedFlashCards()
        setUpView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cardView.alpha = 0.0
        cardView.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        
        
        btnOptionOne.alpha = 0.0
        btnOptionOne.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        btnOptionTwo.alpha = 0.0
        btnOptionTwo.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        btnOptionThree.alpha = 0.0
        btnOptionThree.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        btnOptionFour.alpha = 0.0
        btnOptionFour.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        
        
        UIView.animate(withDuration: 0.6, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.cardView.alpha = 1.0
            self.btnOptionOne.alpha = 1.0
            self.btnOptionTwo.alpha = 1.0
            self.btnOptionThree.alpha = 1.0
            self.btnOptionFour.alpha = 1.0
            
            self.cardView.transform = CGAffineTransform.identity
            self.btnOptionOne.transform = CGAffineTransform.identity
            self.btnOptionTwo.transform =  CGAffineTransform.identity
            self.btnOptionThree.transform = CGAffineTransform.identity
            self.btnOptionFour.transform = CGAffineTransform.identity
        })
        
        
        
        
    }
    
    func setUpView(){
        cardView.layer.cornerRadius = 20.0
        cardView.clipsToBounds = true
        cardView.layer.shadowRadius = 15.0
        cardView.layer.shadowOpacity = 0.2
        btnOptionOne.layer.borderWidth = 3.0
        btnOptionOne.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnOptionTwo.layer.borderWidth = 3.0
        btnOptionTwo.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnOptionThree.layer.borderWidth = 3.0
        btnOptionThree.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnOptionFour.layer.borderWidth = 3.0
        btnOptionFour.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnOptionTwo.layer.cornerRadius = 20.0
        btnOptionThree.layer.cornerRadius = 20.0
        btnOptionFour.layer.cornerRadius = 20.0
        btnOptionOne.layer.cornerRadius = 20.0
        btnOptionTwo.clipsToBounds = true
        btnOptionThree.clipsToBounds = true
        btnOptionFour.clipsToBounds = true
        btnOptionOne.clipsToBounds = true
        if currentIndex == flashcards.count-1 || flashcards.count == 0 {
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
        let correctAnswer = flashcards[currentIndex].Answer1
        
        if sender.currentTitle == correctAnswer {
            animateCorrectAnswer(button: sender)
        }
        else {
            animateWrongAnswer(button: sender)
        }
        
    }
    
    @IBAction func didTapOnFlash(_ sender: Any) {
        flipFlashCard()
    }
    
    func animateCorrectAnswer(button: UIButton){
        UIView.animate(withDuration: 0.2, animations: {
            button.transform = CGAffineTransform.identity.translatedBy(x: 0.0, y: 5.0)
            
        }, completion: {
            finished in
            button.layer.borderColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            button.transform = CGAffineTransform.identity.translatedBy(x: 0.0, y: -5.0)
            UIView.animate(withDuration: 0.2){
                                      button.transform = CGAffineTransform.identity
                                  }
        })
    }
    
    func animateWrongAnswer(button: UIButton){
        UIView.animate(withDuration: 0.2, animations: {
            button.transform = CGAffineTransform.identity.translatedBy(x: 5.0, y: 0.0)
        }) { finished in
            button.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            button.alpha = 0.5
            button.transform = CGAffineTransform.identity.translatedBy(x: -5.0, y: 0.0)
            UIView.animate(withDuration: 0.2){
                           button.transform = CGAffineTransform.identity
                       }
            button.isEnabled = false
        }
    }
    
    func animateCardOut(){
        if (isNext){
            UIView.animate(withDuration: 0.3, animations: {
                self.cardView.transform = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0)
            }, completion: {
                finished in
                self.updateLabels(flashCard: self.flashcards[self.currentIndex])
                
                self.animateCardIn()
                
            })}
        else {
            UIView.animate(withDuration: 0.3, animations: {
                self.cardView.transform = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0)
            }, completion: {
                finished in
                self.updateLabels(flashCard: self.flashcards[self.currentIndex])
                
                self.animateCardIn()
                
            })
        }
    }
    
    func animateCardIn(){
        if(isNext){
            cardView.transform  = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0)
            
            UIView.animate(withDuration: 0.3){
                self.cardView.transform = CGAffineTransform.identity
            }
            
        }
        else {
            cardView.transform  = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0)
            
            UIView.animate(withDuration: 0.3){
                self.cardView.transform = CGAffineTransform.identity
            }
            
        }
    }
    
    func flipFlashCard(){
        
        UIView.transition(with: cardView, duration: 0.3, options: .transitionFlipFromTop, animations: {
            self.isHidden = !self.isHidden
            self.backLabel.isHidden = self.isHidden
        })
        
        
        
    }
    
    func updateCard(){
        btnOptionOne.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnOptionThree.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnOptionTwo.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnOptionFour.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnOptionOne.isEnabled = true
        btnOptionTwo.isEnabled = true
        btnOptionThree.isEnabled = true
        btnOptionFour.isEnabled = true
        btnOptionTwo.alpha = 1
        btnOptionThree.alpha = 1
        btnOptionFour.alpha = 1
        btnOptionOne.alpha = 1
        
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
            creationController.initialQuestion = flashcards[currentIndex].Question
            creationController.initialAnswer = flashcards[currentIndex].Answer1
            creationController.extraAnswerText1 = flashcards[currentIndex].Answer2
            creationController.extraAnswerText2 =
                flashcards[currentIndex].Answer3
            creationController.extraAnswerText3 =
                flashcards[currentIndex].Answer4
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
            isNext = true
        }
        else
            if (sender.currentTitle == "Prev"){
                currentIndex = currentIndex - 1
                isNext = false
        }
        animateCardOut()
    }
    
    func updateLabels(flashCard:FlashCard){
        
        frontLabel.text = flashCard.Question
        backLabel.text = flashCard.Answer1
        
        let buttons = [btnOptionOne,btnOptionTwo,btnOptionThree, btnOptionFour].shuffled()
        let answers = [flashCard.Answer1,flashCard.Answer2,flashCard.Answer3,flashCard.Answer4].shuffled()
        
        for (button,answer) in zip(buttons,answers){
            button?.setTitle(answer, for: .normal)
        }
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
