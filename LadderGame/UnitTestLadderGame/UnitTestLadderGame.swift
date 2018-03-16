//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by rhino Q on 2018. 3. 16..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
/* 사다리 step4
 1. Input.validCheck()
 
 2. LadderGame 초기화 후
 
 2.1 - LadderGame.names
 
 2.2 - LadderGame.heightOfLadder
 */
import XCTest
@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    var ladderGame:LadderGame!
    var players = [LadderPlayer]()
    var input:Input!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let names = ["linseang","rhino","mason","drake"]
        let heightOfLadder = 5
        ladderGame = LadderGame(names, heightOfLadder)
        
        for name in names {
            players.append(LadderPlayer(name: name))
        }
        
        input = Input()
    }
    
    func testLadderGameValues(){
        XCTAssertEqual(ladderGame.heightOfLadder, 5, "should be equal")
        for i in 0..<players.count {
            XCTAssertEqual(ladderGame.names[i].name, players[i].name, "should be eaual")
        }
    }
    
    func test_validChecker_checkHeight(){
        XCTAssertEqual(ValidChecker.checkHeight(nil), 0, "should be 0")
        XCTAssertEqual(ValidChecker.checkHeight(""), 0, "should be 0")
        XCTAssertEqual(ValidChecker.checkHeight("sdf"), 0, "should be 0")
        XCTAssertEqual(ValidChecker.checkHeight("1"), 1, "should be 1")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
