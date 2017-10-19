//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by yangpc on 2017. 10. 19..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import XCTest
@testable import Laddergame

class UnitTestLadderGame: XCTestCase {
    
    var firstPlay: LadderGame!
    var secondPlay: LadderGame!
    var testObject: ResultView!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        firstPlay = LadderGame(inputs: (["apple", "ios", "dev"], 5))
        secondPlay = LadderGame(inputs: (["good", "a"], 5))
        testObject = ResultView()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        firstPlay = nil
        secondPlay = nil
        testObject = nil

    }
    
    func testMakeSpace() {
        let firstSpace: [Int] = testObject.makeSpace(player: firstPlay.names)
        let secontSpace: [Int] = testObject.makeSpace(player: secondPlay.names)
        XCTAssertTrue(firstSpace[0] == 2)
        XCTAssertTrue(firstSpace[1] == 3)
        XCTAssertTrue(secontSpace[0] == 4)
    }

    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
