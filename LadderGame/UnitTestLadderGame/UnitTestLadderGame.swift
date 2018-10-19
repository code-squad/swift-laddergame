//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by Jun ho Lee on 2018. 10. 15..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest



class UnitTestLadderGame: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //Input Test
    func testGetPlayersManyNames() {
        let inputTest = InputView()
        let manyNames = Array<String>(repeating: "test", count: 1000)
        
        XCTAssertTrue(inputTest.getPlayers(stringNames: manyNames).count == 1000)
    }
    
    func testGetPlayersHasNoName() {
        let inputTest = InputView()
        let noName = Array<String>()
        XCTAssertNotNil(inputTest.getPlayers(stringNames: noName))
    }
    
    //LadderGame test
    func testCompleteWholeLadderHasNoplayer() {
        let gameTest = LadderGame()
        let normalHeight = 4
        let noPlayer = Array<LadderPlayer>()
        XCTAssertNotNil(gameTest.completeWholeLadder(players: noPlayer, height: normalHeight))
    }
    
    func testCompleteWholeLadderHasManyPlayers() {
        let gameTest = LadderGame()
        let manyPlayers = Array<LadderPlayer>(repeating: LadderPlayer(name: "test"), count: 1000)
        let normalHeight = 4
        XCTAssertNotNil(gameTest.completeWholeLadder(players: manyPlayers, height: normalHeight))
    }
    
    func testCompleteWholeLadderHasnoHeight() {
        let gameTest = LadderGame()
        let normalPlayer = Array<LadderPlayer>(repeating: LadderPlayer(name: "test"), count: 3)
        let noHeight: Int = 0
        XCTAssertNotNil(gameTest.completeWholeLadder(players: normalPlayer, height: noHeight))
    }
    
    func testCompleteWholeLadderHasNegativeHeight() {
        let gameTest = LadderGame()
        let normalPlayer = Array<LadderPlayer>(repeating: LadderPlayer(name: "test"), count: 3)
        let negativeHeight: Int = -4
        XCTAssertNotNil(gameTest.completeWholeLadder(players: normalPlayer, height: negativeHeight))
    }
    
    //LadderError test
    func testCheckPlayerErrorHasNoPlyaer() {
        let noPlayer = Array<LadderPlayer>()
        XCTAssertTrue(LadderGameError.checkPlayerError(players: noPlayer) == ErrorCase.lackPlayers)
    }
    
    func testCheckNameErrorHasLongNamePlayers() {
        let longNamePlayers = Array<LadderPlayer> (repeating: LadderPlayer(name: "abcdefghijk"), count: 4)
        XCTAssertTrue(LadderGameError.checkNameError(players: longNamePlayers) == ErrorCase.exceedNameCharactors)
    }
    
    func testCheckHeightErrorHasNoHeight() {
        let noHeight: Int = 0
        XCTAssertTrue(LadderGameError.checkHeightError(height: noHeight) == ErrorCase.wrongHeight)
    }
    
    func testCheckHeightErrorHasNegativeHeight() {
        let negativeHeight: Int = -4
        XCTAssertTrue(LadderGameError.checkHeightError(height: negativeHeight) == ErrorCase.wrongHeight)
    }
}
