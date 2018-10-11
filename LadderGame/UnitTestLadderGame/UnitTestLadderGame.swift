//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by 조재흥 on 2018. 9. 29..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    
    var ladderGame:LadderGame!
    var ladderGameDTO:LadderGameDTO!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        ladderGame = LadderGame(height: 4, names: "gd,zico,HNGFU")
        ladderGameDTO = ladderGame.translateToDTO()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        ladderGame = nil
        ladderGameDTO = nil
    }
    
    func testPutStepInLadder() {
        var isConnected = false
        let ladder = ladderGameDTO.ladder
        
        for i in ladder {
            isConnected = checkConnected(i)
        }
        
        XCTAssertFalse(isConnected)
    }
    
    func checkConnected(_ ladder:[LadderStep]) -> Bool {
        for i in ladder.startIndex..<ladder.endIndex - 1 {
            guard !(ladder[i].hasStep==ladder[i+1].hasStep && ladder[i+1].hasStep==true) else {return true}
        }
        return false
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
