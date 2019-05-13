//
//  ladderGameTest.swift
//  ladderGameTest
//
//  Created by 이희찬 on 09/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class ladderGameTest: XCTestCase {

    func testIsContinue() {
        let playerNumber = 199
        let ladderHeight = 199
        var ladder = ladderBoard(playerNumber ,ladderHeight)
        ladder.markLadder()
        for x in 0..<ladderHeight{
            for y in 0..<playerNumber-2{
                XCTAssertFalse((ladder.widthLadderIsExistence[x][y] == true) && (ladder.widthLadderIsExistence[x][y+1] == true))
            }
        }
    }
    
    func testPlayerNumberOverTwohundred() {
        let ladder = ladderBoard(200,5)
        XCTAssertThrowsError(try ladder.playerNumberCheck())
    }
    
    func testPlayerNumberLessThanTwohundred() {
        let ladder = ladderBoard(199,5)
        XCTAssertNoThrow(try ladder.playerNumberCheck())
    }
    
    func testLaderHeightOverTwohundred() {
        let ladder = ladderBoard(5,200)
        XCTAssertThrowsError(try ladder.ladderHeightCheck())
    }
    
    func testLaderHeightLessThanTwohundred() {
        let ladder = ladderBoard(5,199)
        XCTAssertNoThrow(try ladder.ladderHeightCheck())
    }
    
    func testPlayerNumberOverOne() {
        var Input = Inputview()
        XCTAssertNoThrow(try Input.checkNumberOfPlayer("playerOne,playerTwo"))
    }
    
    func testLaderHeightLessThanOne() {
        var Input = Inputview()
        XCTAssertThrowsError(try Input.checkNumberOfPlayer("playerOne"))
    }
    
    func testPlayerNameLengthInRange() {
        var Input = Inputview()
        Input.separateName("a,ab,abc,abcd,abcde")
        XCTAssertNoThrow(try Input.checkNameLengthOfPlayer())
    }
    
    func testPlayerNameLengthOverRange() {
        var Input = Inputview()
        Input.separateName("a,ab,abc,abcd,abcde,abcdef")
        XCTAssertThrowsError(try Input.checkNameLengthOfPlayer())
    }
    
    func testLadderHeightOverOne() {
        var Input = Inputview()
        XCTAssertNoThrow(try Input.checkNumberOfHeight("2"))
    }
    
    func testLadderHeightLessThanOne() {
        var Input = Inputview()
        XCTAssertThrowsError(try Input.checkNumberOfHeight("1"))
    }
    
}
