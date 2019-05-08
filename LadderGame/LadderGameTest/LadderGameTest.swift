//
//  LadderGameTest.swift
//  LadderGameTest
//
//  Created by BLU on 2019. 5. 7..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import XCTest

class LadderGameTest: XCTestCase {

    func testPlayerNameIsEmpty() {
        let ladderPlayer = LadderPlayer(name: "")
        XCTAssertNil(ladderPlayer, "이름 파라미터가 빈 문자열이면 Nil 생성")
    }
    
    func testPlayerNameIsFiveOrLessCharacters() {
        let ladderPlayer = LadderPlayer(name: "blu")
        XCTAssertNotNil(ladderPlayer, "이름이 다섯 자 이하이면 유저 구조체 초기화")
    }
    
    func testPlayerNameIsOverFiveCharacters() {
        let ladderPlayer = LadderPlayer(name: "junyeong")
        XCTAssertNil(ladderPlayer, "이름이 다섯 자 이상이면 Nil 생성")
    }
}
