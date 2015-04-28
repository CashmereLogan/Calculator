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
    var answerInt = 0
    @IBAction func buttonPress(sender: UIButton) {
        var buttonText = sender.titleLabel?.text
        var empty = outputStream.text?.isEmpty
        var string1 = ""
        if let text = outputStream.text {
            outputStream.text = text + buttonText!
        }else{
            outputStream.text = buttonText!
        }
        
        //let operatorArray: [String] = ["+", "-", "*", "/"]
        let operators = NSCharacterSet(charactersInString: "+,-/")
        
        let nsString = outputStream.text! as NSString
        stringArray = nsString.componentsSeparatedByCharactersInSet(operators) as! [String]
        
        for x in stringArray{
            if let int = x.toInt() {
                answerInt += int
            }
        }
        answerBox.text = "\(answerInt)"
    
    }
    
    @IBAction func backButton(sender: AnyObject) {
        var sameText = outputStream.text
        var empty = outputStream.text?.isEmpty
        if let text = outputStream.text {
            if (empty == false){
                outputStream.text = dropLast(text)
                if stringArray.count != 0{
                    answerInt -= stringArray.last!.toInt()!
                    stringArray.removeLast()
                    answerBox.text = "\(answerInt)"
                }
                for x in stringArray{
                    if let int = x.toInt(){
                        answerInt += int
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

