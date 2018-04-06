//
//  LdderGameTests.swift
//  LdderGameTests
//
//  Created by Yoda Codd on 2018. 4. 2..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class LdderGameTests: XCTestCase {
    
    func test_CheckPeopleFunction_is_working(){
        let peopleList = ["a","as","asd","asdf"]
        XCTAssertNotNil( Checker.checkPeople(peopleList: peopleList))
    }
    func test_CheckPeopleFunction_when_nothing_input(){
        let peopleList = [""]
        XCTAssertNotNil( Checker.checkPeople(peopleList: peopleList))
    }
    func test_CheckPeopleFunction_when_noPoeple(){
        let peopleList = ["",""]
        XCTAssertNotNil( Checker.checkPeople(peopleList: peopleList))
    }
    func test_CheckPeopleFunction_is_working(){
        let peopleList = ["a","as","asd","asdf"]
        XCTAssertNotNil( Checker.checkPeople(peopleList: peopleList))
    }
    
}
