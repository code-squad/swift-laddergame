//
//  UnitTestValidator.swift
//  UnitTestLadderGame
//
//  Created by 윤지영 on 01/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestValidator: XCTestCase {
    
    let namesAllowed = "cat,dog"
    let namesNotAllowed = "rabbit,dog"
    let heightAllowed = "1"
    let heightNotAllowedCuzChar = "a"
    let heightNotAllowedCuzNeg = "-1"

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // names 입력값 허용될 때
    func testNamesAreValid() {
        XCTAssertNoThrow(try Validator.isValid(names: namesAllowed))
    }
    
    // names 입력값 중 5글자를 넘는 이름이 있을 때
    func testValidatorThrowOutOfNameLengthError() {
        XCTAssertThrowsError(try Validator.isValid(names: namesNotAllowed)) {
            (error) -> Void in XCTAssertEqual(error as? InputError, InputError.outOfNameLength)
        }
    }
    
    // height 입력값 허용될 때
    func testHeightIsValid() {
        XCTAssertNoThrow(try Validator.isValid(height: heightAllowed))
    }
    
    // height 입력값이 정수형이 아닐 때
    func testValidatorThrowNotIntType() {
        XCTAssertThrowsError(try Validator.isValid(height: heightNotAllowedCuzChar)) {
            (error) -> Void in XCTAssertEqual(error as? InputError, InputError.notIntType)
        }
    }
    
    // height 입력값이 양의 정수가 아닐 때
    func testValidatorThrowNotPositiveInt() {
        XCTAssertThrowsError(try Validator.isValid(height: heightNotAllowedCuzNeg)) {
            (error) -> Void in XCTAssertEqual(error as? InputError, InputError.notPositiveInt)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
