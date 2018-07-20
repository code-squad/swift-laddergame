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
    
    func testDisplay(){
        // Pass Cases
        
        var result = Result(element: [[true, false], [false, true]],
                             applicants: [LadderPlayer(name: "asdfg"), LadderPlayer(name: "asdfg"), LadderPlayer(name: "asd")])
        var displayForm = result.generateDisplayForm().joined()
        var expectedDisplayForm = ["   |-----|     |",
                                   "   |     |-----|",
                                   " asdfg asdfg  asd "].joined()
        XCTAssertEqual(displayForm, expectedDisplayForm, "정상적인 출력 값이 아닙니다.")
        
        result = Result(element: [[false]],
                             applicants: [LadderPlayer(name: "tst"), LadderPlayer(name: "tst")])
        displayForm = result.generateDisplayForm().joined()
        expectedDisplayForm = ["   |     |",
                               "  tst   tst "].joined()
        XCTAssertEqual(displayForm, expectedDisplayForm, "정상적인 출력 값이 아닙니다.")
        
        result = Result(element: [[true, false]],
                             applicants: [LadderPlayer(name: "a"), LadderPlayer(name: "asdfg"), LadderPlayer(name: "as")])
        displayForm = result.generateDisplayForm().joined()
        expectedDisplayForm = ["   |-----|     |",
                               "   a   asdfg  as  "].joined()
        XCTAssertEqual(displayForm, expectedDisplayForm, "정상적인 출력 값이 아닙니다.")
        
        result = Result(element: [[true, false, false], [false, false, true], [true, false, true]],
                             applicants: [LadderPlayer(name: "as"), LadderPlayer(name: "asd"), LadderPlayer(name: "asdf"), LadderPlayer(name: "a")])
        displayForm = result.generateDisplayForm().joined()
        expectedDisplayForm = ["   |-----|     |     |",
                               "   |     |     |-----|",
                               "   |-----|     |-----|",
                               "  as    asd  asdf    a  "].joined()
        XCTAssertEqual(displayForm, expectedDisplayForm, "정상적인 출력 값이 아닙니다.")
        
        // Fail Cases
        
        result = Result(element: [[true, false], [false, true]],
                                 applicants: [LadderPlayer(name: "asd"), LadderPlayer(name: "asdfg"), LadderPlayer(name: "asd")])
        displayForm = result.generateDisplayForm().joined()
        expectedDisplayForm = ["   |-----|     |",
                               "   |     |-----|",
                               " asd asdfg  asd "].joined()
        XCTAssertEqual(displayForm, expectedDisplayForm, "정상적인 출력 값이 아닙니다.")
        
        result = Result(element: [[true]],
                                 applicants: [LadderPlayer(name: "tst"), LadderPlayer(name: "tst")])
        displayForm = result.generateDisplayForm().joined()
        expectedDisplayForm = ["   |----|",
                               "  tst   tst "].joined()
        XCTAssertEqual(displayForm, expectedDisplayForm, "정상적인 출력 값이 아닙니다.")
        
        result = Result(element: [[false, false]],
                                 applicants: [LadderPlayer(name: "asdf"), LadderPlayer(name: "asdfg"), LadderPlayer(name: "as")])
        displayForm = result.generateDisplayForm().joined()
        expectedDisplayForm = ["   |     |     |",
                               "  asdf asdfg  as  "].joined()
        XCTAssertEqual(displayForm, expectedDisplayForm, "정상적인 출력 값이 아닙니다.")
        
        result = Result(element: [[false, true, false], [false, false, true], [true, false, true]],
                                 applicants: [LadderPlayer(name: "asdfg"), LadderPlayer(name: "asd"), LadderPlayer(name: "asdf"), LadderPlayer(name: "a")])
        displayForm = result.generateDisplayForm().joined()
        expectedDisplayForm = ["   |     |-----|     |",
                               "   |     |     |-----|",
                               "   |-----|     |-----|",
                               "asdfg   asd  asdf    a  "].joined()
        XCTAssertEqual(displayForm, expectedDisplayForm, "정상적인 출력 값이 아닙니다.")
    }
}
