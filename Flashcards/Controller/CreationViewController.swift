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
    @IBOutlet weak var extraAnswer1: UITextField!
    
    @IBOutlet weak var extraAnswer2: UITextField!
    @IBOutlet weak var extraAnswer3: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
        
    }
    
    @IBAction func didTapOnCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapOnDone(_ sender: UIBarButtonItem) {
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        let extraAnswerText1 = extraAnswer1.text
        let extraAnswerText2 = extraAnswer2.text
        let extraAnswerText3 = extraAnswer3.text
        
        let alert = UIAlertController(title:"Fill out both fields",message: "You need to fill out both fields", preferredStyle: .alert)
        let okAction =  UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okAction)

        if questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty {
            present(alert, animated: true)
            return
        }
        
        
       
        
        flashCardController.updateFlashCard(question: questionText!, answer: answerText!, extraAnswer1: extraAnswerText1!, extraAnswer2: extraAnswerText2!, extraAnswer3: extraAnswerText3! )
        
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
