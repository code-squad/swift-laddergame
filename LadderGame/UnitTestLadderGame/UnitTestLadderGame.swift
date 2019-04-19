//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by hw on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestLadderGame: XCTestCase {
    
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
    
    ///private Function 가져오기
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
    
    /// LadderGame Test
    /// LadderGame 생성에 대한 positive test
    func testPositiveTestInitializeLadderGame() {
        let height: Int = 6
        let playerList: [String] = parsingStringToArray()
        let ladderGame: LadderGame = LadderGame.init(height, playerList)
        
        XCTAssertNotNil(ladderGame, "LadderGame 구조체 생성에 실패했습니다")
        XCTAssertEqual(ladderGame._height, 6)
        XCTAssertEqual(ladderGame.playerList.count, 5)
        XCTAssertNotNil(ladderGame.ladder2dMap, "ladder2dMap 초기화가 되지 않았습니다.")
        XCTAssertEqual(ladderGame.ladder2dMap?.count, 6)
        XCTAssertEqual(ladderGame.ladder2dMap?[0].count, 4) /// Player n명 사이의 ladder 칸은 n-1개
        
        for i in 1..<playerList.count {
            XCTAssertEqual(ladderGame.playerList[i].name, playerList[i])
        }
    }
    /// LadderGame 생성에 대한 negative test - 비정상 파라미터 (height)에 대한 프로퍼티 초기화 실패 확인
    func testNegativeTestInitializeLadderGame() {
        /// ladderGame 구조체의 ladderMap 초기화에 실패하는 파라미터로 구조체 생성
        let height: Int = 0
        let playerList: [String] = parsingStringToArray("top")
        let ladderGame: LadderGame = LadderGame.init(height, playerList)
        XCTAssertNotNil(ladderGame, "LadderGame 구조체 생성에 실패했습니다")
        XCTAssertNil(ladderGame.ladder2dMap, "정상 init 파라미터로 구조체를 초기화 하였습니다.")
        XCTAssertEqual(ladderGame.playerList.count, 1)
    }
    
    ///private Function 가져오기
    func binaryRandomGenerate() -> Bool {
        return (Int.random(in: 0..<2) == 0) ? false : true
    }
    
    func testBinaryRandomGenerate() {
        //given && test
        var binaryResultOne: Bool = binaryRandomGenerate()
        var binaryResultTwo: Bool = binaryRandomGenerate()
        binaryResultOne = binaryResultOne ? binaryResultOne : !binaryResultOne
        binaryResultTwo = (!binaryResultTwo) ? binaryResultTwo : !binaryResultTwo
        
        //assert
        XCTAssertTrue( binaryResultOne, "반환값으로 True/False가 정상작동하지 않습니다.")
        XCTAssertFalse(binaryResultTwo, "반환값으로 True/False가 정상작동하지 않습니다.")
    }
    
    /// 1000 번 시행에서 T/F가 무작위로 나오는지 테스트 - 단, 랜덤 발생이 전제이므로 낮은 확률로 실패할 가능성 있음
    func testAverageRandomGenerate(){
        var averageResult:Bool = binaryRandomGenerate()
        var trueCount: Int = 0
        var falseCount: Int = 0
        for _ in 1..<1000 {
            averageResult = binaryRandomGenerate()
            if averageResult {
                trueCount += 1
            }else{
                falseCount += 1
            }
        }
        XCTAssertGreaterThan(trueCount, 0)
        XCTAssertGreaterThan(falseCount, 0)
    }

    /// true값이 존재하는지 테스트
    func testBuildRandomLadder(){
        //given
        var ladderRowMap: [Bool] = [Bool](repeating: false, count: 10000)
        //test
        ladderRowMap = buildRandomLadder(ladderRowMap)
        var isTrueValueIn: Bool = false
        //assert
        for (index) in 1..<ladderRowMap.count{
            isTrueValueIn = isTrueValueIn || ladderRowMap[index]
        }
        XCTAssertTrue(isTrueValueIn, "true 값이 없습니다.")
    }

    ///private Function 가져오기
    func buildRandomLadder(_ ladderRowMap: [Bool]) -> [Bool] {
        return ladderRowMap.enumerated().map{ (index: Int, element: Bool) -> Bool in
            var ret = element
            ret =  binaryRandomGenerate() ? true : false
            return ret
        }
    }
    
    ///private Function 가져오기
    func eraseHorizonLadderByRule(_ ladderRowMap: [Bool]) -> [Bool] {
        let leastBoundIndex = 1
        let finedLadderMap = ladderRowMap.enumerated().map { (index: Int, element: Bool) -> Bool in
            (index >= leastBoundIndex && ladderRowMap[index] == true && ladderRowMap[index-1] == ladderRowMap[index]) ? false : element
        }
        return finedLadderMap
    }
    
    /// |-|-| 제거 여부 테스트
    func testEraseHorizonLadderByRule(){
        //given
        let givenMap: [Bool] = [Bool](repeating: true, count: 10000)
        //test
        let eraseLadderMap = eraseHorizonLadderByRule(givenMap)
        //assert
        for (index) in 1..<eraseLadderMap.count{
            XCTAssertFalse(eraseLadderMap[index-1]&&eraseLadderMap[index], "연속한 true 값이 존재합니다.")
        }
    }
    
    /// 복합적인 사다리 놓기 테스트
    func testCompositeBuildAndEraseLadder(){
        for _ in 1..<10000 {
            //given
            var ladderRowMap: [Bool] = [Bool](repeating: false, count: 100)
            //test
            ladderRowMap = buildRandomLadder(ladderRowMap)
            let eraseLadderMap = eraseHorizonLadderByRule(ladderRowMap)
            ///assert - 연속하는 true값 체크
            for (index) in 1..<eraseLadderMap.count{
                XCTAssertFalse(eraseLadderMap[index-1]&&eraseLadderMap[index], "연속한 true 값이 존재합니다.")
            }
            ///assert - true 값 절반 이하
            var numberOfTrue: Int = 0
            var numberOfFalse: Int = 0
            for index in 0..<eraseLadderMap.count{
                if eraseLadderMap[index] {
                    numberOfTrue += 1
                }else{
                    numberOfFalse += 1
                }
            }
            XCTAssertLessThan(numberOfTrue, 51) // |-|-|가 불가능하므로 절반 이하가 될 것
        }
    }
    
    /// ResultView
    func testResultView() {
        let resultView: ResultView = ResultView.init()
        XCTAssertNotNil(resultView.ladderStep, "프로퍼티 LadderStep 생성에 실패했습니다.")
    }
    
    func testConvertNameFormat() {
        var givenName: LadderPlayer = LadderPlayer ("a")
        var convertResultName = ""
        convertResultName =  convertNameFormat(givenName)
        XCTAssertEqual(convertResultName.count, 5)
        XCTAssert(convertResultName == "  a  " )
        
        givenName = LadderPlayer("ab")
        convertResultName =  convertNameFormat(givenName)
        XCTAssertEqual(convertResultName.count, 5)
        XCTAssert(convertResultName == "  ab " )
        
        givenName = LadderPlayer("abc")
        convertResultName =  convertNameFormat(givenName)
        XCTAssertEqual(convertResultName.count, 5)
        XCTAssert(convertResultName == " abc " )
        
        givenName = LadderPlayer("abcd")
        convertResultName =  convertNameFormat(givenName)
        XCTAssertEqual(convertResultName.count, 5)
        XCTAssert(convertResultName == "abcd " )
        
        givenName = LadderPlayer("abcde")
        convertResultName =  convertNameFormat(givenName)
        XCTAssertEqual(convertResultName.count, 5)
        XCTAssert(convertResultName == "abcde" )
        
    }
    
    ///private Function 가져오기
    func convertNameFormat(_ player: LadderPlayer) -> String{
        let nameLength = player.nameLength
        let name = player.name
        var printedName: String = ""
        switch nameLength{
        case 1:
            printedName = "  "+name+"  "
        case 2:
            printedName = "  "+name+" "
        case 3:
            printedName = " "+name+" "
        case 4:
            printedName = name+" "
        case 5:
            printedName = name
        default:
            printedName = name
        }
        return printedName
    }
}
