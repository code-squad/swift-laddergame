//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by hw on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestLadderGame: XCTestCase {
    
    //    override func setUp() {
    //    }
    //
    //    override func tearDown() {
    //    }
    
    /// InputView Test
    func testInitializeInputView() {
        let inputView: InputView = InputView()
        XCTAssertEqual(inputView.minInputNumberSize, 2)
        XCTAssertEqual(inputView.maxInputNumberSize, 20)

        let inputViewCustomRange: InputView = InputView(5,30)
        XCTAssertEqual(inputViewCustomRange.minInputNumberSize, 5)
        XCTAssertEqual(inputViewCustomRange.maxInputNumberSize, 30)

        let inputViewCustomRange2: InputView = InputView(30,5)
        XCTAssertEqual(inputViewCustomRange2.minInputNumberSize, 5)
        XCTAssertEqual(inputViewCustomRange2.maxInputNumberSize, 30)
    }
    
    func checkStringArray(item: [Any]) -> Bool {
        return item is Array<String>
    }
    
    func parsingStringToArray(_ input: String = "khan,faker,teddy,mata,clid") -> [String]{
        let splitInputResult = input.split(separator: ",").map{ (value) in return String(value) }
        return splitInputResult
    }
    /// 입력은 제외하고 문자열 -> 문자열 배열 파싱 테스트
    func testInputPlayerHandle() {
        //given
        let input: String  = "khan,faker,teddy,mata,clid"
        //test
        let splitInputResult = input.split(separator: ",").map{ (value) in return String(value) }
        //assert
        XCTAssertNotNil(splitInputResult, "파싱 값이 nil 입니다.")
        XCTAssert(checkStringArray(item: splitInputResult), "결과값이 문자열배열이 아닙니다.")
    }
  
    
}
