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
    var anotherladderGame: LadderGame!
    var newladderGameInfo: LadderGameInfo!
    
    override func setUp() {
        super.setUp()
        
        ladderGameInfo = LadderGameInfo(nameOfPlayer: "pobi,honux,crong,jk", names: [], height: 5)
        
        newladderGameInfo = InputView.seperateNameOfPlayers(ladderGameInfo: ladderGameInfo)
        ladderGame = LadderGame(ladderGameInfo: ladderGameInfo)
        anotherladderGame = LadderGame(ladderGameInfo: newladderGameInfo)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLadderGameIsMakingLandomValue(){
        XCTAssertNotNil(ladderGame.randomValue)
    }
    
    func testLadderGameIsMakingNewRandomValue(){
        let randomValue = ladderGame.randomValue
        let anotherRandomValue = anotherladderGame.randomValue
        
        let firstValue = randomValue.flatMap({$0}).map({(value: Int) -> Int in return Int(pow(2.0, Double(value)))}).reduce(0){$0+$1}
        let secondValue = anotherRandomValue.flatMap({$0}).map({(value: Int) -> Int in return Int(pow(2.0, Double(value)))}).reduce(0){$0+$1}
        XCTAssertNotEqual(firstValue, secondValue, "not equal random value")
    }
    
    func testPerformanceExample() {

    }
    
}
