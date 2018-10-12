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
    
    var ladderGame : LadderGame = LadderGame()
    
    let testNames : [LadderPlayer] = [LadderPlayer(name: "DM"), LadderPlayer(name: "AD"), LadderPlayer(name: "DO")]
    let testHeight : Int = 3

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testgetLadderGameDTO(){
        let ladderGameDTO : LadderGameDTO = ladderGame.getLadderGameDTO()
        
        XCTAssertTrue(ladderGameDTO.height == 0 && ladderGameDTO.names.isEmpty)
        
        for i in ladderGameDTO.ladder{
            XCTAssertTrue(i.isEmpty)
        }
    }
    
    func testsetPlayerName(){
        ladderGame.setPlayersName(playerNames: testNames)
        
        for player in ladderGame.getLadderGameDTO().names{
            XCTAssertTrue(player.playerName == "DM" || player.playerName == "AD" || player.playerName == "DO" )
        }
    }

    func testsetLadderHeight(){
        ladderGame.setLadderHeight(ladderHeight: testHeight)
        
        XCTAssertEqual(ladderGame.getLadderGameDTO().height, testHeight)
    }
    
    func testsetLadder(){
        ladderGame.setPlayersName(playerNames: testNames)
        ladderGame.setLadder(height: testHeight)
        
        let testLadder : [[LadderStep]] = ladderGame.getLadderGameDTO().ladder
        
        for rowLadder in testLadder{
            for index in 0..<rowLadder.count{
                if index % 2 == 0{
                    XCTAssertEqual(rowLadder[index].ladderOneStep, true)
                }
                else{
                    XCTAssertTrue(rowLadder[index].ladderOneStep == true || rowLadder[index].ladderOneStep == false)
                }
            }
        }
    }
}
