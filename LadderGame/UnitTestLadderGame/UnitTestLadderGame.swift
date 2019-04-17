//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by joon-ho kil on 4/16/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest


class UnitTestLadderGame: XCTestCase {
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
    
    /// LadderPlayer Init test
    func testInitLadderPlayer () {
        XCTAssertNoThrow(try LadderPlayer(playerName: "doran"))
        XCTAssertThrowsError(try LadderPlayer(playerName: "dominic"), "이름은 최대 영문 5글자이므로 7글자일 때 throwError를 반환해야한다.")
    }
    
    /// LadderGame Init Success test
    func testInitLadderGameSuccess () {
        do {
            let height = 5
            let players = [try LadderPlayer(playerName: "jk"), try LadderPlayer(playerName: "doran"), try LadderPlayer(playerName: "aiden")]
            let ladderGame = try LadderGame(height, players)
        
            XCTAssertNotNil(ladderGame)
            XCTAssertEqual(ladderGame.ladderBoard, Array(repeating: Array(repeating: false, count:players.count-1), count: height))
            XCTAssertEqual(ladderGame.names, players)
            XCTAssertEqual(ladderGame.names.count, players.count)
        }
        catch {
            
        }
    }
    
    /// LadderGame Init Fail test
    func testInitLadderGameFail () {
        XCTAssertThrowsError(try LadderGame(5, []), "players 가 비어있으므로 에러 출력")
        XCTAssertThrowsError(try LadderGame(5, [LadderPlayer(playerName: "jk")]), "players 가 한명이므로 에러 출력")
        XCTAssertThrowsError(try LadderGame(-1, [LadderPlayer(playerName: "jk"), LadderPlayer(playerName: "doran"), LadderPlayer(playerName: "aiden")]), "사다리 높이가 2보다 작으므로 에러 출력")
        XCTAssertThrowsError(try LadderGame(1, [LadderPlayer(playerName: "jk"), LadderPlayer(playerName: "doran"), LadderPlayer(playerName: "aiden")]), "사다리 높이가 2보다 작으므로 에러 출력")
    }
    
    func testMakeLadderSuccess () {
        do {
            let players = [try LadderPlayer(playerName: "jk"), try LadderPlayer(playerName: "doran"), try LadderPlayer(playerName: "aiden")]
            let height = 5
       
            var ladderGame = try LadderGame(height, players)
            ladderGame.makeLadder()
            XCTAssertNotNil(ladderGame.ladderBoard)
        }
        catch {
            
        }
    }
    
}
