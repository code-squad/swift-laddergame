//
//  LadderResultTests.swift
//  UnitTestLadderGame
//
//  Created by 이동건 on 19/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class LadderResultTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {

    }
    
    func testInitializer(){
        let element = [[false, true]]
        let applicants = [LadderPlayer(name: "tst"), LadderPlayer(name: "tst")]
        XCTAssertNoThrow(Result(element: element, applicants: applicants), "초기화 실패")
    }
    
    func testDisplayPassCase(){
        let result = Result(element: [[true, false], [false, true]],
                             applicants: [LadderPlayer(name: "asdfg"), LadderPlayer(name: "asdfg"), LadderPlayer(name: "asd")])
        let displayForm = result.generateDisplayForm().joined()
        let expectedDisplayForm = ["   |-----|     |",
                                   "   |     |-----|",
                                   " asdfg asdfg  asd "].joined()
        XCTAssertEqual(displayForm, expectedDisplayForm, "정상적인 출력 값이 아닙니다.")
    }
    
    func testDisplayFailCase(){
        let result = Result(element: [[false, true, false], [false, false, true], [true, false, true]],
                        applicants: [LadderPlayer(name: "asdfg"), LadderPlayer(name: "asd"), LadderPlayer(name: "asdf"), LadderPlayer(name: "a")])
        let displayForm = result.generateDisplayForm().joined()
        let expectedDisplayForm = ["   |     |-----|     |",
                                   "   |     |     |-----|",
                                   "   |-----|     |-----|",
                                   "asdfg   asd  asdf    a  "].joined()
        XCTAssertEqual(displayForm, expectedDisplayForm, "정상적인 출력 값이 아닙니다.")
    }
}
