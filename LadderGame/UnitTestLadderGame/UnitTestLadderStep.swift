//
//  UnitTestLadderStep.swift
//  UnitTestLadderGame
//
//  Created by 김장수 on 2018. 10. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
import Foundation

@testable import LadderGame

class UnitTestLadderStep: XCTestCase {
    var ladderStep = LadderStep()
    
    override func setUp() {
        
    }

    override func tearDown() {
        
    }

    func testIsExistTrueCase() {
        // 랜덤으로 발판을 생성, 0의 경우 발판(true) 유
        let num = 0
        let isExist = ladderStep.isExist(num)
        XCTAssertTrue(isExist.have)
    }
    
    func testIsExistFalseCase() {
        // 랜덤으로 발판을 생성, 1의 경우 발판(false) 무
        let num = 1
        let isExist = ladderStep.isExist(num)
        XCTAssertFalse(isExist.have)
    }

}
