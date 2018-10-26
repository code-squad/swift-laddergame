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
    func testInitializationNilFailure() {
        let ladderPlayer = [LadderPlayer(name: "name1"),LadderPlayer(name: "name2"),LadderPlayer(name: "name3"),LadderPlayer(name: "name4")]
        let noName : [LadderPlayer] = []
        
        XCTAssertNil(LadderGame(height: 0, players: ladderPlayer),"사다리의 높이가 0 입니다")
        XCTAssertNil(LadderGame(height: 10, players: noName),"이름이 없습니다")
        
    }
    
    func testInitializationNilSuccess() {
        let ladder = [LadderPlayer(name: "testname")]
        XCTAssertNotNil(LadderGame(height: 10, players: ladder))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
