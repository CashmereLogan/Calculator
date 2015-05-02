//
//  ViewController.swift
//  Calculator
//
//  Created by DFA Film 11: Brian on 4/27/15.
//  Copyright (c) 2015 DFA Film 11: Brian. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var answerBox: UILabel!
    @IBOutlet weak var userInput: UILabel!
    var stringArray: [String] = []
    var operatorArray: [String] = []
    let operators = NSCharacterSet(charactersInString: "+-*/")
    let numbers = NSCharacterSet(charactersInString: "123456789")
    var answerInt = 0
    var answerInt2 = 0
    var op = ""
    var numberToSend = 0
    var previousNumberToSend = 0
    var opCount = 0
    
    @IBAction func buttonPress(sender: UIButton) {
        var buttonText = sender.titleLabel?.text
        if let text = userInput.text {
            userInput.text = text + buttonText!
        }else{
            userInput.text = buttonText!
        }
        calculate()
    }
    
    func calculate(){
        let nsString = userInput.text! as NSString
        let length = (nsString.length - 1)
        var lastCharacter = ""
        if(length >= 0){
            lastCharacter = nsString.substringFromIndex(length)
        }
        
        stringArray = nsString.componentsSeparatedByCharactersInSet(operators) as! [String]
        let tempOperatorArray = nsString.componentsSeparatedByCharactersInSet(numbers) as! [String]
        operatorArray = [""]
        for x in tempOperatorArray{
            if (x != ""){
                operatorArray.append(x)
                opCount++
            }
        }
        var count = 0
        println("Operator Array: \(operatorArray)")
        for x in stringArray{
            if let int = x.toInt(){
                numberToSend = x.toInt()!
                var opLength = operatorArray.count - 1
                if (lastCharacter != "+" && lastCharacter != "-" && lastCharacter != "/" && lastCharacter != "*"){
                    if (operatorArray.count > 0){
                        
                        operate(operatorArray[count], numberToUse: numberToSend, previousNumber: previousNumberToSend)
                        previousNumberToSend = answerInt
                    }else{
                        operate("", numberToUse: numberToSend, previousNumber: previousNumberToSend)
                    }
                }else{
                    if(opCount == 1){
                        operate("", numberToUse: numberToSend, previousNumber: previousNumberToSend)
                    }else if(opCount>1){
                        operate("", numberToUse: answerInt2, previousNumber: previousNumberToSend)
                    }
                    
                }
            }
            count++
        }
        previousNumberToSend = answerInt
        answerBox.text! = "\(answerInt)"
        answerInt = 0
    }
    
    func operate(operatorToUse: String, numberToUse: Int, previousNumber: Int){
        println("opToUse: \(operatorToUse)")
        var lastCalculation = answerInt
        if(operatorToUse == "+"){
            answerInt = answerInt + numberToUse
        }else if(operatorToUse == "-"){
            answerInt = previousNumber - numberToUse
        }else if (operatorToUse == "/"){
            answerInt = previousNumber / numberToUse
        }else if (operatorToUse == "*"){
            answerInt = previousNumber * numberToUse
        }else{
            answerInt = numberToUse
        }
        answerInt2 = answerInt
    }
   
    @IBAction func backspaceButton(sender: AnyObject) {
        var sameText = userInput.text
        var empty = userInput.text?.isEmpty
        let nsUserInput = userInput.text! as NSString
        let lastIndex = nsUserInput.length
        
        if let text = userInput.text {
            if (empty == false){
                userInput.text = dropLast(text)
                let lastNumber = nsUserInput.substringFromIndex(lastIndex-1)
                if (stringArray.count != 0){
                    calculate()
                }else{
                    if(stringArray.count == 1){
                        userInput.text = "0"
                        answerInt = 0
                        answerBox.text = "\(answerInt)"
                        stringArray.removeLast()
                    }else if(stringArray.count == 0){
                        userInput.text = ""
                        answerBox.text = ""
                    }
                    
                }
            }else{
                userInput.text = sameText
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
