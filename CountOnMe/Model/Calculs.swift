//
//  Calculs.swift
//  CountOnMe
//
//  Created by vincent santos on 11/01/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation
class Calculs {
    var calculText: ((String) -> Void)?
    var displayAlert: ((String) -> Void)?
    var expression: String = "1 + 1 = 2" {
        didSet {
            calculText?(expression)
        }
    }
    var elements: [String] {
        return expression.split(separator: " ").map { "\($0)" }
    }
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "%"
    }
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "%"
    }
    var expressionHaveResult: Bool {
        return expression.firstIndex(of: "=") != nil
    }
    func addNewNumber (number: String) {
        if expressionHaveResult {
            expression = ""
        }
        expression.append(number)
        
    }
    func addOperator(operateur: String) {
        if canAddOperator {
            expression.append(" \(operateur)" )
        } else {
            displayAlert?("déja fait")
        }
    }
    func calculator() {
        guard expressionIsCorrect else {
            displayAlert?("Entrez une valeur correcte")
            return
        }
        guard expressionHaveEnoughElement else {
            displayAlert?("valeurs manquantes")
            return
        }
        var operationsToReduce = elements
        while operationsToReduce.count > 1 {
            let left = Int(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Int(operationsToReduce[2])!
            let result: Int
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "x": result = left * right
            case "%": result = left / right
            default: return
            }
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        expression.append(" = \(operationsToReduce.first!)")
    }
    func clean() {
            expression = ""
        }
}
