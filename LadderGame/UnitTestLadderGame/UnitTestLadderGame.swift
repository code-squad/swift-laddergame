//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by 이진영 on 17/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestLadderGame: XCTestCase {
    
    func testLadderPlayerInitializationSucceeds() {
        XCTAssertNoThrow(try LadderPlayer(name: "SK"))
    }
    
    func testLadderPlayerInitializationFalisNameShort() {
        XCTAssertThrowsError(try LadderPlayer(name: ""))
    }
    
    func testLadderPlayerInitializationFalisNameLong() {
        XCTAssertThrowsError(try LadderPlayer(name: "dominic"))
    }
    
    func testLadderStep() {
        XCTAssertEqual(ladderStep(component: true), LadderComponent.rung.rawValue)
        XCTAssertEqual(ladderStep(component: false), LadderComponent.empty.rawValue)
    }
    
    func ladderStep(component: Bool) -> String {
        var a = LadderStep()
        a.changeComponent(component: component)
        
        return a.convertLadderStep()
    }
    
    func testLadderGameInitializationSucceeds() {
        XCTAssertNoThrow(try LadderGame(players: [try LadderPlayer(name: "sk"), try LadderPlayer(name: "Blu")], height: 3))
    }
    
    func testLadderGameInitializationFalisLackPlayers() {
        XCTAssertThrowsError(try LadderGame(players: [], height: 3))
        XCTAssertThrowsError(try LadderGame(players: [try LadderPlayer(name: "sk")], height: 3))
    }

    func testLadderGameInitializationFalisLadderShort() {
        XCTAssertThrowsError(try LadderGame(players: [try LadderPlayer(name: "sk"), try LadderPlayer(name: "Blu")], height: 0))
    }
}
