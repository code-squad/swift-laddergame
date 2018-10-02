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
        XCTAssertFalse(Validator.isMoreThanOnePlayerAtLeast(names: noName))
    }
    
    func testPlayerNameOutOfLength() {
        XCTAssertFalse(Validator.isWithinLength(names: namesNotAllowed))
    }
    
    func testHeightIntMoreThanTwo() {
        XCTAssertFalse(Validator.isIntMoreThanTwo(height: heightNotAllowedCuzChar)||Validator.isIntMoreThanTwo(height: heightNotAllowedCuzNeg))
    }
    
    func testValidatorThrowNoPlayer() {
        XCTAssertThrowsError(try Validator.throwInputError(names: noName, height: heightAllowed)) {
            (error) -> Void in XCTAssertEqual(error as? InputError, InputError.noPlayer)
        }
    }
    
    func testValidatorThrowOutOfNameLengthError() {
        XCTAssertThrowsError(try Validator.throwInputError(names: namesNotAllowed, height: heightAllowed)) {
            (error) -> Void in XCTAssertEqual(error as? InputError, InputError.outOfNameLength)
        }
    }
    
    func testValidatorThrowNotInt() {
        XCTAssertThrowsError(try Validator.throwInputError(names: namesAllowed, height: heightNotAllowedCuzChar)) {
            (error) -> Void in XCTAssertEqual(error as? InputError, InputError.notIntMoreThanTwo)
        }
    }
    
    func testValidatorThrowNoMoreThanTwo() {
        XCTAssertThrowsError(try Validator.throwInputError(names: namesAllowed, height: heightNotAllowedCuzNeg)) {
            (error) -> Void in XCTAssertEqual(error as? InputError, InputError.notIntMoreThanTwo)
        }
    }
    
    func testAllInputsAreValid() {
        XCTAssertNoThrow(try Validator.throwInputError(names: namesAllowed, height: heightAllowed))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
