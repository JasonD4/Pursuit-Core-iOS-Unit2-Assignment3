//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var chosenWord: UITextField!
    @IBOutlet weak var counterDisplayer: UILabel!
    @IBOutlet weak var newgameButtonweaker: UIButton!
    
    @IBOutlet weak var labelWord: UILabel!
    @IBOutlet weak var letterGuesses: UITextField!
    
    @IBOutlet weak var hangmanPic: UIImageView!
    
    
    var guesses = String()
    var correctWord = String()
    var checker = String()
    var checker2 = String()
    var counter = 8
  override func viewDidLoad() {
    super.viewDidLoad()
    chosenWord.delegate = self
    letterGuesses.delegate = self
  }
    
    @IBAction func newGame(_ sender: UIButton) {
        counter += 8
        chosenWord.isHidden = false
        chosenWord.isEnabled = true
        correctWord.removeAll()
        checker.removeAll()
        checker2.removeAll()
        letterGuesses.isHidden = true
        labelWord.text = nil
        chosenWord.text?.removeAll()
    }
}
extension ViewController: UITextFieldDelegate{
    override func resignFirstResponder() -> Bool {
    chosenWord.resignFirstResponder()
        letterGuesses.resignFirstResponder()
        
       return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        correctWord = chosenWord.text!.lowercased()
        if chosenWord.isEnabled == true{
        for _ in 0..<correctWord.count{
            checker.append("_" + " ")
        }
            labelWord.text = checker
        }
        chosenWord.isEnabled = false
        chosenWord.isHidden = true

        letterGuesses.isHidden = false
        labelWord.isHidden = false
    
        if chosenWord.isEnabled == false{
        guesses = letterGuesses.text!
            checker2.append(guesses)
        if correctWord.contains(guesses){
            checker.removeAll()
            for letter in correctWord{
                if checker2.contains(letter){
                    checker.append(letter)
                }
                else{
                    checker.append("_" + " ")
                }
            }
        }
        else{
            counter -= 1
            hangmanPic.image = UIImage(named: counterPic(input: counter))
            counterDisplayer.text = "counter: \(counter)"
            }
            letterGuesses.text?.removeAll()
            labelWord.text = checker
        }
        if counter == 0{
            letterGuesses.isEnabled = false
        counterDisplayer.text = "you lose"
            newgameButtonweaker.isHidden = false
            
        }

        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         if letterGuesses.text?.count == 1 && !checker2.contains(letterGuesses.text!) {
            return false
        }
         else{
            return true

        }
    }

}
