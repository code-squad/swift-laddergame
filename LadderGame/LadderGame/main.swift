//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
//  Forked and dev by HW on 09/04/2019
import Foundation

enum ValidRangeCode: Int {
    case validMarginalInputNumberSize = 2
    case maxInputNumberSize = 20
}

enum ErrorCode: Error {
    case notANumber
    case outOfRangeNumber
    case invalidInput
    case none
    case unknown
}

var errorType = ErrorCode.none
var errorValue = -1

enum LadderCode: String {
    case horizontalLadder = "-"  ///가로 사다리
    case emptyLadder = " "       ///사다리 없음
    case peopleSubject = "사람"
    case ladderSubject = "사다리"
}

/// 입력값이 숫자인지 체크 - 1)빈문자열이 아니고, 2)정수숫자가 있어야하고, 3)다른 문자열이 없어야 한다
public extension String {
    func isNumber() -> Bool {
        return !self.isEmpty
            && self.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
            && self.rangeOfCharacter(from: CharacterSet.letters) == nil
    }
}

func printLadder(ladder2dMap : [[Bool]]) -> Void {
    for (rowItems) in ladder2dMap {
        printEachRowLadder(rowItems)
    }
}

func printEachRowLadder(_ row: [Bool] ) -> Void {
    let eachRow = row.map{ (value) -> String in
        if value {
            return LadderCode.horizontalLadder.rawValue
        }
        return LadderCode.emptyLadder.rawValue
    }
    for (columnItem) in eachRow {
        print("|\(columnItem)", terminator: "")
    }
    print ("|")
}

func initLadder(numberOfPeople: Int, numberOfLadders: Int) -> [[Bool]] {
    let initialLadder = [[Bool]] (repeating: Array(repeating: false, count: numberOfPeople), count: numberOfLadders)
    return initialLadder
}

func binaryRandomGenerate() -> Bool {
    let binaryRange:UInt32 = 2
    return (Int(arc4random_uniform(binaryRange))) == 0 ? false : true
}

func buildLadder(ladder2dMap: [[Bool]]) -> [[Bool]] {
    var resultLadder2dMap = ladder2dMap
    for (rowIndex, rowItems) in ladder2dMap.enumerated() {
        resultLadder2dMap[rowIndex] = buildRandomLadder(rowItems)
        resultLadder2dMap[rowIndex] = eraseHorizonLadderByRule(resultLadder2dMap[rowIndex])
    }
    return resultLadder2dMap
}

func buildRandomLadder(_ ladderRowMap: [Bool]) -> [Bool] {
    return ladderRowMap.enumerated().map{ (index: Int, element: Bool) -> Bool in
        var ret = element
        if (index+1) % 2 == 0 {
            ret =  binaryRandomGenerate() ? true : false
        }
        return ret
    }
}

/// 연속해서 |-|-| 나오지 않도록 적용
func eraseHorizonLadderByRule(_ ladderRowMap: [Bool]) -> [Bool] {
    return ladderRowMap.enumerated().map { (index: Int, element: Bool) -> Bool in
        let leastBoundIndex = 2
        if index >= leastBoundIndex && ladderRowMap[index] == true &&
            ladderRowMap[index-2] == ladderRowMap[index] {
            return false
        }
        return element
    }
}

func checkValidInput() throws -> String{
    guard let input: String = readLine() else{ throw ErrorCode.invalidInput }
    return input
}

func checkValidNumber(_ inputString: String) throws -> Int {
    if !inputString.isNumber(){
        throw ErrorCode.notANumber
    }
    if let integerValue = Int (inputString){
        return integerValue
    }
    throw ErrorCode.notANumber
}

func checkValidRange(_ number: Int) throws -> Int {
    if number < ValidRangeCode.validMarginalInputNumberSize.rawValue ||
        number > ValidRangeCode.maxInputNumberSize.rawValue  {
        throw ErrorCode.outOfRangeNumber
    }
    return number
}

func handleInputStringError() -> String {
    var input: String = ""
    do{
        input = try checkValidInput()
        return input
    }catch ErrorCode.invalidInput {
        errorType = .invalidInput
    }catch {
        errorType = .unknown
    }
    return input
}
func handleConvertNumberError(_ input: String) -> Int {
    var number: Int = errorValue
    do{
        number = try checkValidNumber(input)
        return number
    }catch ErrorCode.notANumber {
        errorType = .notANumber
    }catch {
        errorType = .unknown
    }
    return number
}

func handleValidRangeNumberError(_ number: Int) -> Int {
    var result: Int = errorValue
    do{
        result = try checkValidRange(number)
        return result
    }catch ErrorCode.outOfRangeNumber {
        errorType = .outOfRangeNumber
    }catch {
        errorType = .unknown
    }
    return result    // catch에 해당하는 result
}

func inputErrorHandle() -> Int {
    var input: String = ""
    var number: Int = errorValue
    var result: Int = errorValue
    while true{
        input = handleInputStringError()
        if input == "" { printErrorType(); continue }
        number = handleConvertNumberError(input)
        if number == errorValue { printErrorType(); continue }
        result = handleValidRangeNumberError(number)
        if result == errorValue { printErrorType(); continue }
        break
    }
    return result
}

func printMessage(_ subject: LadderCode) -> Void {
    print("참여할 \( subject.rawValue )은(는) 몇 명 인가요?")
    print("\(ValidRangeCode.validMarginalInputNumberSize.rawValue)이상의 자연수 입력")
}

/// 입력 함수 - 입력단계, 범위 체크
func inputPairNumber() -> (Int, Int ) {
    printMessage(LadderCode.peopleSubject)
    let peopleInput: Int = inputErrorHandle()

    printMessage(LadderCode.ladderSubject)
    let laddersInput: Int = inputErrorHandle()
    
    return (peopleInput, laddersInput)
}

func printErrorType() -> Void {
    switch errorType {
    case .invalidInput :
        print("입력이 없습니다")
    case .notANumber :
        print("입력 문자열은 숫자가 아닙니다.\n 숫자를 다시입력하세요")
    case .outOfRangeNumber:
        print("입력 범위가 유효한 범위가 아닙니다.\n 숫자를 다시입력하세요 (2~20)")
    case .unknown:
        print("알 수 없는 에러 발생")
    default:
        break
    }
}
func startLadderGame() -> Void {
    let (people, ladders) = inputPairNumber()
    print(people, ladders)
    let initialLadder: [[Bool]] = initLadder(numberOfPeople: people, numberOfLadders: ladders)
    let resultLadder: [[Bool]] = buildLadder(ladder2dMap : initialLadder)
    printLadder(ladder2dMap: resultLadder)
    return
}

startLadderGame()
