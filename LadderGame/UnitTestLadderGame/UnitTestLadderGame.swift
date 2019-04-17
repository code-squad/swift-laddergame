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
        do {
            XCTAssertNoThrow(try LadderPlayer(playerName: "doran"))
            XCTAssertThrowsError(try LadderPlayer(playerName: "dominic"), "이름은 최대 영문 5글자이므로 7글자일 때 throwError를 반환해야한다.")
        }
    }
    
    /// LadderGame Init test
    func testInitLadderGame () {
        var players: [LadderPlayer] = [LadderPlayer]()
        let height = 5
        
        do {
            players.append(try LadderPlayer(playerName: "jk"))
            players.append(try LadderPlayer(playerName: "doran"))
            players.append(try LadderPlayer(playerName: "aiden"))
        }
        catch {
            print("참가자 이름은 최대 영문 5글자입니다.")
        }
        
        let ladderGame = LadderGame(height, players)
        
        XCTAssertNotNil(ladderGame)
        XCTAssertEqual(ladderGame.ladderBoard, Array(repeating: Array(repeating: false, count:players.count-1), count: height))
        XCTAssertEqual(ladderGame.names, players)
        XCTAssertEqual(ladderGame.names.count, players.count)
    }
    
    
    
    func testMakeLadder () {
        var players: [LadderPlayer] = [LadderPlayer]()
        let height = 5
        var prev = false
        do {
        players.append(try LadderPlayer(playerName: "jk"))
        players.append(try LadderPlayer(playerName: "doran"))
        players.append(try LadderPlayer(playerName: "aiden"))
        }
        catch {
            print("참가자 이름은 최대 영문 5글자입니다.")
        }
        var ladderGame = LadderGame(height, players)
        ladderGame.makeLadder()
        XCTAssertEqual(ladderGame.ladderBoard.count, height)
        for heightIndex in 0..<height {
            XCTAssertEqual(ladderGame.ladderBoard[heightIndex].count, players.count)
            prev = false
            for playerIndex in 0..<players.count {
                if prev {
                    XCTAssertFalse(ladderGame.ladderBoard[heightIndex][playerIndex])
                }
                prev = ladderGame.ladderBoard[heightIndex][playerIndex]
            }
        }
        XCTAssertTrue(ladderGame.ladderBoard is [[Bool]])
    }
    
}
