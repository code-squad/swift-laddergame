//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by cushy k on 14/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class UnitTestLadderGame: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    let names = ["hngfu", "nori", "drake", "cony"]
    let namesIncludedOverMaxLength = ["hngfu", "nori", "justin"]
    let inspection = Inspection()
    let unExpectedHeight = "five"
    let inSufficientHeight = "0"
    let emptyName = ""
    let normalHeight = "5"

    func testNameLengthOver() {
        let players = namesIncludedOverMaxLength.map{ LadderPlayer(name: $0) }
        XCTAssertThrowsError(try inspection.meetLength(of: players), "A name length is over, but nothing happend") { (error) in
            XCTAssertEqual(error as? inputError, inputError.exceedLength)}
    }


    func testHeightExcludeInt() {
        let players = names.map{ LadderPlayer(name: $0) }
        XCTAssertThrowsError(try inspection.meetMinimum(of: players, of: unExpectedHeight), "A ladder is not int type, but nothing happend") { (error) in
            XCTAssertEqual(error as? inputError, inputError.wrongValue)}
    }

    func testNameCountHasInsufficient() {
        let Players = [LadderPlayer(name: emptyName)]
        XCTAssertThrowsError(try inspection.meetMinimum(of: players, of: normalHeight), "No name was entered, but nothing happend") { (error) in
            XCTAssertEqual(error as? inputError, inputError.lackValue)}
    }

    func testHeightHasInsufficient() {
        let players = names.map{ LadderPlayer(name: $0) }
        XCTAssertThrowsError(try inspection.meetMinimum(of: players, of: inSufficientHeight), "There is not enough ladder, but nothing happend") { (error) in
            XCTAssertEqual(error as? inputError, inputError.lackValue)}
    }

    func testConsecutiveLineHas() {
        let players = names.map{ LadderPlayer(name: $0) }
        let game = LadderGame(people: players, height: 5)
        let ladders = game.fullLadder()
        var isConsecutive = false
        for laddersPart in ladders {
            isConsecutive = inspection.verifyChain(from: laddersPart)
        }
        XCTAssertEqual(isConsecutive, false)
    }
}
