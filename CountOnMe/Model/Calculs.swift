//
//  Calculs.swift
//  CountOnMe
//
//  Created by vincent santos on 11/01/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation
class Calculator {
    var calculText: ((String) -> Void)?
    var displayAlert: ((String) -> Void)?
    init() {
            self.calculString = ""
        }
    var calculString: String {
            didSet {
                calculText?(calculString)
            }
        }
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
            expression.append(" \(operateur) " )
        } else {
            displayAlert?("Type d'opération déja saisie")
        }
    }
    func calculs() {
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
                    
                    guard var left = Double(operationsToReduce[0]) else { return }
                   var operand = operationsToReduce[1]
                    guard var right = Double(operationsToReduce[2]) else { return }
                    
                    let result: Double
                        
                        
                        var operandIndex = 1
                        
                        
                        if let index = operationsToReduce.firstIndex(where: { $0 == "x" || $0 == "÷" }) {
                            
                            operandIndex = index
                            if let leftunwrapp = Double(operationsToReduce[index - 1]) { left = leftunwrapp }
                            operand = operationsToReduce[index]
                            if let rightUnwrapp = Double(operationsToReduce[index + 1]) { right = rightUnwrapp }
                        }
                        
                        result = calculate(left: Double(left), right: Double(right), operand: operand)
                        
                    
                        
                        for _ in 1...3 {
                            
                            operationsToReduce.remove(at: operandIndex - 1)
                         
                        }
                    
                        operationsToReduce.insert(formatResult(result: Double(result)), at: operandIndex - 1 )
                        
                    }
                    guard let finalResult = operationsToReduce.first else { return }
                    calculString.append(" = \(finalResult)")
            }
    func calculate(left: Double, right: Double, operand: String) -> Double {
               
               let result: Double
               switch operand {
               case "+": result = left + right
               case "-": result = left - right
               case "÷": result = left / right
               case "x": result = left * right
               default: return 0.0
               }
               return result
           }
    private func formatResult(result: Double) -> String {
         let formatter = NumberFormatter()
         formatter.maximumFractionDigits = 3
         guard let resultFormated = formatter.string(from: NSNumber(value: result)) else { return String() }
         
   
         guard resultFormated.count <= 10 else {
             return String(result)
         }
         return resultFormated
     }
    func clean() {
            expression = ""
        }
       /* var operationsToReduce = elements
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
        }*/
}
