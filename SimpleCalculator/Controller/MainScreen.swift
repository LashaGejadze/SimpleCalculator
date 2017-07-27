//
//  MainScreen.swift
//  SimpleCalculator
//
//  Created by macosx on 26.05.17.
//  Copyright © 2017 macosx. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    var isFirstDigit = true
    var numberOnCScreen = 0.0
    var sumOperation = 0
    
    
    
    
    
    @IBOutlet weak var calcScreen: UILabel!
    
    @IBAction func calcNumbers(_ sender: UIButton) {
        if isFirstDigit { calcScreen.text! = String(sender.tag)
        } else {
            calcScreen.text = calcScreen.text! + String(sender.tag)
        }
        isFirstDigit = false
        
    }
    
    @IBAction func calcOperators(_ sender: UIButton) {
        if  !calcScreen.text!.isEmpty {
            sumOperation = sender.tag
            numberOnCScreen = Double(calcScreen.text!)!
            calcScreen.text! = ""
        }else {
            print("crash") }
    }
    
    @IBAction func calcEraseButton(_ sender: UIButton) {
        calcScreen.text! = ""
    }
    
    @IBAction func calcEqualButton(_ sender: UIButton) {
        if !calcScreen.text!.isEmpty {
            let number = operationValue (with: sumOperation , num1: numberOnCScreen, num2: Double(calcScreen.text!)!)
            calcScreen.text = "\(number)"
        }
        else {
            print("error")
        }
    }
    
    
    
    func operationValue (with op: Int,num1: Double,num2: Double) -> Double {
        switch op {
        case 0:
            return num1 + num2
        case 1:
            return num1 - num2
        case 2:
            return num1 * num2
        case 3:
            return num1 / num2
        default:
            break
        }
        return 0.0
    }

}


