//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by Jun ho Lee on 2018. 10. 15..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
import Foundation



class UnitTestLadderGame: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //예측 케이스
    let manyNames = Array<String>(repeating: "test", count: 1000)
    let noName = Array<String>()
    let longNames = Array<String>(repeating: "abababababababababab", count: 4)
    let shortNames = Array<String>(repeating: "", count: 4)
    
    let nomalPlayer = Array<LadderPlayer>(repeating: LadderPlayer(name: "test"), count: 3)
    let noPlayer = Array<LadderPlayer>()
    let manyPlayers = Array<LadderPlayer>(repeating: LadderPlayer(name: "test"), count: 1000)
    let longNamePlayers = Array<LadderPlayer>(repeating: LadderPlayer(name: "abababababababababab"), count: 4)
    let shortNamePlayers = Array<LadderPlayer>(repeating: LadderPlayer(name: ""), count: 4)
    
    let emptyLadder: [[LadderStep]] = [[]]
    let oneColumnLadder = Array<[LadderStep]>(repeating: [LadderStep()], count: 3)
    let oneLineLadder = [Array<LadderStep>(repeating: LadderStep(), count: 3)]

    let nomalHeight = 4
    let emptyHeight: Int = 0
    let negativeHeight: Int = -4
    
//Input Test
    func testGetPlayers() {
        let inputTest = InputView()
        XCTAssertTrue(inputTest.getPlayers(stringNames: manyNames).count == 1000)
        XCTAssertEqual(inputTest.getPlayers(stringNames: longNames).count, inputTest.getPlayers(stringNames: shortNames).count)
        XCTAssertNotNil(inputTest.getPlayers(stringNames: noName))
    }
    
//Print Test
    func testPrintPlayerNames() {
        let printTest = PrintView()
        XCTAssertNotNil(printTest.printPlayerNames(players: noPlayer))
        XCTAssert(printTest.printPlayerNames(players: manyPlayers).count < Int(pow(2.0,32.0)))
        XCTAssertTrue(printTest.printPlayerNames(players: longNamePlayers) == ErrorCase.exceedNameCharactors.message())
        XCTAssertNotNil(printTest.printPlayerNames(players: shortNamePlayers))
    }
    
    func testDrawWholeLine() {
        let printTest = PrintView()
        XCTAssertNotNil(printTest.drawWholeLine(wholeLadder: emptyLadder))
        XCTAssertNotNil(printTest.drawWholeLine(wholeLadder: oneColumnLadder))
        XCTAssertNotNil(printTest.drawWholeLine(wholeLadder: oneLineLadder))
    }
    
//LadderGame test
    func testCompleteWholeLadder() {
        let gameTest = LadderGame()
        XCTAssertNotNil(gameTest.completeWholeLadder(players: nomalPlayer, height: nomalHeight))
        XCTAssertNotNil(gameTest.completeWholeLadder(players: noPlayer, height: nomalHeight))
        XCTAssertNotNil(gameTest.completeWholeLadder(players: manyPlayers, height: nomalHeight))
        XCTAssertNotNil(gameTest.completeWholeLadder(players: nomalPlayer, height: emptyHeight))
        XCTAssertNotNil(gameTest.completeWholeLadder(players: nomalPlayer, height: negativeHeight))
    }
    
    //LadderError test
    func testLadderError() {
        let errorTest = LadderGameError(players: nomalPlayer, height: nomalHeight)
        XCTAssertTrue(errorTest.checkPlayerError(players: noPlayer) == ErrorCase.lackPlayers)
        XCTAssertTrue(errorTest.checkPlayerError(players: manyPlayers) == ErrorCase.none)
        XCTAssertTrue(errorTest.checkNameError(players: longNamePlayers) == ErrorCase.exceedNameCharactors)
        XCTAssertTrue(errorTest.checkPlayerError(players: shortNamePlayers) == ErrorCase.none)
        XCTAssertTrue(errorTest.checkHeightError(height: emptyHeight) == ErrorCase.wrongHeight)
        XCTAssertTrue(errorTest.checkHeightError(height: negativeHeight) == ErrorCase.wrongHeight)
    }
    
}
