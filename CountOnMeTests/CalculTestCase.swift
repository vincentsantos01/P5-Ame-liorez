//
//  CalculTestCase.swift
//  CountOnMeTests
//
//  Created by vincent santos on 14/01/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe
class CalculTestCase: XCTestCase {
    // Nous verrifions que si pas d'operateur ont retourne l'alerte
    func testGivenCompleteOperation_WhenNotOperator_ThenReturnErrorString() {
        let calculator = Calculator()
        calculator.addNewNumber(number: "2")
        calculator.addOperator(operateur: "")
        calculator.addNewNumber(number: "2")
        var stringError = ""
        let expectation = self.expectation(description: "operation")
        calculator.displayAlert = { result in
            stringError = result
            expectation.fulfill()
        }
        calculator.calculs()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(stringError, "valeurs manquantes")
    }
    // Nous verrifions que si un nombre de l'operation est manquant ont retourne l'alerte
    func testGivenNumberForget_WhenElementsNumberMissing_ThenReturnErrorString() {
        let calculator = Calculator()
        calculator.addNewNumber(number: "1")
        calculator.addOperator(operateur: "+")
        calculator.addNewNumber(number: "")
        var stringError = ""
        let expectation = self.expectation(description: "number")
        calculator.displayAlert = { result in
            stringError = result
            expectation.fulfill()
        }
        calculator.calculs()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(stringError, "Entrez une valeur correcte")
    }
    // Nous verrifions que nous avons bien le bon résultat a l'opération simple
    func testGivenExpressionHaveResult_WhenExpressionHaveResult_ThenReturnOperation() {
        let calculator = Calculator()
        calculator.addNewNumber(number: "3")
        calculator.addOperator(operateur: "+")
        calculator.addNewNumber(number: "3")
        calculator.calculs()
        XCTAssert(calculator.calculString == "3 + 3 = 6")
    }
    // Nous verrifions que la priorité soit respecter
    func testGivenOrderOfOperations_WhenElementsContainSomething_ThenElementsFollowsOrderOfOperations() {
        let calculator = Calculator()
        calculator.addNewNumber(number: "1")
        calculator.addOperator(operateur: "+")
        calculator.addNewNumber(number: "1")
        calculator.addOperator(operateur: "x")
        calculator.addNewNumber(number: "4")
        calculator.calculs()
        XCTAssert(calculator.calculString == "1 + 1 x 4 = 5")
    }
    // Nous verrifions que nous ne pouvons pas diviser par zéro
    func testGivenDivisionByZero_WhenDivisionByZero_ThenReturnErrorString() {
        let calculator = Calculator()
        calculator.addNewNumber(number: "2")
        calculator.addOperator(operateur: "%")
        calculator.addNewNumber(number: "0")
        var stringError = ""
        let expectation = self.expectation(description: "division")
        calculator.displayAlert = { result in
            stringError = result
            expectation.fulfill()
        }
        calculator.calculs()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(stringError, "Division par zero imposible")
    }
}
