//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by TaeHyeonLee on 2017. 10. 24..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest

@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    
    var ladderGame : LadderGame!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        ladderGame = LadderGame.init(height: 6
            , names: [LadderPlayer.init(name: "jake")
                , LadderPlayer.init(name: "jk")
                , LadderPlayer.init(name: "j")
                , LadderPlayer.init(name: "honux")
                , LadderPlayer.init(name: "pobi")
            ])
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLadderLayer() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(ladderGame.names[0].name, "jake")
    }
    
}
