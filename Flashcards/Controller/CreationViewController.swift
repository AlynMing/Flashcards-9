//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Jawny J on 2/29/20.
//  Copyright © 2020 Jawny Jules. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    var initialQuestion: String?
    var initialAnswer: String?
    var flashCardController: ViewController!
    var extraAnswerText1: String?
    var extraAnswerText2: String?
    var extraAnswerText3: String?
    @IBOutlet weak var extraAnswer1: UITextField!
    var isEdit: Bool = false
    @IBOutlet weak var extraAnswer2: UITextField!
    @IBOutlet weak var extraAnswer3: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
        extraAnswer1.text = extraAnswerText1
        extraAnswer2.text = extraAnswerText2
        extraAnswer3.text = extraAnswerText3
        
    }
    
    @IBAction func didTapOnCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapOnDone(_ sender: UIBarButtonItem) {
        let questionText: String = questionTextField.text ?? ""
        let answerText: String  = answerTextField.text ?? ""
        extraAnswerText1 = extraAnswer1.text ?? ""
        extraAnswerText2 = extraAnswer2.text ?? ""
        extraAnswerText3 = extraAnswer3.text ?? ""
        
        let alert = UIAlertController(title:"Fill out both fields",message: "You need to fill out both fields", preferredStyle: .alert)
        let okAction =  UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okAction)

        if  questionText.isEmpty || answerText.isEmpty {
            present(alert, animated: true)
            return
        }
        
        let flashCard = FlashCard(question: questionText, answer1: answerText, answer2: extraAnswerText1, answer3: extraAnswerText2, answer4: extraAnswerText3)
      
        if isEdit{
            if(flashCardController.flashcards.count == 0 ){
                  flashCardController.flashcards.append(flashCard)
                     flashCardController.currentIndex+=1
            }
            else { flashCardController.flashcards[flashCardController.currentIndex] = flashCard
            }
        }
        else {
        flashCardController.flashcards.append(flashCard)
        flashCardController.currentIndex+=1
        }
        
        flashCardController.saveAllFlashcardsToDisk()
        flashCardController.updateLabels(flashCard: flashCard)
        dismiss(animated: true, completion: nil)

    }
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
