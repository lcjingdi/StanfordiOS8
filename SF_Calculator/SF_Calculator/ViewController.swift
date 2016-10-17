//
//  ViewController.swift
//  SF_Calculator
//
//  Created by jingdi on 2016/10/13.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false

    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        
    }
    
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        
        switch operation {
        case "+": performOperation {$0 + $1}
        case "−": performOperation {$1 - $0}
        case "×": performOperation {$0 * $1}
        case "÷": performOperation {$1 / $0}
        case "√": performOperation2 {sqrt($0)}
        default:
            break
        }
    }
    
    func performOperation(_ operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    func performOperation2(_ operation: (Double) -> Double) {
//        if operandStack.count >= 1 {
//            displayValue = operation(operandStack.removeLast())
//            enter()
//        }
        
    }

    @IBAction func enter() {
        operandStack.append(displayValue)
        userIsInTheMiddleOfTypingANumber = false
        print("operandStack \(operandStack)")
    }
    var operandStack = [Double]()
    
    var displayValue: Double {
        get {
            return NumberFormatter().number(from: display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
    }

}

