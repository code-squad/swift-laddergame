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
/// 게임메이커 구조체 테스트
class LdderGameMakerTests: XCTestCase {
    //가로사다리가 연속으로 나오면 거짓, 안나와야 참인 함수
    func checkDoubleSideLadder(ladderGameBoard : Array<Array<Bool>>) -> Bool {
            let ladderGameBoard = ladderGameBoard
            for sideLadders in ladderGameBoard {
                var aheadSideLadder = false
                for ladder in sideLadders {
                    if (aheadSideLadder == true && ladder == true){
                        return false
                    }
                    aheadSideLadder = ladder
                }
            }
        return true
    }
    
    // 메이커 구조체 선언
    let maker = LadderGameBoardMaker()
    
    // 가로사다리가 연속으로 안나오는걸 확인
    func test_sideLadder_not_exist_side_by_sideLadder(){
        let ladderGameBoard = maker.makeLadderGameBoard(peopleNumber: 4, ladderNumber: 4)
        XCTAssert(checkDoubleSideLadder(ladderGameBoard: ladderGameBoard))
    }
    // 가로사다리가 연속으로 나오면 안되는데 체크
    func test_sideLadder_if_exist_side_by_sideLadder(){
        let ladderGameBoard = [[true,true]]
        XCTAssertFalse(checkDoubleSideLadder(ladderGameBoard: ladderGameBoard))
    }
    // 사람수-1과 가로다사리 수가 맞는지 체크
    func test_sideLadderNumber_equal_peopleNumber(){
        let peopleNumber = 4
        let ladderGameBoard = maker.makeLadderGameBoard(peopleNumber: peopleNumber, ladderNumber: 5)
        for sideLadders in ladderGameBoard {
            XCTAssert(sideLadders.count == peopleNumber-1)
        }
    }
    // 사람수보다 가로사다리가 많으면 안되는데 체크
    func test_sideLadderNumber_greaterThan_peopleNumber(){
        let peopleNumber = 4
        let ladderGameBoard = maker.makeLadderGameBoard(peopleNumber: peopleNumber, ladderNumber: 5)
        for sideLadders in ladderGameBoard {
            XCTAssert(sideLadders.count+1 > peopleNumber-1)
        }
    }
    // 사람수보다 가로다사리가 적으면 안되는데 체크
    func test_sideLadderNumber_lessThan_peopleNumber(){
        let peopleNumber = 4
        let ladderGameBoard = maker.makeLadderGameBoard(peopleNumber: peopleNumber, ladderNumber: 5)
        for sideLadders in ladderGameBoard {
            XCTAssert(sideLadders.count-1 < peopleNumber-1)
        }
    }
    // 높이와 세로사다리수가 맞는지 체크
    func test_upLadderNumber_equal_inputUpLadderNumber(){
        let inputUpLadderNumber = 4
        let ladderGameBoard = maker.makeLadderGameBoard(peopleNumber: 5, ladderNumber: inputUpLadderNumber)
        
        XCTAssert(ladderGameBoard.count == inputUpLadderNumber)
    }
    //높이보다 세로사다리가 적으면 안되는데 체크
    func test_upLadderNumber_greaterThan_inputUpLadderNumber(){
        let inputUpLadderNumber = 4
        let ladderGameBoard = maker.makeLadderGameBoard(peopleNumber: 5, ladderNumber: inputUpLadderNumber)
        
        XCTAssert(ladderGameBoard.count+1 > inputUpLadderNumber)
    }
    // 높이보다 세로사다리가 많으면 안되는데 체크
    func test_upLadderNumber_lessThan_inputUpLadderNumber(){
        let inputUpLadderNumber = 4
        let ladderGameBoard = maker.makeLadderGameBoard(peopleNumber: 5, ladderNumber: inputUpLadderNumber)
        
        XCTAssert(ladderGameBoard.count-1 < inputUpLadderNumber)
    }
}

