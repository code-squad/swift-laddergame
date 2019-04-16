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
    
    ///
    func testMakeLadder() {
        var players: [LadderPlayer] = [LadderPlayer]()
        let height = 5
        var prev = false
        players.append(LadderPlayer(playerName: "jk"))
        players.append(LadderPlayer(playerName: "doran"))
        players.append(LadderPlayer(playerName: "aiden"))
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
