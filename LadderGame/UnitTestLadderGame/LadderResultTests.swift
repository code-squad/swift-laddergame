//
//  LadderResultTests.swift
//  UnitTestLadderGame
//
//  Created by 이동건 on 19/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class LadderResultTests: XCTestCase {
    
    private var element:[[Bool]]!
    private var applicants: [LadderPlayer]!
    private var result: Result!
    
    override func setUp() {
        element = [[false,true], [true, false]]
        applicants = [LadderPlayer(name: "tst"), LadderPlayer(name: "tst")]
        result = Result(element: element, applicants: applicants)
    }

    override func tearDown() {
        element = nil
        applicants = nil
        result = nil
    }
    
    func testInitializer(){
        XCTAssertNoThrow(Result(element: element, applicants: applicants), "초기화 실패")
    }
    
    func testDisplay(){
        result.display()
    }
}
