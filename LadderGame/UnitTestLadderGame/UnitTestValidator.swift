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
    let heightNotAllowed = "a"

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // 두 입력값 모두 허용될 때
    func testValidatoNoThrow() {
        XCTAssertNoThrow(try Validator.checkValidate(height: heightAllowed, names: namesAllowed))
    }
    
    // names 입력값 중 5글자를 넘는 이름이 있을 때
    func testValidatorThrowOutOfNameLengthError() {
        XCTAssertThrowsError(try Validator.checkValidate(height: heightAllowed, names: namesNotAllowed)) {
            (error) -> Void in XCTAssertEqual(error as? InputError, InputError.outOfNameLength)
        }
    }
    
    // height 입력값이 정수형이 아닐 때
    func testValidatorThrowNotIntType() {
        XCTAssertThrowsError(try Validator.checkValidate(height: heightNotAllowed, names: namesAllowed)) {
            (error) -> Void in XCTAssertEqual(error as? InputError, InputError.notIntType)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
