//
//  UnitTestInputView.swift
//  UnitTestLadderGame
//
//  Created by 김장수 on 2018. 10. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
import Foundation

@testable import LadderGame

class UnitTestInputView: XCTestCase {
    var inputView = InputView()
    
    override func setUp() {

    }

    override func tearDown() {

    }

    func testValidityNames() {
        let names = "JK,Crong,Honux,Pobi"
        let valid = inputView.validity(names: names)
        XCTAssertEqual(names, valid)
    }

    func testValiditySteps() {
        
    }
}
