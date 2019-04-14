//
//  UnitTesTLaddeRGame.swift
//  UnitTesTLaddeRGame
//
//  Created by cushy k on 13/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class UnitTesTLaddeRGame: XCTestCase {

    var ladderGame: LadderGame!
    var ladderPlayer: LadderPlayer!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        ladderPlayer = LadderPlayer(names: ["nori","jamie","justin","drake"])
        ladderGame = LadderGame(people: ladderPlayer, height: 5)

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
//
//        XCTAssertEqual(ladderPlayers.names, ["nori"])
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
