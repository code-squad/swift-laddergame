//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by Jung seoung Yeo on 2018. 3. 29..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    
    var names: [String]!
    var height: Int!
    var players: [LadderPlayer]!
    var ladderGame: LadderGame!
    
    //선언
    override func setUp() {
        super.setUp()
        players = [LadderPlayer]()
        names = ["pobi", "honux", "crong" ,"jk"]
        height = 5
        
        for name in names {
            players.append(LadderPlayer(name: name))
        }
    }
    
    override func tearDown() {
        names = nil
        height = nil
        players = nil
        ladderGame = nil
        super.tearDown()
    }
    
    // MAKR : 사다리게임 생성 체크
    func testMakeLadderGameChecker() {
        ladderGame = LadderGame(players, height)
        XCTAssertNotNil(ladderGame)
    }
    
    // MAKR : 사다리 만들기
    func testMakeLadderChecker() throws {
        ladderGame = LadderGame(players, height)
        let ladder = try ladderGame.makeLadderForm()
        XCTAssertNotNil(ladder)
    }
}
