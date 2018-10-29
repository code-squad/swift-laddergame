//
//  LdderGameCheckerTests.swift
//  LdderGameCheckerTests
//
//  Created by Elena on 26/10/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class LdderGameCheckerTests: XCTestCase {

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
 
    //MARK : 간단한 초기화
    func test_Initialization_NotNil_SimpleTest() {
        let ladderPlayer = [LadderPlayer(name: "name1"),LadderPlayer(name: "name2"),LadderPlayer(name: "name3"),LadderPlayer(name: "name4")]
        
        XCTAssertNotNil(LadderGame(height: 5, players: ladderPlayer))
    }
    //MARK : 사다리가 0
    func test_Initialization_Nil_Height_Zero() {
        let ladderPlayer = [LadderPlayer(name:"name1")]
        
        XCTAssertNil(LadderGame(height: 0, players: ladderPlayer))
    }
    //MARK : 사다리 높이 1 ~ 500
    func test_Initialization_NotNil_Height() {
        let ladderPlayer = [LadderPlayer(name: "name1"),LadderPlayer(name: "name2")]
        
        for index in 1...500 {
            XCTAssertNotNil(LadderGame(height: index , players : ladderPlayer))
        }
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
