//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by TaeHyeonLee on 2017. 10. 24..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestLadderGame: XCTestCase {
    
    struct LadderPlayer {
        let name : String
    }
    
    private let height : Int = 6
    private(set) var names : [LadderPlayer] = []
    private(set) var ladder : Array<Array<String>> = []
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        names = [LadderPlayer.init(name: "jake")
            , LadderPlayer.init(name: "jk")
            , LadderPlayer.init(name: "j")
            , LadderPlayer.init(name: "honux")
            , LadderPlayer.init(name: "pobi")
        ]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(true)
        XCTAssert(1+3 == 4, "1+2는 3입니다.")
        XCTAssertEqual(names[0].name, "jake")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            
        }
    }
    
}
