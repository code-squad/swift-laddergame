//
//  UnitTestInputView.swift
//  UnitTestLadderGame
//
//  Created by 윤동민 on 2018. 10. 15..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class UnitTestUserInput: XCTestCase {
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Height의 값이 <= -1 로 잘못 입력된 경우 테스트
    func testUserHeightWrongInput(){
        let testWrongHeight : Int = -1
        XCTAssertEqual(CheckUserInput.isRightUserHeightInput(input: testWrongHeight), false)
    }
    
    // Height의 값이 > -1 로 제대로 입력된 경우 테스트
    func testUserHeightRightInput(){
        let testRightHeight : Int = 3
        XCTAssertEqual(CheckUserInput.isRightUserHeightInput(input: testRightHeight), true)
    }
    
    // 플레이어의 이름이 모두 잘못 입력되어 배열에 아무것도 들어가지 않은 경우 테스트
    func testUserNameWrongInput(){
        let testWrongNames : [LadderPlayer] = []
        XCTAssertEqual(CheckUserInput.isRightUserNameInput(userNames: testWrongNames), false)
    }
    
    // 플레이어의 이름이 모두 제대로 입력도어 배열에 다 들어간 경우 테스트
    func testUserNameRightInput(){
        let testRightNames : [LadderPlayer] = [LadderPlayer(name: "JJJ"), LadderPlayer(name: "DM")]
        XCTAssertEqual(CheckUserInput.isRightUserNameInput(userNames: testRightNames), true)
    }
}
