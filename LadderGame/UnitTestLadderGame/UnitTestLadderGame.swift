//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by Jun ho Lee on 2018. 10. 15..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
import Foundation



class UnitTestLadderGame: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testGetPlayers() {
        let inputTest = InputView()
        
        //예측 케이스
        let manyNames = Array<String>(repeating: "test", count: 1000)
        let noName = Array<String>()
        let longNames = Array<String>(repeating: "10101010101010101010", count: 4)
        let shortNames = Array<String>(repeating: "b", count: 4)
        
        XCTAssertTrue(inputTest.getPlayers(stringNames: manyNames).count == 1000)
        XCTAssertEqual(inputTest.getPlayers(stringNames: longNames).count, inputTest.getPlayers(stringNames: shortNames).count)
        XCTAssertNotNil(inputTest.getPlayers(stringNames: noName))
    }
}
