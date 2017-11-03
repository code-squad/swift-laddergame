//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by Eunjin Kim on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame
class UnitTestLadderGame: XCTestCase {
    var ladderGameInfo: LadderGameInfo!
    var inputView: InputView!
    var ladderGame: LadderGame!
    var newladderGameInfo: LadderGameInfo!
    
    override func setUp() {
        super.setUp()
        
        ladderGameInfo = LadderGameInfo(nameOfPlayer: "pobi,honux,crong,jk", names: [], height: 5)
        inputView = InputView()
        newladderGameInfo = inputView.seperateNameOfPlayers(ladderGameInfo: ladderGameInfo)
        ladderGame = LadderGame(ladderGameInfo: newladderGameInfo)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLadderGameIsMakingLandomValue(){
        XCTAssertNotNil(ladderGame.randomValue)
    }
    
    func testLadderGameIsMakingNewRandomValue(){
        ladderGame.makeRandomValue()
        var randomValue = ladderGame.randomValue
        ladderGame.makeRandomValue()
        var anotherRandomValue = ladderGame.randomValue
        for index in 0..<randomValue.count {
            XCTAssertEqual(randomValue[index], anotherRandomValue[index], "not equal random value")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
