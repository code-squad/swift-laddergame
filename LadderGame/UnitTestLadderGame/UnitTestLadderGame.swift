//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by 윤동민 on 2018. 10. 11..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    
    var ladderGame : LadderGame!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        ladderGame = LadderGame()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        ladderGame = nil
    }
    
    // LadderGame() 구조체의 getLadderGameDTO() 메소드 테스트 --> Height 값 가져오는지
    func testgetLadderGameDTOHeight(){
        let ladderGameDTO : LadderGameDTO = ladderGame.getLadderGameDTO()
        
        XCTAssertEqual(ladderGameDTO.height, 0, "ladderGameDTO return is fault")
    }
    
    // LadderGame() 구조체의 getLadderGameDTO() 메소드 테스트 --> Names 값 가져오는지
    func testgetLadderGameDTONames(){
        let ladderGameDTO : LadderGameDTO = ladderGame.getLadderGameDTO()
        
        XCTAssertTrue(ladderGameDTO.names.isEmpty)
    }
    
    // LadderGame() 구조체의 getLadderGameDTO() 메소드 테스트 --> Ladder 값 가져오는지
    func testgetLadderGameDTOLadder(){
        let ladderGameDTO : LadderGameDTO = ladderGame.getLadderGameDTO()
        
        for rowLadder in ladderGameDTO.ladder{
            XCTAssertTrue(rowLadder.isEmpty)
        }
    }
    
    // LadderGame() 구조체의 setPlayerName() 메소드 테스트
    func testsetPlayerName(){
        let testNames : [LadderPlayer] = [LadderPlayer(name: "DM"), LadderPlayer(name: "AD"), LadderPlayer(name: "DO")]
        ladderGame.setPlayersName(playerNames: testNames)
        
        for player in ladderGame.getLadderGameDTO().names{
            XCTAssertTrue(player.playerName == "DM" || player.playerName == "AD" || player.playerName == "DO" )
        }
    }
    
    // LadderGame() 구조체의 setPLadderHeight() 메소드 테스트
    func testsetLadderHeight(){
        let testHeight : Int = 3
        ladderGame.setLadderHeight(ladderHeight: testHeight)
        
        XCTAssertEqual(ladderGame.getLadderGameDTO().height, testHeight)
    }
    
    // 사다리가 "-----"가 중복으로 생성되었는지 테스트
    func testisOverlapLadder(){
        let testNames : [LadderPlayer] = [LadderPlayer(name: "DM"), LadderPlayer(name: "AD"), LadderPlayer(name: "DO")]
        let testHeight : Int = 3
        ladderGame.setPlayersName(playerNames: testNames)
        ladderGame.setLadderHeight(ladderHeight: testHeight)
        ladderGame.makeLadder()
        
        for rowLadder in ladderGame.getLadderGameDTO().ladder{
            for rowIndex in 0..<rowLadder.count-1{
                XCTAssertTrue(rowLadder[rowIndex].ladderOneStep != true || rowLadder[rowIndex+1].ladderOneStep != true)
            }
        }
    }    
}
