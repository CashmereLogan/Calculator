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

    @IBOutlet weak var outputStream: UILabel!
    @IBOutlet weak var answerBox: UILabel!
    
    var stringArray: [String] = []
    var operatorArray: [String] = []
    var answerInt = 0
    let savedAnswerInt = 0
    let operators = NSCharacterSet(charactersInString: "+,-/")
    let numbers = NSCharacterSet(charactersInString: "123456789")
    var opChar = ""
    
    func operate(operatorToUse: String, numberToUse: Int){
        println("numberToUse \(numberToUse)")
        if (operatorToUse == "+"){
            answerInt += numberToUse
        }else if (operatorToUse == "-"){
            answerInt == answerInt - numberToUse
        }else if (operatorToUse == "*"){
            answerInt *= numberToUse
        }else if (operatorToUse == "/"){
            answerInt /= numberToUse
        }else{
            answerInt = numberToUse
        }

    }
    
    func recalculate() {
        let nsString = outputStream.text! as NSString
        stringArray = nsString.componentsSeparatedByCharactersInSet(operators) as! [String]
        operatorArray = nsString.componentsSeparatedByCharactersInSet(numbers) as! [String]
        
        for x in operatorArray{
            if (x == "+"){
                opChar = "+"
            }else if (x == "-"){
                opChar = "-"
            }else if (x == "*"){
                opChar = "*"
            }else if (x == "/"){
                opChar = "/"
            }
        }
        
        for x in stringArray{
            if let int = x.toInt() {
                operate(opChar, numberToUse: x.toInt()!)
                //One function gets expression ready, other calculates it based on number added after operator
                //answerInt += int
                //where I need to call calculation
            }
        }
        
        answerBox.text = "\(answerInt)"
        answerInt = 0
    }
    
    
    @IBAction func buttonPress(sender: UIButton) {
        var buttonText = sender.titleLabel?.text
        var empty = outputStream.text?.isEmpty
        var string1 = ""
        if let text = outputStream.text {
            outputStream.text = text + buttonText!
        }else{
            outputStream.text = buttonText!
        }
        
        recalculate()
    
    }
    
    @IBAction func backButton(sender: AnyObject) {
        var sameText = outputStream.text
        var empty = outputStream.text?.isEmpty
        let nsOutputStream = outputStream.text! as NSString
        let lastIndex = nsOutputStream.length
        
        if let text = outputStream.text {
            if (empty == false){
                outputStream.text = dropLast(text)
                let lastNumber = nsOutputStream.substringFromIndex(lastIndex-1)
                if (stringArray.count != 0 && lastNumber != "+" && lastNumber != "-" && lastNumber != "/" && lastNumber != "*"){
                    recalculate()
                }else{
                    if(stringArray.count == 1){
                        outputStream.text = "0"
                        answerInt = 0
                        answerBox.text = "\(answerInt)"
                        stringArray.removeLast()
                    }else if(stringArray.count == 0){
                        outputStream.text = ""
                        answerBox.text = ""
                    }
                
                }
            }else{
                outputStream.text = sameText
            }
        }
        
    }
    
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

