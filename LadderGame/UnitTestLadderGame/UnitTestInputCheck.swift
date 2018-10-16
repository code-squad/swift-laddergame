//
//  UnitTestInputCheck.swift
//  UnitTestLadderGame
//
//  Created by 김장수 on 2018. 10. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
import Foundation

@testable import LadderGame

class UnitTestInputCheck: XCTestCase {
    var inputCheck = InputCheck()
    
    override func setUp() {

    }

    override func tearDown() {

    }

    func testIsValidNamesTrueCase() {
        // 5글자 이하의 이름 입력
        let people = "JK,Crong,Honux,Pobi"
        let isValid = inputCheck.isValid(people: people)
        XCTAssertTrue(isValid)
    }
    
    func testIsValidNamesFalseCase() {
        // 3명 미만, 20명 초과
        let people = "JK"
        let isValid = inputCheck.isValid(people: people)
        XCTAssertFalse(isValid)
    }
    
    func testIsValidNameLengthFalseCase() {
        // 6글자 이상의 이름 입력
        let people = "Jumpingbilly"
        let isValid = inputCheck.isValid(people: people)
        XCTAssertFalse(isValid)
    }
    
    func testIsValidHeightTrueCase() {
        // 3단 이상의 계단 높이
        let height = 5
        let isValid = inputCheck.isValid(height: height)
        XCTAssertTrue(isValid)
    }
    
    func testIsValidHeightFalseCase() {
        // 3단 미만의 계단 높이
        let height = 2
        let isValid = inputCheck.isValid(height: height)
        XCTAssertFalse(isValid)
    }

}
