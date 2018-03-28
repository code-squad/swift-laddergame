//
//  testInputChecker.swift
//  UnitTestLadderGame
//
//  Created by moon on 2018. 3. 29..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class testInputChecker: XCTestCase {
    
    var inputChecker: InputChecker!

    override func setUp() {
        super.setUp()
        
        inputChecker = InputChecker()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitInputChecker() {
        XCTAssertNotNil(inputChecker)
    }

}
