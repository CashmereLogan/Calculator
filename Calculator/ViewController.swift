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
    
    
    
    @IBAction func buttonPress(sender: UIButton) {
        var buttonText = sender.titleLabel?.text
        var empty = outputStream.text?.isEmpty
        var string1 = ""
        if let text = outputStream.text {
            outputStream.text = text + buttonText!
        }else{
            outputStream.text = buttonText!
        }
        var operatorArray = ["+", "-", "*", "/"]
        var stringArray = ""
        for x in outputStream.text!.startIndex..<outputStream.text!.endIndex{
            //var y = outputStream.text[x]
            var y = "+"
            for z in operatorArray.startIndex..<operatorArray.endIndex{
                if(y == operatorArray[z]){
                    stringArray = split(outputStream.text!) {$0 == operatorArray[z]}
                }
            }
        }
    
        
        var answerInt = 0
        for i in stringArray[0]..<stringArray.endIndex{
            answerInt += stringArray[i].asInt()
        }
        answerBox.text = "\(answerInt)"
    
    }
    
    @IBAction func backButton(sender: AnyObject) {
        var sameText = outputStream.text
        var empty = outputStream.text?.isEmpty
        if let text = outputStream.text {
            if (empty == false){
            outputStream.text = dropLast(text)
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

