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
enum ValidResultCode: String {
    case valid
    case invalid
}
/// 유효 숫자 범위 코드값
enum ValidRangeCode: Int {
    case validMarginalInputNumber = 2
}
/// 유효하지 않은 입력값에 대한 정의
enum ErrorCode: Int {
    case notANumber = -2
    case invalidInputRangeNumber = -1
}
/// Ladder에 대한 입력 값을 코드로 분류
enum LadderCode: String {
    case horizontalLadder = "-"  ///가로 사다리
    case emptyLadder = " "       ///사다리 없음
}

/// 2차원 사다리 문자열 배열의 print 함수
func printLadder(ladder2dMap : [[String]]) -> Void {
    for (rowItems) in ladder2dMap {
        for (columnItem) in rowItems {
            print("\(columnItem)", terminator: "")
        }
        print ("")
    }
}

/// 2차원 사다리 문자열 배열 초기화 함수
func initLadder(numberOfPeople: Int, numberOfLadders: Int) -> [[String]] {
    let numberOfColumn = numberOfPeople * 2 - 1
    let initialLadder = [[String]] (repeating: Array(repeating: "|", count: numberOfColumn), count: numberOfLadders)
    return initialLadder
}

/// 2진 랜덤 숫자 생성기 -> 0이면 false, 1이면 true 리턴
func binaryRandomGenerate() -> Bool {
    let binaryRange:UInt32 = 2
    return (Int(arc4random_uniform(binaryRange))) == 0 ? false : true
}

/// 2차원 사다리 문자열 생성 함수
func buildLadder(ladder2dMap: [[String]]) -> [[String]] {
    var resultLadder2dMap = ladder2dMap
    for (rowIndex, rowItems) in ladder2dMap.enumerated() {
        resultLadder2dMap[rowIndex] = randomlyBuildLadderSubroutine(rowItems)
        resultLadder2dMap[rowIndex] = usingRuleBuildLadderSubroutine(resultLadder2dMap[rowIndex])
    }
    return resultLadder2dMap
}

/// 각 Row의 사다리 Column에 대해 난수 적용
func randomlyBuildLadderSubroutine(_ ladderRowMap: [String]) -> [String] {
    return ladderRowMap.enumerated().map{ (index: Int, element: String) -> String in
        var ret = element
        if (index+1) % 2 == 0 {
            ret =  binaryRandomGenerate() ? LadderCode.horizontalLadder.rawValue : LadderCode.emptyLadder.rawValue
        }
        return ret
    }
}

/// 연속해서 |-|-| 나오지 않도록 적용
func usingRuleBuildLadderSubroutine(_ ladderRowMap: [String]) -> [String] {
    return ladderRowMap.enumerated().map { (index: Int, element: String) -> String in
        let leastBoundIndex = 2
        if index >= leastBoundIndex && ladderRowMap[index] == "-" && ladderRowMap[index-2] == ladderRowMap[index] {
            return LadderCode.emptyLadder.rawValue
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
func inputPairNumber() -> (Int, Int, String ) {
    let people: Int = inputNumberOfPeople()
    let ladders: Int = inputMaximumHeightOfLadders()
    let isValid: String = checkTotalValidity(people, ladders)
    return (people, ladders, isValid)
}

/// 사람 수 입력 보조함수
func inputNumberOfPeople() -> Int {
    let invalidInput: Int = ErrorCode.invalidInputRangeNumber.rawValue
    ///`n` 명의 사람
    print("참여할 사람은 몇 명 인가요? (2이상의 자연수 입력)")
    guard let n: String = readLine() else{ return invalidInput }
    let typeCastNumberOfPeople = checkInvalidCharacter(n)     /// 유효 숫자 체크 입력값이 정수인지 - 에러코드(ErrorCode.notANumber.rawValue)
    let people: Int = checkValidIntegerNumber(typeCastNumberOfPeople)     /// 유효 범위 체크 - 에러코드 (ErrorCode.invalidInputRangeNumber.rawValue)
    return people
}

/// 사다리 수 입력 보조함수
func inputMaximumHeightOfLadders() -> Int {
    let invalidInput: Int = ErrorCode.invalidInputRangeNumber.rawValue
    ///`m` 높이의 사다리
    print("최대 사다리 높이는 몇 개인가요? (2이상의 자연수 입력)")
    guard let m: String = readLine() else{ return invalidInput }
    let typeCastMaximumHeightOfLadders = checkInvalidCharacter(m)  /// 유효 숫자 체크 입력값이 정수인지 - 에러코드(ErrorCode.notANumber.rawValue)
    let ladders: Int = checkValidIntegerNumber(typeCastMaximumHeightOfLadders) /// 유효 범위 체크 - 에러코드 (ErrorCode.invalidInputRangeNumber.rawValue)
    return ladders
}

/// 전체 유효성 체크함수 - 정상 : "valid" , 비정상 : "invalid" 리턴
func checkTotalValidity (_ people: Int, _ ladders: Int) -> String {
    if (people == ErrorCode.invalidInputRangeNumber.rawValue ||
        ladders == ErrorCode.invalidInputRangeNumber.rawValue ||
        people == ErrorCode.notANumber.rawValue ||
        ladders == ErrorCode.notANumber.rawValue) {
        return ValidResultCode.invalid.rawValue
    }
    return ValidResultCode.valid.rawValue
}

/// 범위 유효성 체크 함수 - 정상 : 원래 값 반환, 비정상 범위 : 에러코드값 반환
func checkValidIntegerNumber(_ number : Int ) -> Int {
    if number < ValidRangeCode.validMarginalInputNumber.rawValue {
        return ErrorCode.invalidInputRangeNumber.rawValue
    }
    return number
}

/// 숫자 외 문자열 여부 체크 함수 - 정상 : 원래 값 정수형태로 반환, 예외 : 에러코드값 반환
func checkInvalidCharacter(_ inputString: String) -> Int {
    if !inputString.isNumber(){
        return ErrorCode.notANumber.rawValue
    }
    if let integerValue = Int (inputString){
        return integerValue
    }
    return ErrorCode.notANumber.rawValue
}

/// 시작 함수
func startLadderGame() -> Void {
    let (people, ladders, isValid) = inputPairNumber()
    if isValid == ValidResultCode.valid.rawValue {
        let initialLadder: [[String]] = initLadder(numberOfPeople: people, numberOfLadders: ladders)
        let resultLadder: [[String]] = buildLadder(ladder2dMap : initialLadder)
        printLadder(ladder2dMap: resultLadder)
        return
    }
    print("유효한 입력값을 넣어주세요 (인원, 높이 각각 2이상 정수 숫자만 입력)")
}

/// 사다리 게임 시작
startLadderGame()
