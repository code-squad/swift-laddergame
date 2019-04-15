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

        ladderPlayer = namesIncludedOverMaxLength.map{ LadderPlayer(name: $0) }
        XCTAssertThrowsError(try inspection.meetLength(of: ladderPlayer), "A name length is over, but nothing happend") { (error) in
            XCTAssertEqual(error as? inputError, inputError.exceedLength)}
    }


    func testHeightExcludeInt() {
        XCTAssertThrowsError(try inspection.meetMinimum(of: ladderPlayer, of: unExpectedHeight), "A ladder is not int type, but nothing happend") { (error) in
            XCTAssertEqual(error as? inputError, inputError.wrongValue)}
    }

    func testNameCountHasInsufficient() {
        let lackPlayer = LadderPlayer(name: emptyName)
        XCTAssertThrowsError(try inspection.meetMinimum(of: [lackPlayer], of: normalHeight), "No name was entered, but nothing happend") { (error) in
            XCTAssertEqual(error as? inputError, inputError.lackValue)}
    }

    func testHeightHasInsufficient() {
        XCTAssertThrowsError(try inspection.meetMinimum(of: ladderPlayer, of: inSufficientHeight), "There is not enough ladder, but nothing happend") { (error) in
            XCTAssertEqual(error as? inputError, inputError.lackValue)}
    }

    func testConsecutiveLineHasInsufficient() {
        let ladders = ladderGame.fullLadder()
        print(ladders)
        var isConsecutive = false
        for laddersPart in ladders {
            isConsecutive = inspection.verifyChain(from: laddersPart)
        }
        XCTAssertEqual(isConsecutive, false)
    }
}
