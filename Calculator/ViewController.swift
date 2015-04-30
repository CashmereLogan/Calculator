//
//  ViewController.swift
//  Calculator
//
//  Created by DFA Film 11: Brian on 4/27/15.
//  Copyright (c) 2015 DFA Film 11: Brian. All rights reserved.
//

import UIKit
let operators = NSCharacterSet(charactersInString: "+,-/")

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
    var op = ""
    
    func operate(operatorToUse: String) {
        for x in stringArray{
            if let int = x.toInt() {
                if (operatorToUse == "-"){
                    answerInt -= int
                }else if (operatorToUse == "*"){
                    answerInt *= int
                }else if (operatorToUse == "/"){
                    answerInt /= int
                }else if (operatorToUse == "+"){
                    answerInt += int
                }
            }
        }
        answerBox.text = "\(answerInt)"
        answerInt = 0
    }
    
    func recalculate() {
        let nsString = outputStream.text! as NSString
        stringArray = nsString.componentsSeparatedByCharactersInSet(operators) as! [String]
        operatorArray = Array(arrayLiteral: outputStream.text!)
        for x in 0..<operatorArray.count{
            let opChar = operatorArray[x] as NSString
            if (opChar == "-"){
                var op = "-"
            }
        }
        /*for x in stringArray{
            if let int = x.toInt() {
                //answerInt += int
                operate(op)
            }
        }*/
        operate(op)
        /*answerBox.text = "\(answerInt)"
        answerInt = 0*/
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

