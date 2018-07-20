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
        
        let passResult1 = Result(element: [[true, false], [false, true]],
                             applicants: [LadderPlayer(name: "asdfg"), LadderPlayer(name: "asdfg"), LadderPlayer(name: "asd")])
        let displayForm1 = passResult1.generateDisplayForm().joined()
        let expectedDisplayForm1 = ["   |-----|     |",
                                    "   |     |-----|",
                                    " asdfg asdfg  asd "].joined()
        XCTAssertEqual(displayForm1, expectedDisplayForm1, "정상적인 출력 값이 아닙니다.")
        
        let passResult2 = Result(element: [[false]],
                             applicants: [LadderPlayer(name: "tst"), LadderPlayer(name: "tst")])
        let displayForm2 = passResult2.generateDisplayForm().joined()
        let expectedDisplayForm2 = ["   |     |",
                                    "  tst   tst "].joined()
        XCTAssertEqual(displayForm2, expectedDisplayForm2, "정상적인 출력 값이 아닙니다.")
        
        let passResult3 = Result(element: [[true, false]],
                             applicants: [LadderPlayer(name: "a"), LadderPlayer(name: "asdfg"), LadderPlayer(name: "as")])
        let displayForm3 = passResult3.generateDisplayForm().joined()
        let expectedDisplayForm3 = ["   |-----|     |",
                                    "   a   asdfg  as  "].joined()
        XCTAssertEqual(displayForm3, expectedDisplayForm3, "정상적인 출력 값이 아닙니다.")
        
        let passResult4 = Result(element: [[true, false, false], [false, false, true], [true, false, true]],
                             applicants: [LadderPlayer(name: "as"), LadderPlayer(name: "asd"), LadderPlayer(name: "asdf"), LadderPlayer(name: "a")])
        let displayForm4 = passResult4.generateDisplayForm().joined()
        let expectedDisplayForm4 = ["   |-----|     |     |",
                                    "   |     |     |-----|",
                                    "   |-----|     |-----|",
                                    "  as    asd  asdf    a  "].joined()
        XCTAssertEqual(displayForm4, expectedDisplayForm4, "정상적인 출력 값이 아닙니다.")
        
        // Fail Cases
        
        let failResult1 = Result(element: [[true, false], [false, true]],
                                 applicants: [LadderPlayer(name: "asd"), LadderPlayer(name: "asdfg"), LadderPlayer(name: "asd")])
        let displayForm5 = failResult1.generateDisplayForm().joined()
        let expectedDisplayForm5 = ["   |-----|     |",
                                    "   |     |-----|",
                                    " asd asdfg  asd "].joined()
        XCTAssertEqual(displayForm5, expectedDisplayForm5, "정상적인 출력 값이 아닙니다.")
        
        let failResult2 = Result(element: [[true]],
                                 applicants: [LadderPlayer(name: "tst"), LadderPlayer(name: "tst")])
        let displayForm6 = failResult2.generateDisplayForm().joined()
        let expectedDisplayForm6 = ["   |----|",
                                    "  tst   tst "].joined()
        XCTAssertEqual(displayForm6, expectedDisplayForm6, "정상적인 출력 값이 아닙니다.")
        
        let failResult3 = Result(element: [[false, false]],
                                 applicants: [LadderPlayer(name: "asdf"), LadderPlayer(name: "asdfg"), LadderPlayer(name: "as")])
        let displayForm7 = failResult3.generateDisplayForm().joined()
        let expectedDisplayForm7 = ["   |     |     |",
                                    "  asdf asdfg  as  "].joined()
        XCTAssertEqual(displayForm7, expectedDisplayForm7, "정상적인 출력 값이 아닙니다.")
        
        let failResult4 = Result(element: [[false, true, false], [false, false, true], [true, false, true]],
                                 applicants: [LadderPlayer(name: "asdfg"), LadderPlayer(name: "asd"), LadderPlayer(name: "asdf"), LadderPlayer(name: "a")])
        let displayForm8 = failResult4.generateDisplayForm().joined()
        let expectedDisplayForm8 = ["   |     |-----|     |",
                                    "   |     |     |-----|",
                                    "   |-----|     |-----|",
                                    "asdfg   asd  asdf    a  "].joined()
        XCTAssertEqual(displayForm8, expectedDisplayForm8, "정상적인 출력 값이 아닙니다.")
    }
}
