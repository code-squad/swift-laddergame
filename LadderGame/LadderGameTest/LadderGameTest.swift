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
    /// 한층의 사다리를 만드는 함수 테스트
    func testLadderStep(){
        let element = [LadderPlayer(player: "aiden"),LadderPlayer(player: "lily")]
        let ladderStep = LadderStep()
        XCTAssertEqual(ladderStep.makeLayerOfLadder(players: element).count, 1)
        XCTAssertTrue(ladderStep.makeLayerOfLadder(players: element) is [Bool])
    }
    /// 사다리의 전체 층을 만드는 함수 테스트
    func testLadderGame(){
        let element = [LadderPlayer(player: "aiden"),LadderPlayer(player: "lily")]
        let ladderGame = LadderGame(players: element, ladderHeight: 3)
        XCTAssertEqual(ladderGame.makeLadder(ladderInfo: ladderGame).count, 3)
        XCTAssertTrue(ladderGame.makeLadder(ladderInfo: ladderGame) is [[Bool]])
        XCTAssertEqual(ladderGame.makeLadder(ladderInfo: ladderGame)[0].count, 1)
    }
    /// 플레이어의 이름을 정제해주는 함수 테스트
    func testAlignName(){
        let resultView = ResultView()
        XCTAssertTrue(resultView.alignName(beforeAlignName: LadderPlayer(player: "lily")).count == 5)
    }
}
