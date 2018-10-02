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

    var ladderGameDTO : LadderGameDTO?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let maxHeight = 5
        let names = "pobi,honux,crong,jk"
        ladderGameDTO = LadderGame(height: maxHeight, names: names).getLadderGameDTO()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLadderGameDTONotNil() {
        XCTAssertNotNil(ladderGameDTO)
    }
    
    func testPlayerNamesSepartedProperly() {
        let playerNames = ladderGameDTO!.playerNames
        let namesSeparated = ["pobi","honux","crong","jk"]
        XCTAssertEqual(playerNames, namesSeparated, "Names are NOT separated properly")
    }
    
    func testLadderHasNoConnectedStep() {
        let ladder = ladderGameDTO!.ladder
        for row in ladder {
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
