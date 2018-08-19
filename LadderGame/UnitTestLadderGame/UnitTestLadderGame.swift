//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by KIMMINSIK on 2018. 7. 31..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestLadderGame: XCTestCase {
    
    var ladderGameTest: LadderGame!
    
    override func setUp() {
    super.setUp()
        
    let players = ["KMS","JK","jobs","tux"]
    let height = 5
//  init(input: ([String], Int) )
    ladderGameTest = LadderGame.init(input: (players , height))
    }
    
    override func tearDown() {
    super.tearDown()
    ladderGameTest = nil
        
    
    func testLaddergame() {
        XCTAssertTrue(ladderGameTest)
    }
    
    func testMakeLadderElements() {
        let makeLadderElements = ladderGameTest.makeLadderElements()
        XCTAssertTrue(makeLadderElements)
    }
}
