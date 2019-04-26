//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by JieunKim on 24/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest
class UnitTestLadderGame: XCTestCase {

    func testInputGamePlayerNumberSucess(){
        let testplayer = [LadderPlayer(name: "ogi"),LadderPlayer(name: "kim"),LadderPlayer(name: "judy")]
        let ladderGame = LadderGame.init(players: testplayer, height: 4)

         XCTAssertEqual(3, ladderGame.numberOfPlayer,"notequalNumberOfPlayer")
    }
    
    func testInputGamePlayerNumberfail(){
        let testplayer = [LadderPlayer(name: "ogi"),LadderPlayer(name: "kim"),LadderPlayer(name: "judy")]
        let ladderGame = LadderGame.init(players: testplayer, height: 4)
        
        XCTAssertNotEqual(4, ladderGame.numberOfPlayer,"notequalNumberOfPlayer")
    }
    
    func testLadderFloor() {
        let playerCount = 3
        let stepCount = 3 - 1
        let ladderFloor = LadderFloor.init(numberOfPlayer: playerCount)
        
        XCTAssertEqual(ladderFloor.getSteps().count, stepCount, "notEqualFloor")
    }
    
    func testLadderHeight() {
        let testplayer = [LadderPlayer(name: "ogi"),LadderPlayer(name: "kim"),LadderPlayer(name: "judy")]
        let ladderGame = LadderGame.init(players: testplayer, height: 3)
        
        XCTAssertEqual(ladderGame.getPlayer().count, 3, "notEqualHeight")
    }
    
    func testConnectSteps() {
      
        let floor = LadderFloor.init(numberOfPlayer: 3)
        
        for current in 1..<floor.getSteps().count {
            let previous = current - 1
            let currentHasStep = floor.getSteps()[current].isConnceted
            
            let previousHasStep =
            floor.getSteps()[previous].isConnceted
            
            guard currentHasStep else {
                continue
            }
            
            if(previousHasStep){
              XCTAssertFalse(currentHasStep, "연속되게 |-|-| 가 올수없습니다.")}
        }
    }
    
    func testladderCorrectHeight() {
        
        let testplayer = [LadderPlayer(name: "ogi"),LadderPlayer(name: "kim"),LadderPlayer(name: "judy")]
        let ladderGame = LadderGame.init(players: testplayer, height: 7)
        
         XCTAssertEqual(ladderGame.ladder.getLayer().count, 7, "height와 사다리의 층수가 다릅니다.")
    }
  
}
