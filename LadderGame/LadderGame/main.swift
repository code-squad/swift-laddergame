//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
//  Forked and dev by HW on 09/04/2019
import Foundation

/// 총 유효성체크 통과여부 코드
enum ValidResultCode {
    case valid
    case invalid
}

enum ValidRangeCode: Int {
    case validMarginalInputNumber = 2
}

enum ErrorCode: Int {
    case notANumber = -2
    case invalidInputRangeNumber = -1
    case success = 1
}

enum LadderCode: String {
    case horizontalLadder = "-"  ///가로 사다리
    case emptyLadder = " "       ///사다리 없음
}

func printLadder(ladder2dMap : [[Bool]]) -> Void {
    for (rowItems) in ladder2dMap {
        printEachRowLadder(rowItems)
    }
}

func printEachRowLadder(_ row : [Bool] ) -> Void {
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
        if index >= leastBoundIndex && ladderRowMap[index] == true && ladderRowMap[index-2] == ladderRowMap[index] {
            return false
        }
        return element
    }
}

/// 입력값이 숫자인지 체크 - 1)빈문자열이 아니고, 2)정수숫자가 있어야하고, 3)다른 문자열이 없어야 한다
public extension String {
    func isNumber() -> Bool {
        return !self.isEmpty
            && self.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
            && self.rangeOfCharacter(from: CharacterSet.letters) == nil
    }
}

/// 입력 함수 - 입력단계, 범위 체크
func inputPairNumber() -> (Int, Int ) {
    let people: Int = inputNumberOfPeople()
    let ladders: Int = inputMaximumHeightOfLadders()
    return (people, ladders)
}

func typeCastStringToInteger (_ input: String) -> Int {
    let typeCastNumber: Int = checkValidNumber(input)
    return typeCastNumber
}

func inputNumberOfPeople() -> Int {
    let invalidInput: Int = ErrorCode.invalidInputRangeNumber.rawValue
    print("참여할 사람은 몇 명 인가요? (\(ValidRangeCode.validMarginalInputNumber.rawValue)이상의 자연수 입력)")
    guard let n: String = readLine() else{ return invalidInput }
    let people: Int = typeCastStringToInteger(n)
    return people
}

func inputMaximumHeightOfLadders() -> Int {
    let invalidInput: Int = ErrorCode.invalidInputRangeNumber.rawValue
    print("최대 사다리 높이는 몇 개인가요? (\(ValidRangeCode.validMarginalInputNumber.rawValue)이상의 자연수 입력)")
    guard let m: String = readLine() else{ return invalidInput }
    let ladders: Int = typeCastStringToInteger(m)
    return ladders
}

func checkTotalInputValidity (_ people: Int, _ ladders: Int) -> ValidResultCode {
    
    let validRangePeople: ErrorCode = checkValidRangeNumber(people)
    let validRangeLadders: ErrorCode = checkValidRangeNumber(ladders)
    
    if (people == ErrorCode.invalidInputRangeNumber.rawValue ||
        ladders == ErrorCode.invalidInputRangeNumber.rawValue ||
        people == ErrorCode.notANumber.rawValue ||
        ladders == ErrorCode.notANumber.rawValue) {
        
        return ValidResultCode.invalid
    }
    return ValidResultCode.valid
}

func checkValidRangeNumber(_ number : Int ) -> ErrorCode {
    if number < ValidRangeCode.validMarginalInputNumber.rawValue {
        return ErrorCode.invalidInputRangeNumber
    }
    return ErrorCode.success
}

func checkValidNumber(_ inputString: String) -> Int {
    if !inputString.isNumber(){
        return ErrorCode.notANumber.rawValue
    }
    if let integerValue = Int (inputString){
        return integerValue
    }
    return ErrorCode.notANumber.rawValue
}

func startLadderGame() -> Void {
    let (people, ladders) = inputPairNumber()
    let isValid: ValidResultCode = checkTotalInputValidity(people, ladders)

    if isValid == ValidResultCode.valid {
        let initialLadder: [[Bool]] = initLadder(numberOfPeople: people, numberOfLadders: ladders)
        let resultLadder: [[Bool]] = buildLadder(ladder2dMap : initialLadder)
        printLadder(ladder2dMap: resultLadder)
        return
    }
    print("유효한 입력값을 넣어주세요 (인원, 높이 각각 \(ValidRangeCode.validMarginalInputNumber.rawValue)이상 정수 숫자만 입력)")
}

startLadderGame()
