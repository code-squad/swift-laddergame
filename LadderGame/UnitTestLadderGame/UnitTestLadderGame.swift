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
    var ladderGameInfo2: LadderGameInfo!
    var ladderGame: LadderGame!
    var ladderGame2: LadderGame!
    var anotherladderGame: LadderGame!
    var anotherladderGame2: LadderGame!
    var newladderGameInfo: LadderGameInfo!
    var newladderGameInfo2: LadderGameInfo!
    
    override func setUp() {
        super.setUp()
        //test1-init(String, Int)
        ladderGameInfo = LadderGameInfo(nameOfPlayer: "pobi,honux,crong,jk", height: 5)
        newladderGameInfo = InputView.separateNameOfPlayers(ladderGameInfo: ladderGameInfo)
        ladderGame = LadderGame(ladderGameInfo: newladderGameInfo)
        anotherladderGame = LadderGame(ladderGameInfo: newladderGameInfo)
        
        //test2-init([LadderPlayer], Int)
        ladderGameInfo2 = LadderGameInfo(names: [LadderPlayer(name: "pobi"), LadderPlayer(name: "honux"), LadderPlayer(name: "crong"), LadderPlayer(name: "jk")], height: 5)
        newladderGameInfo2 = InputView.separateNameOfPlayers(ladderGameInfo: ladderGameInfo2)
        ladderGame2 = LadderGame(ladderGameInfo: newladderGameInfo2)
        anotherladderGame2 = LadderGame(ladderGameInfo: newladderGameInfo2)
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLadderGameIsMakingLandomValue(){
        XCTAssertNotNil(ladderGame.randomValue)
    }
    
    func testLadderGameIsMakingNewRandomValue(){
        //test1
        let randomValue = ladderGame.randomValue
        let anotherRandomValue = anotherladderGame.randomValue
        
        let firstValue = randomValue.flatMap({$0}).map({(value: Int) -> Int in return Int(pow(2.0, Double(value)))}).reduce(0){$0+$1}
        let secondValue = anotherRandomValue.flatMap({$0}).map({(value: Int) -> Int in return Int(pow(2.0, Double(value)))}).reduce(0){$0+$1}
        XCTAssertNotEqual(firstValue, secondValue, "not equal random value")
        
        //test2
        let randomValue2 = ladderGame.randomValue
        let anotherRandomValue2 = anotherladderGame.randomValue
        
        let firstValue2 = randomValue2.flatMap({$0}).map({(value: Int) -> Int in return Int(pow(2.0, Double(value)))}).reduce(0){$0+$1}
        let secondValue2 = anotherRandomValue2.flatMap({$0}).map({(value: Int) -> Int in return Int(pow(2.0, Double(value)))}).reduce(0){$0+$1}
        XCTAssertNotEqual(firstValue2, secondValue2, "not equal random value")
    }
    
    func testPerformanceExample() {

    }
    
}
