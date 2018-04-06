//
//  LdderGameTests.swift
//  LdderGameTests
//
//  Created by Yoda Codd on 2018. 4. 2..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class LdderGameCheckerTests: XCTestCase {
    //체커 테스트 부분. 정상작동할때
    func test_CheckPeopleFunction_is_working(){
        let peopleList = ["a","as","asd","asdf"]
        XCTAssertNotNil( Checker.checkPeople(peopleList: peopleList))
    }
    // 입력값이 없을대
    func test_CheckPeopleFunction_when_nothing_input(){
        let peopleList = [""]
        XCTAssertNil( Checker.checkPeople(peopleList: peopleList))
    }
    // 이름에 공백만 넣었을때
    func test_CheckPeopleFunction_when_no_Name(){
        let peopleList = ["","   "]
        XCTAssertNil( Checker.checkPeople(peopleList: peopleList))
    }
    // 이름이 5글자 초과할때
    func test_CheckPeopleFunction_when_namelength_over_5(){
        let peopleList = ["aasdf","aqwegs","assegsegd","asdf"]
        XCTAssertNil( Checker.checkPeople(peopleList: peopleList))
    }
    // 이름을 한명만 넣었을때
    func test_CheckPeopleFunction_when_only_oneMan(){
        let peopleList = ["aasdf"]
        XCTAssertNil( Checker.checkPeople(peopleList: peopleList))
    }
    //사다리 갯수가 숫자일때
    func test_checkNumber_working(){
        let upLadderNumber = "4"
        XCTAssertNotNil( Checker.checkNumber(inputNumber: upLadderNumber))
    }
    //사다리 갯수가 자열일때
    func test_checkNumber_문자열일때(){
        let upLadderNumber = "asdf"
        XCTAssertNil( Checker.checkNumber(inputNumber: upLadderNumber))
    }
    //사다리 갯수가 1보다 작으면 에러
    func test_checkNumber_사다리수가_1_미만(){
        let upLadderNumber = "0"
        XCTAssertNil( Checker.checkNumber(inputNumber: upLadderNumber))
    }
    //사다리 갯수가 13 초과면 에러
    func test_checkNumber_사다리수가_13_초과(){
        let upLadderNumber = "14"
        XCTAssertNil( Checker.checkNumber(inputNumber: upLadderNumber))
    }
    
}
