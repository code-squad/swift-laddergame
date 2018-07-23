//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by oingbong on 2018. 7. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
import Foundation

@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    
//    func testMain(){
//        XCTAssertNoThrow(main())
//    }
    
    func testswitchHaveLadderValue_Pass(){
        let value = switchHaveLadderValue(value: 0)
        XCTAssertEqual(1, value)
    }
    
    func testVerifyDuplication_Pass(){
        let haveLadderStep:LadderStep = LadderStep.have
        let noneLadderStep:LadderStep = LadderStep.none
        let verifyDuplicateStep:LadderStep = verifyDuplication(first: haveLadderStep, second: noneLadderStep, select: 1)
        XCTAssertEqual(haveLadderStep, verifyDuplicateStep)
    }
    
    func testVerifyDuplication_Fail(){
        let haveLadderStep:LadderStep = LadderStep.have
        let noneLadderStep:LadderStep = verifyDuplication(first: haveLadderStep, second: haveLadderStep, select: 1)
        XCTAssertNotEqual(haveLadderStep, noneLadderStep)
    }
    
    /*
     testMakeStep_Fail , testMakeLadder_Fail은
     XCTAssertEqual을 하게 되면 일정 확률로 Success or Fail 이 뜨게 됩니다.
     랜덤함수는 현재 구조에서는 테스트를 진행하기 힘들며 구조적으로 변경이 필요합니다.
     의존성 관련된 내용을 통해 랜덤함수를 사용하더라도 테스트할 때는 내가 원하는 모양을
     테스트 할 수 있게 됩니다.
     추후 배우게 될 내용이므로 이번 단계에서는 에러 안나는지 정도만 확인하고 해당 부분과
     관련된 내용에 대해 필요성을 느끼고 이해하도록 합니다.
     */
    
    // 한층에 사다리 중복 되는지 확인
    func testMakeStep_Fail(){
        var ladderStep:Array<LadderStep> = Array<LadderStep>()
        ladderStep.append(LadderStep.default)
        ladderStep.append(LadderStep.have)
        ladderStep.append(LadderStep.have)
        
        XCTAssertNotEqual(makeStep(elements: 3), ladderStep)
    }
    
    // 연속으로 사다리 중복 되는지 확인
    func testMakeLadder_Fail(){
        var ladderSteps1:Array<LadderStep> = Array<LadderStep>()
        ladderSteps1.append(LadderStep.default)
        ladderSteps1.append(LadderStep.have)
        ladderSteps1.append(LadderStep.have)
        var ladderSteps2:Array<LadderStep> = Array<LadderStep>()
        ladderSteps2.append(LadderStep.default)
        ladderSteps2.append(LadderStep.have)
        ladderSteps2.append(LadderStep.have)
        var ladderStepTotal:[[LadderStep]] = [[LadderStep]]()
        ladderStepTotal.append(ladderSteps1)
        ladderStepTotal.append(ladderSteps2)
        
        let player1 = LadderPlayer.init(name: "oing1")
        let player2 = LadderPlayer.init(name: "oing2")
        var players:Array<LadderPlayer> = Array<LadderPlayer>()
        players.append(player1)
        players.append(player2)
        let ladderGame = LadderGame.init(names: players, height: 3)
        XCTAssertNotEqual(makeLadder(elements: ladderGame), ladderStepTotal)
    }
    
    // 높이가 0 인 경우 - makeLadder에서 반복문에 포함되지 않기 때문에
    // 에러 발생하지 않고 출력되지도 않습니다.
//    func testMakeLadder_height0_Fail(){
//        var players:Array<LadderPlayer> = Array<LadderPlayer>()
//        let player1 = LadderPlayer.init(name: "oing1")
//        let player2 = LadderPlayer.init(name: "oing2")
//        players.append(player1)
//        players.append(player2)
//        let ladderGame = LadderGame.init(names: players, height: 0)
//    }
    
    // 플레이어가 비어 있는 경우 - 입력받을 때만 비어 있는지 확인하기 때문에
    // 현재 구조상 테스트에서는 에러를 발생시킵니다.
//    func testMakeLadder_emptyPlayers_Fail(){
//        var players:Array<LadderPlayer> = Array<LadderPlayer>()
//        let ladderGame = LadderGame.init(names: players, height: 3)
//    }
    
    func testHaveHorizontalLadder_Pass(){
        let haveLadderStep:LadderStep = LadderStep.have
        let ladderStep:LadderStep = haveHorizontalLadder(have: 1)
        XCTAssertEqual(haveLadderStep, ladderStep)
    }

    func testNoneHorizontalLadder_Pass(){
        let noneLadderStep:LadderStep = LadderStep.none
        let ladderStep:LadderStep = haveHorizontalLadder(have: 0)
        XCTAssertEqual(noneLadderStep, ladderStep)
    }

    func testHaveHorizontalLadder_Fail(){
        let haveLadderStep:LadderStep = LadderStep.have
        let ladderStep:LadderStep = haveHorizontalLadder(have: 3)
        XCTAssertNotEqual(haveLadderStep, ladderStep)
    }
    

}
