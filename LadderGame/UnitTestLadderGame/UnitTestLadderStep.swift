//
//  UnitTestLadderStep.swift
//  UnitTestLadderGame
//
//  Created by 조재흥 on 2018. 10. 1..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class UnitTestLadderStep: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBringStepInfo() {
        let broughtSteoInfo = LadderStep().bringStepInfo()
        let isCorrectInfo = (broughtSteoInfo == [true : "-----", false : "     "])
        XCTAssertTrue(isCorrectInfo)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
