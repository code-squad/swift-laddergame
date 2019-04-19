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
    var numberOfPlayers: Int!
    var ladderGame: LadderGame!
    
    override func setUp() {
        super.setUp()
        ladderGame = LadderGame(height: height, playerNames: playerNames)
        numberOfPlayers = playerNames.count
    }

    override func tearDown() {
        ladderGame = nil
        numberOfPlayers = nil
        super.setUp()
    }
    
    func testValidStepType() {
        let randomStep = ladderGame.getRandomStep()
        XCTAssertTrue(randomStep == true || randomStep == false, "getRandomStep이 Bool type을 return하지 않습니다.")
    }
    
    func testStepsCreatedUsingNumberOfPlayers() {
        // given
        let numberOfPlayers = playerNames.count
        let stepCountInRow = numberOfPlayers - 1
        // when
        let stepsInRow = ladderGame.createStepsInRow(for: numberOfPlayers)
        // then
        XCTAssertEqual(stepsInRow.count, stepCountInRow)
    }
    
    func testInvalidSuccessiveStepsInRow() {
        let numberOfPlayers = playerNames.count
        let stepsInRow: [LadderStep] = ladderGame.createStepsInRow(for: numberOfPlayers)
        
        for i in 1..<stepsInRow.count {
            let leftStep = stepsInRow[i-1]
            let rightStep = stepsInRow[i]
            XCTAssertFalse(leftStep.exists && rightStep.exists, "step이 연속으로 존재할 수 없습니다.")
        }
    }
    
    func testBuildedLadderInDesiredHeight() {
        let ladder = ladderGame.buildLadder()
        let heightOfBuildedLadder = ladder.count
        XCTAssertEqual(heightOfBuildedLadder, height)
    }

    func testBuildedLadderHasDesiredStepsInRow() {
        let ladder = ladderGame.buildLadder()
        let numberOfStepsInRow = ladder[0].count
        let desiredStepCount = playerNames.count - 1
     
        XCTAssertEqual(numberOfStepsInRow, desiredStepCount)
    }
    
    func testLadderPlayerCreatedWithDesiredNames() {
        let namesInLadderPlayer = ladderGame.players.map { player in player.name }
        
        XCTAssertEqual(namesInLadderPlayer, playerNames)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
