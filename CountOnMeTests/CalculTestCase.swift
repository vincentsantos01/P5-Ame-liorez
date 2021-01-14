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

    func testEssai() {
        let calculs = Calculs()
        calculs.addOperator(operateur: "x")
        XCTAssert((calculs.displayAlert == nil))
    }
}
