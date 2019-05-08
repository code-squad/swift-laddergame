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
    
    func testGamePlayerNamesShouldEqualInputNames() {
        let names = ["blu", "jun", "young"]
        let ladderGame = LadderGame(names: names, height: 0)
        XCTAssert(names.elementsEqual(ladderGame.players, by: { $0 == $1.name }), "유저 이름과 입력 이름 일치")
    }
    
    func testGamePlayerNamesShouldNotEqualOtherNames() {
        let names = ["blu", "jun", "young"]
        let otherNames = ["jr", "loo", "fi"]
        let ladderGame = LadderGame(names: names, height: 0)
        XCTAssertFalse(otherNames.elementsEqual(ladderGame.players, by: { $0 == $1.name }), "유저 이름과 다른 이름 불일치")
    }
    
    func testGameHeightShouldOneOrMore() {
        let names = ["blu","jun","young"]
        let ladderGame = LadderGame(names: names, height: 10)
        XCTAssertNotNil(ladderGame, "높이가 1이상이면 게임 구조체 초기화")
    }
    
    func testGameHeightShouldNotLessThanOne() {
        let names = ["blu","jun","young"]
        let ladderGame = LadderGame(names: names, height: 0)
        XCTAssertNil(ladderGame, "높이가 1미만이면 Nil 생성")
    }
}
