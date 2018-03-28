//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by moon on 2018. 3. 27..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    
    var inputChecker: InputChecker!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        
        inputChecker = nil
    }
    
    // MARK: InputChecker Test
    func testInputHeightSuccess() {
        inputChecker = InputChecker()
        
        let heightUnderTest = 5
        let namesUnderTest = ["pobi", "honux", "crong" ,"jk"]
        
        XCTAssertFalse(inputChecker.check(height: heightUnderTest, names: namesUnderTest))
    }
    
    func testInputHeightFailure() {
        inputChecker = InputChecker()
        
        let heightUnderTest = 0
        let namesUnderTest = ["pobi", "honux", "crong" ,"jk"]
        XCTAssertTrue(inputChecker.check(height: heightUnderTest, names: namesUnderTest))
    }
    
    func testInputNamesSuccess() {
        inputChecker = InputChecker()

        let heightUnderTest = 5
        let namesUnderTest = ["pobi", "honux", "crong" ,"jk"]
        
        XCTAssertFalse(inputChecker.check(height: heightUnderTest, names: namesUnderTest))
    }
    
    func testInputNamesFailure() {
        inputChecker = InputChecker()

        let heightUnderTest = 5
        let namesUnderTest = ["pobiii", "honuxxx", "crong" ,"jk"]
        
        XCTAssertTrue(inputChecker.check(height: heightUnderTest, names: namesUnderTest))
    }
    
}
