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
    
    
    @IBAction func buttonPress(sender: UIButton) {
        var buttonText = sender.titleLabel?.text
        if let text = userInput.text {
            userInput.text = text + buttonText!
        }else{
            userInput.text = buttonText!
        }
    }
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

