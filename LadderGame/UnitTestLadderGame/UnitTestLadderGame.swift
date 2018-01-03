//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by 김수현 on 2018. 1. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestLadderGame: XCTestCase {
    
    var laddergameTest: LadderGame!
    
    override func setUp() {
        super.setUp()
        let height = 5
        let players = ["honux","jk","crong","pobi"]
        laddergameTest = LadderGame.init(height, players)
    }
    
    override func tearDown() {
        super.tearDown()
        laddergameTest = nil
    }
    
    func testLaddergame() {
        XCTAssertNotNil(laddergameTest)
    }
    
    func testInputPlayer() {
        XCTAssertNotNil(laddergameTest.name)
        XCTAssertEqual(laddergameTest.name.count, 4)
    }
    
    func testInputHeight() {
        XCTAssertNotNil(laddergameTest.height)
        XCTAssertEqual(laddergameTest.height, 5)
    }
}
