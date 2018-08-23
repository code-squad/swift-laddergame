//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by KIMMINSIK on 2018. 8. 22..
//  Copyright © 2018년 KIMMINSIK. All rights reserved.
//

import XCTest
@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    
    var testLadderGame: LadderGame!

    override func setUp() {
        super.setUp()
        testLadderGame = LadderGame.init(input: (["jobs","zombi","etux"], 5))
    }
    
    override func tearDown() {
        super.tearDown()
        testLadderGame = nil
    }
    
    func testLadderGam() {
         XCTAssertNotNil(testLadderGame)
    }
    
    func testMakeLadderElements() {
        let makeLadderElements = testLadderGame.makeLadderElements()
        XCTAssertNotNil(makeLadderElements)
    }
    
    func testInputIsSucess() {
        let player = ["jobs","zombi","etux"]
        let height = 5
        XCTAssertNotNil(LadderGame.init(input: (player, height)))
    }
    
    func testIsFailBecauseOfNonexistentHeight() {
        let player = ["jobs","zombi","etux"]
        let height = 0
        XCTAssertNotNil(LadderGame.init(input: (player, height)))
    }

    func testIsFailBecauseOfFewerPlayer() {
        let fewerPlayer = ["jobs"]
        let height = 5
        XCTAssertNotNil(LadderGame.init(input: (fewerPlayer, height)))
    }
    
    func testIsFailBecauseOfManyPlayer() {
       
        let manyPlayer = ["jobs","zombi","etux","JK","KJ","JKKJ"]
        let height = 5
        XCTAssertNotNil(LadderGame.init(input: (manyPlayer, height)))
    }
}
