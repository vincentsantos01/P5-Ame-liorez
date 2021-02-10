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

    // Nous verrifions que nous pouvons bien ajouter des opérateurs
    func testGivenCanAddOperator_WhenCanAddOperator_ThenReturnTrue() {
        let calculator = Calculator()
        calculator.calculString = " 1 + 2 + 3 "
        XCTAssertTrue(calculator.canAddOperator)
    }
    // Nous verrifions que nous avons bien un résultat a l'opération
    func testGivenExpressionHaveResult_WhenExpressionHaveResult_ThenReturnTrue() {
        let calculator = Calculator()
        calculator.calculString = " = 6 "
        XCTAssertTrue(calculator.canAddOperator)
    }
    // Nous verrifions que nous pouvons bien ajouter un nombre et qu'il soit bien reconnu
    func testGivenAddNumber_WhenAddNumber_ThenReturnNumber() {
        let calculator = Calculator()
        calculator.addNewNumber(number: "3")
        XCTAssertTrue(calculator.calculString == "3")
    }
    // Nous verrifions que nous ne pouvons pas diviser par zéro
    func testGivenDivisionByZero_WhenDivisionByZero_ThenReturnEqual() {
        let calculator = Calculator()
        calculator.addNewNumber(number: "2")
        calculator.addOperator(operateur: "%")
        calculator.addNewNumber(number: "0")
        calculator.calculs()
        XCTAssertEqual(calculator.calculString, "")
    }
}
