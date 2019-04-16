//
//  LadderGameTest.swift
//  LadderGameTest
//
//  Created by jang gukjin on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class LadderGameTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLadderStep(){
        let element = [LadderPlayer(player: "a"),LadderPlayer(player: "b")]
        let ladderStep = LadderStep()
        XCTAssertEqual(ladderStep.makeLayerOfLadder(players: element).count, 1)
    }
}
