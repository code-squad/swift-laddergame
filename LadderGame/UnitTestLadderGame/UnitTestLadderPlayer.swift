//
//  UnitTestLadderPlayer.swift
//  UnitTestLadderGame
//
//  Created by TaeHyeonLee on 2017. 10. 26..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest

@testable import LadderGame

class UnitTestLadderPlayer: XCTestCase {
    
    var ladderPlayer : LadderPlayer!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        ladderPlayer = LadderPlayer.init(name: "tester")
    }
    
    func testInitializer() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(ladderPlayer.name, "tester")
    }
}
