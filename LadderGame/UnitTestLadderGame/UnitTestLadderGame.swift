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
    
    var ladderPlayers: [LadderPlayer]!
    var inputChecker: InputChecker!
    var names: [String]!
    var height: Int!
    
    override func setUp() {
        super.setUp()
        
        ladderPlayers = [LadderPlayer]()
        inputChecker = InputChecker()
        names = ["pobi", "honux", "crong" ,"jk"]
        height = 5
        
        for name in names {
            ladderPlayers.append(LadderPlayer(name: name))
        }
    }
    
    override func tearDown() {
        super.tearDown()
        
        ladderPlayers = nil
        inputChecker = nil
        names = nil
        height = nil
    }
    
    // MARK: InputChecker
    func testInputCheckerPass() {
        
        let checkValue = inputChecker.check(height: self.height, players: self.ladderPlayers)
        
        // pass == false
        XCTAssertEqual(checkValue, false)
    }
    
    func testInputHeightFail() {
        
        height = 0
        
        let checkValue = inputChecker.check(height: self.height, players: self.ladderPlayers)
        
        // fail == true
        XCTAssertEqual(checkValue, true)
    }
    
    func testInputPlayerNameLengthFail() {
        names = ["pobiii", "honuxxxxx", "crong", "jk"]
        
        let checkValue = inputChecker.check(height: self.height, players: self.ladderPlayers)
        
        XCTAssertEqual(checkValue, true)
    }
    
    
    
}
