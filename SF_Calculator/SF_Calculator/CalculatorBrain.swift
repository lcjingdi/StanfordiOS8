//
//  CalculatorBrain.swift
//  SF_Calculator
//
//  Created by jingdi on 2016/10/17.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    enum Op {
        case Operand(Double)
        case UnaryOperation(String, (Double) -> Double)
        case BinaryOperation(String, (Double, Double)-> Double)
    }
    
    var opStack = [Op]()
    
    var knowOps = [String: Op]()
    
    init() {
        knowOps["+"] = Op.BinaryOperation("+", +)
        knowOps["−"] = Op.BinaryOperation("−"){$1 - $0}
        knowOps["×"] = Op.BinaryOperation("×", *)
        knowOps["÷"] = Op.BinaryOperation("÷") {$1 / $0}
        knowOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
    func pushOperand(operand: Double) {
        opStack.append(Op.Operand(operand))
    }
    
    func performOperation(symbol: String) {
        if let operation = knowOps[symbol] {
            
        }
    }
}
