//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by CHOMINJI on 17/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestLadderGame: XCTestCase {
    
    var players: [LadderPlayer]!
    var ladderGame: LadderGame!
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        players = [ LadderPlayer(name: "ming"),
                    LadderPlayer(name: "mindy"),
                    LadderPlayer(name: "yagom"),
                    LadderPlayer(name: "jk")]
        
       ladderGame = LadderGame.init(names: players, height: 8)
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        players = nil
        ladderGame = nil
    }
    
    func testLadderGamePlayerNotEqual() {
        
        XCTAssertEqual(players.count, ladderGame.numberOfPlayer, "게임의 플레이어 수와 생성된 플레이어 수가 다릅니다.")
    }
    
    func testInitLadderFloor() {
        
        let playerCount = 5
        let stepCount = 5 - 1
        
        let ladderFloor = LadderFloor.init(numberOfPlayer: playerCount)
        
        XCTAssertEqual(ladderFloor.steps.count, stepCount, "플레이어만큼 생성이 안됐습니다.")
    }
    
    func testLadderHeightIsEqualToFloors() {
    
        let ladder = Ladder.init(numberOfPlayer: 5, ladderHeight: 8)
        
        XCTAssertEqual(ladder.floors.count, 8, "Height와 사다리의 층 수가 다릅니다.")
    }
    
    func testLadderHeightWhenZero() {
        let ladder = Ladder.init(numberOfPlayer: 8, ladderHeight: 0)
        XCTAssertEqual(ladder.floors.count, 0, "0이 아닙니다.")
    }
    
    func testLadderGameComputeCorrectLadderHeight() {
        
        let ladderGame = LadderGame.init(names: players, height: 7)
        
        XCTAssertEqual(ladderGame.ladder.floors.count, 7, "heigth와 사다리의 층수가 다릅니다.")
    }
    
    func testStepExist() {
        
        let limit = 100
        var step: [LadderStep] = []
        
        for _ in 0...limit {
            step.append(LadderStep.init())
        }
    
        let existStep = step.contains(where: { (exist) -> Bool in
            return exist.hasStep == true
        })
        
        XCTAssertEqual(existStep, true, "발판이 없습니다~~!~!")
    }
    
    func testSerialStepInFloor() {
        
        let floor = LadderFloor.init(numberOfPlayer: 5)
        
        for current in 1..<floor.steps.count {
            let previous = current - 1
            let currentHasStep = floor.steps[current].hasStep
            let previousHasStep = floor.steps[previous].hasStep
            guard previousHasStep == false else {
                return
            }
            
            XCTAssertNotEqual(previousHasStep, currentHasStep, "스텝이 연속해서 나옵니다.")
        }
    }
    
}
