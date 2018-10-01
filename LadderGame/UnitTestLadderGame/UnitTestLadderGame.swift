//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by 윤지영 on 01/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class UnitTestLadderGame: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ValidatorShouldThrowError_WhenInputIsNotAllowed() {
        let namesAllowed = "cat,dog"
        let namesNotAllowed = "rabbit,dog"
        let heightAllowed = "1"
        let heightNotAllowed = "a"
        // 두 입력값 모두 허용될 때 -> NoThrow
        XCTAssertNoThrow(try Validator().checkValidate(height: heightAllowed, names: namesAllowed))
        // names 입력값 중 5글자를 넘는 이름이 있을 때 -> InputError.outOfNameLength
        XCTAssertThrowsError(try Validator().checkValidate(height: heightAllowed, names: namesNotAllowed)) {
            (error) -> Void in XCTAssertEqual(error as? InputError, InputError.outOfNameLength)
        }
        // height 입력값이 정수형이 아닐 때 -> InputError.notIntType
        XCTAssertThrowsError(try Validator().checkValidate(height: heightNotAllowed, names: namesAllowed)) {
            (error) -> Void in XCTAssertEqual(error as? InputError, InputError.notIntType)
        }
    }
    
    func test_PlayerNamesSepartedProperly() {
        let maxHeight = "5"
        let names = "pobi,honux,crong,jk"
        let ladderGame = LadderGame(height: Int(maxHeight)!, names: names)
        
        let playerNames = ladderGame.getPlayerNames()
        
        let namesSeparated = ["pobi","honux","crong","jk"]
        XCTAssertEqual(playerNames, namesSeparated, "Names are NOT separated properly")
        
    }
    
    func test_LadderGame() {
        let maxHeight = "5"
        let names = "pobi,honux,crong,jk"
        let ladderGame = LadderGame(height: Int(maxHeight)!, names: names)
        
        let ladder = ladderGame.makeLadder()
        
        for row in ladder {
            for index in 1...row.count-1 {
                XCTAssertFalse(row[index-1].step && row[index].step, "The step is connected to previous one")
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
