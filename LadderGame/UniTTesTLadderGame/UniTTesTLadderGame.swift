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
    var ladderGame : LadderGame!
    var ladderPlayer : LadderPlayer!
    var names : [String]!
    var notEnoughHeight: String!
    var notEnoughName: [String]!
    var inspection: Inspection!
    var notInt: String!
    var normalHeight: String!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        names = ["hngfu", "nori", "drake", "cony"]
        ladderPlayer = LadderPlayer(names: names)
        inspection = Inspection()
        notInt = "five"
        notEnoughHeight = "0"
        notEnoughName = [""]
        normalHeight = "5"
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        ladderGame = nil
        ladderPlayer = nil
        names = nil
        inspection = nil
        notInt = nil
        notEnoughHeight = nil
        notEnoughName = nil
        normalHeight = nil
    }

    func testHeightOver() {
        let namesIncludedOverMaxLength = ["hngfu", "nori", "justin"]
        ladderPlayer = LadderPlayer(names: namesIncludedOverMaxLength)
        XCTAssertThrowsError(try inspection.meetLength(of: ladderPlayer), "A name length is over, but nothing happend") { (error) in
            XCTAssertEqual(error as? inputError, inputError.exceedLength)}
    }


    func testHeightNotIncludedInt() {
        XCTAssertThrowsError(try inspection.meetMinimum(of: ladderPlayer, of: notInt), "A ladder is not int type, but nothing happend") { (error) in
            XCTAssertEqual(error as? inputError, inputError.wrongValue)}
    }

    func testNameHasNotEnough() {
        let lackPlayer = LadderPlayer(names: notEnoughName)
        XCTAssertThrowsError(try inspection.meetMinimum(of: lackPlayer, of: normalHeight), "No name was entered, but nothing happend") { (error) in
            XCTAssertEqual(error as? inputError, inputError.lackValue)}
    }

    func testHeightHasNotEnough() {
        XCTAssertThrowsError(try inspection.meetMinimum(of: ladderPlayer, of: notEnoughHeight), "There is not enough ladder, but nothing happend") { (error) in
            XCTAssertEqual(error as? inputError, inputError.lackValue)}
    }
}
