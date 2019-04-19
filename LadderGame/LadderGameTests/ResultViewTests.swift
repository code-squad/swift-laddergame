//
//  ResultViewTests.swift
//  LadderGameTests
//
//  Created by Daheen Lee on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class ResultViewTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNameOfLength5() {
        let nameOfLength5 = "Diana"
        let centeredName = ResultView.getCenteredName(originalName: nameOfLength5)
        
        XCTAssertEqual(nameOfLength5, centeredName)
    }
    
    func testNameOfLengthOver5() {
        let nameOver5 = "cinderella"
        let desiredName = String(nameOver5.prefix(5))
        
        let centerdName = ResultView.getCenteredName(originalName: nameOver5)
        XCTAssertEqual(desiredName, centerdName)
    }
    
    func testNameOfLength1() {
        let nameOfLength1 = "a"
        let desiredName = "  a  "
        let centerdName = ResultView.getCenteredName(originalName: nameOfLength1)
        
        XCTAssertEqual(desiredName, centerdName)
    }
    
    func testNameOfLength2() {
        let nameOfLength1 = "ab"
        let desiredName = " ab  "
        let centerdName = ResultView.getCenteredName(originalName: nameOfLength1)
        
        XCTAssertEqual(desiredName, centerdName)
    }
    
    func testNameOfLength3() {
        let nameOfLength1 = "abc"
        let desiredName = " abc "
        let centerdName = ResultView.getCenteredName(originalName: nameOfLength1)
        
        XCTAssertEqual(desiredName, centerdName)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
