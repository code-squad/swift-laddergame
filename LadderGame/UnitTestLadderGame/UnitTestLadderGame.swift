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

    var ladderGame: LadderGame!
    var players: [LadderPlayer]!
    var height: Int!
    var names: [String]!
    
    override func setUp() {
        players = [LadderPlayer]()
        
        names = ["pobi", "honux", "crong" ,"jk"]
        height = 5
        
        for name in names {
            players.append(LadderPlayer(name: name))
        }
        
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //InputChecker
    func testInputView() {
        let checker = InputViewChecker.checker(players, height)
        XCTAssertTrue(checker)
    }
    
    func testInputViewZeroPlayer() {
        // player : 0 명
        names = []
        players = [LadderPlayer]()
        
        let checker = InputViewChecker.checker(players, height)
        XCTAssertFalse(checker)
    }
    
    func testInputViewLimitPlayer() {
        names = ["pobi", "honux", "crong" ,"jk", "linsaeng", "Mason", "rhino", "Drake", "Aming", "Min"]
        players = [LadderPlayer]()
        
        let checker = InputViewChecker.checker(players, height)
        XCTAssertFalse(checker)
    }
    
    //LadderGame
    func testLadderGameCreate() throws {
        ladderGame = LadderGame.init(players, height)
        let ladderGameForm = ladderGame.makeLadderForm()
        XCTAssertNotNil(ladderGameForm)
    }
    
    // 연속적인 연결인 경우 false
    func testLadderGameContiniousConnect() {
        let continuousConnect: Array<Array<Bool>> = [[true, true], [true,true]]
        let checker = LadderGameChecker.continuous(continuousConnect)
        XCTAssertFalse(checker)
    }
    
    // 연속적인 연결이 아닌 경우 true
    func testLadderGameNotContiniousConnect() {
        let continuousConnect: Array<Array<Bool>> = [[true, false], [true, false]]
        let checker = LadderGameChecker.continuous(continuousConnect)
        XCTAssertTrue(checker)
    }
    
    // 한줄일 경우
    func testLadderGameOneRope() {
        let continuousConnect: Array<Array<Bool>> = [[true], [false]]
        let checker = LadderGameChecker.continuous(continuousConnect)
        XCTAssertTrue(checker)
    }
}
