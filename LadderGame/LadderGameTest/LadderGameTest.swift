//
//  LadderGameTest.swift
//  LadderGameTest
//
//  Created by jang gukjin on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class LadderGameTest: XCTestCase {
    /// 플레이어의 이름을 정제해주는 함수 테스트
    func testAlignName(){
        let resultView = ResultView()
        XCTAssertTrue(resultView.alignName(beforeAlignName: LadderPlayer(player: "lily")).count == 5)
    }
    /// 입력에 대한 에러를 판단하는 테스트
    func testDistinctNameAndHeight(){
        let distinctNameAndHeight = DistinctNameAndHeight()
        
        XCTAssertThrowsError(try distinctNameAndHeight.errorJudgmentName(invertStringNames: "helloworld"))
        XCTAssertThrowsError(try distinctNameAndHeight.inputName(inputText: nil))
        XCTAssertThrowsError(try distinctNameAndHeight.inputHeight(inputText: "d"))
    }
    
    /// 리턴된 타입 테스트
    func testCorrectType(){
        let element = [LadderPlayer(player: "aiden"),LadderPlayer(player: "lily")]
        let ladderPlayer = LadderPlayer(player: "aiden")
        let ladderStep = LadderStep()
        let ladderGame = LadderGame(players: element, ladderHeight: 3)
        
        XCTAssertTrue(ladderPlayer is LadderPlayer)
        XCTAssertTrue(ladderStep.makeLayerOfLadder(players: element) is [Bool])
        XCTAssertTrue(ladderGame.makeLadder(ladderInfo: ladderGame) is [[Bool]])
    }
    /// 사람에 따른 사다리의 가로 간격 갯수와 높이를 테스트
    func testPlayerAndHeightCount(){
        let element = [LadderPlayer(player: "aiden"),LadderPlayer(player: "lily")]
        let ladderStep = LadderStep()
        let ladderGame = LadderGame(players: element, ladderHeight: 3)
        
        XCTAssertEqual(ladderStep.makeLayerOfLadder(players: element).count, 1)
        XCTAssertEqual(ladderGame.makeLadder(ladderInfo: ladderGame).count, 3)
        XCTAssertEqual(ladderGame.makeLadder(ladderInfo: ladderGame)[0].count, 1)
    }
    ///
}
