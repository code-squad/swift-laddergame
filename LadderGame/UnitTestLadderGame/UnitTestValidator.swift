//
//  UnitTestValidator.swift
//  UnitTestLadderGame
//
//  Created by 윤지영 on 01/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestValidator: XCTestCase {
    
    let noName = ""
    let namesAllowed = "cat,dog"
    let namesNotAllowed = "rabbit,dog"
    let heightAllowed = "5"
    let heightNotAllowedCuzChar = "a"
    let heightNotAllowedCuzNeg = "-1"

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMoreThanOnePlayerAtLeast() {
        XCTAssertEqual(Validator.checkInputError(names: noName, height: heightAllowed), .noPlayer)
    }
    
    func testPlayerNameOutOfLength() {
        XCTAssertEqual(Validator.checkInputError(names: namesNotAllowed, height: heightAllowed), .outOfNameLength)
    }
    
    func testHeightIntMoreThanTwo() {
        XCTAssertEqual(Validator.checkInputError(names: namesAllowed, height: heightNotAllowedCuzChar), .notIntMoreThanTwo)
    }
    
    func testAllInputsAreValid() {
        XCTAssertEqual(Validator.checkInputError(names: namesAllowed, height: heightAllowed), .noError)
    }

}
