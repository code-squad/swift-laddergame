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
        let alignText = AlignText()
        
        XCTAssertEqual(alignText.alignName(beforeAlignName: LadderPlayer(player: "lily")), "lily ")
        XCTAssertEqual(alignText.alignName(beforeAlignName: LadderPlayer(player: "li")), " li  ")
        XCTAssertEqual(alignText.alignName(beforeAlignName: LadderPlayer(player: "lilly")), "lilly")
    }
    
    /// 입력한 문자열을 인자로 플레이어의 이름이 5글자 이하인지 판단하는 테스트
    func testDistinctText(){
        let distinctNameAndHeight = DistinctNameAndHeight()
        
        XCTAssertThrowsError(try distinctNameAndHeight.errorJudgmentName(invertStringNames: "helloworld"))
        XCTAssertThrowsError(try distinctNameAndHeight.errorJudgmentName(invertStringNames: "hehishim,she"))
        XCTAssertNoThrow(try distinctNameAndHeight.errorJudgmentName(invertStringNames: "hello,i,you"))
    }
    
    /// 입력에 대한 에러를 판단하는 테스트
    func testDistinctName(){
        let distinctNameAndHeight = DistinctNameAndHeight()
        
        XCTAssertThrowsError(try distinctNameAndHeight.inputName(inputText: nil))
        XCTAssertNoThrow(try distinctNameAndHeight.inputName(inputText: "names,play"))
    }
    
    /// 입력된 사다리의 높이를 판단하는 테스트
    func testDistinctHeight(){
        let distinctNameAndHeight = DistinctNameAndHeight()
        
        XCTAssertThrowsError(try distinctNameAndHeight.inputHeight(inputText: "8.8"))
        XCTAssertThrowsError(try distinctNameAndHeight.inputHeight(inputText: "d"))
        XCTAssertNoThrow(try distinctNameAndHeight.inputHeight(inputText: "6"))
    }
    
    /// 리턴된 타입 테스트 (LadderPlayer)
    func testCorrectTypeLadderPlayer(){
        let ladderPlayer = LadderPlayer(player: "aiden")
        
        XCTAssertTrue(ladderPlayer is LadderPlayer)
        XCTAssertFalse(ladderPlayer is String)
    }
    
    /// 리턴된 타입 테스트 (LadderStep)
    func testCorrectTypeBoolLadderStep(){
        let element = [LadderPlayer(player: "aiden"),LadderPlayer(player: "lily")]
        let ladderStep = LadderStep()
        
        XCTAssertTrue(ladderStep.makeLayerOfLadder(players: element) is [Bool])
        XCTAssertFalse(ladderStep.makeLayerOfLadder(players: element) is [Int])
        XCTAssertFalse(ladderStep.makeLayerOfLadder(players: element) is Bool)
    }
    
    /// 리턴된 타입 테스트 (LadderGame)
    func testCorrectTypeBoolLadderGame(){
        let element = [LadderPlayer(player: "aiden"),LadderPlayer(player: "lily")]
        let ladderGame = LadderGame(players: element, ladderHeight: 3)
        
        XCTAssertTrue(ladderGame.makeLadder(ladderInfo: ladderGame) is [[Bool]])
        XCTAssertFalse(ladderGame.makeLadder(ladderInfo: ladderGame) is [Bool])
        XCTAssertFalse(ladderGame.makeLadder(ladderInfo: ladderGame) is Bool)
    }
    
    /// 사람에 따른 사다리의 가로 간격 갯수 테스트 (LadderStep)
    func testRowLadderCount(){
        let element = [LadderPlayer(player: "aiden"),LadderPlayer(player: "lily")]
        let element2 = [LadderPlayer(player: "aiden"),LadderPlayer(player: "lily"),LadderPlayer(player: "JJANY")]
        let ladderStep = LadderStep()
        
        XCTAssertEqual(ladderStep.makeLayerOfLadder(players: element).count, 1)
        XCTAssertEqual(ladderStep.makeLayerOfLadder(players: element2).count, 2)
    }
    
    /// 입력에 따른 사다리의 높이를 테스트 (LadderGame)
    func testHeightCount(){
        let element = [LadderPlayer(player: "aiden"),LadderPlayer(player: "lily")]
        let ladderGame = LadderGame(players: element, ladderHeight: 3)
        let ladderGame2 = LadderGame(players: element, ladderHeight: 5)
        
        XCTAssertEqual(ladderGame.makeLadder(ladderInfo: ladderGame).count, 3)
        XCTAssertEqual(ladderGame.makeLadder(ladderInfo: ladderGame2).count, 5)
    }
}
