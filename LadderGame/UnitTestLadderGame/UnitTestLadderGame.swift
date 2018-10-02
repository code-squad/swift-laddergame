//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by 윤지영 on 01/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    
    let namesAllowed = "cat,dog,bird"
    let namesAllowedSeparated = ["cat","dog","bird"]
    
    let noName = ","
    let namesNotAllowed = "rabbit,dog,bird"
    let namesNotAllowedInitialized = [""]
    
    let heightAllowed = "5"
    
    let heightNotAllowedCuzChar = "a"
    let heightNotAllowedCuzNeg = "-1"
    let heightNotAllowedInitialized = 2

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNamesInitializedWhenNoName() {
        let ladderGameDTO = LadderGame(height: heightAllowed, names: noName).getLadderGameDTO()
        XCTAssertEqual(ladderGameDTO.playerNames, namesNotAllowedInitialized)
    }
    
    func testNamesInitializedWhenNameIsOutOfLength() {
        let ladderGameDTO = LadderGame(height: heightAllowed, names: namesNotAllowed).getLadderGameDTO()
        XCTAssertEqual(ladderGameDTO.playerNames, namesNotAllowedInitialized)
    }
    
    func testPlayerNamesSepartedProperly() {
        let ladderGameDTO = LadderGame(height: heightAllowed, names: namesAllowed).getLadderGameDTO()
        XCTAssertEqual(ladderGameDTO.playerNames, namesAllowedSeparated, "Names are NOT separated properly")
    }
    
    func testHeightInitializedWhenNotInt() {
        let ladderGameDTO = LadderGame(height: heightNotAllowedCuzChar, names: namesAllowed).getLadderGameDTO()
        XCTAssertEqual(ladderGameDTO.ladder.count, heightNotAllowedInitialized)
    }
    
    func testHeightInitializedWhenLessThanTwo() {
        let ladderGameDTO = LadderGame(height: heightNotAllowedCuzNeg, names: namesAllowed).getLadderGameDTO()
        XCTAssertEqual(ladderGameDTO.ladder.count, heightNotAllowedInitialized)
    }
    
    func testLadderHasNoConnectedStep() {
        let ladderGameDTO = LadderGame(height: heightAllowed, names: namesAllowed).getLadderGameDTO()
        print(ladderGameDTO)
        for row in ladderGameDTO.ladder {
            for index in 1...row.count-1 {
                XCTAssertFalse(row[index-1].step && row[index].step, "Step is connected to previous one")
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
