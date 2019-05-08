//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by JH on 06/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestLadderGame: XCTestCase {
    
    func testMakeLadderStep() {
        let rawData = [true, false]
        XCTAssertEqual(LadderStep.makeLadderStep(targets: rawData, changeTargetIndex: 0), "-----", "step생성 실패")
        XCTAssertEqual(LadderStep.makeLadderStep(targets: rawData, changeTargetIndex: 1), "     ", "step생성 실패")
    }
    
    func testLadderFloor() {
        let floorElements = [true,false,false,true]
        let ladders = ["-","-","-","-"]
        
        XCTAssertEqual(LadderFloor.makeLadderFloors(floorElements: floorElements, ladders: ladders),["-----","     ","     ","-----"],"ladder Floor생성 실패")
    }
    
    func testTransFormLadders() {
        var outPutForm = OutputForm()
        let transData = [[true,false,false,true]]
        
        XCTAssertEqual(outPutForm.transFormLadders(transData: transData),[["-----","     ","     ","-----"]],"형변환 실패")
    }
 
}
