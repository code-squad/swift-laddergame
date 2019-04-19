//
//  LadderGameTests.swift
//  LadderGameTests
//
//  Created by Daheen Lee on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class LadderGameTests: XCTestCase {
    let height: Int = 5
    let playerNames: [String] = ["Diana", "Kate", "Chloe", "Hannah"]
    var ladderGame: LadderGame!
    var numberOfPlayers: Int!
    var ladder: Ladder!
    
    override func setUp() {
        super.setUp()
        ladderGame = LadderGame(height: height, playerNames: playerNames)
        ladder = ladderGame.buildLadder()
        numberOfPlayers = playerNames.count
    }

    override func tearDown() {
        ladderGame = nil
        ladder = nil
        numberOfPlayers = nil
        super.setUp()
    }
    
    func testValidStepType() {
        let randomRowIndex = Int.random(in: 0..<height)
        let randomRowOfLadder = ladder[randomRowIndex]
        
        for step in randomRowOfLadder {
            XCTAssertTrue(step.exists == true || step.exists == false, "getRandomStep이 Bool type을 return하지 않습니다.")
        }
    }
    
    func testBuildedLadderHasDesiredStepsInRow() {
        // given
        let desiredStepCount = numberOfPlayers - 1
        // when
        let randomRowIndex = Int.random(in: 0..<height)
        let randomRowOfLadder = ladder[randomRowIndex]
        // then
        XCTAssertEqual(randomRowOfLadder.count, desiredStepCount)
    }
    
    func testInvalidSuccessiveStepsInRow() {
        let randomRowIndex = Int.random(in: 0..<height)
        let randomRowOfLadder: [LadderStep] = ladder[randomRowIndex]
        
        for i in 1..<randomRowOfLadder.count {
            let leftStep = randomRowOfLadder[i-1]
            let rightStep = randomRowOfLadder[i]
            XCTAssertFalse(leftStep.exists && rightStep.exists, "step이 연속으로 존재할 수 없습니다.")
        }
    }
    
    func testBuildedLadderInDesiredHeight() {
        let heightOfBuildedLadder = ladder.count
        XCTAssertEqual(heightOfBuildedLadder, height)
    }
    
    func testLadderPlayerCreatedWithDesiredNames() {
        let namesInLadderPlayer: [String] = ladderGame.players.map { player in player.name }
        
        XCTAssertEqual(namesInLadderPlayer, playerNames)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
