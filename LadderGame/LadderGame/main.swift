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
func buildLadder(ladder2dMap : [[String]]) -> [[String]] {
    var resultLadder = ladder2dMap
    ///가로 사다리
    let horizontalLadder: String = "-"
    ///사다리 없음
    let emptyLadder: String = " "
    
    /// stride를 사용한 방식
    for (rowIndex, rowItems) in ladder2dMap.enumerated() {
        let byIndex: Int = 2
        for columnIndex in stride(from: 1, to: rowItems.count, by: byIndex) {
            /// 이진 난수생성에 기반한 Bool값으로 사다리 놓을지 여부 정하기
            let isLadderOn: Bool = binaryRandomGenerate()
            if isLadderOn {
                resultLadder[rowIndex][columnIndex] = horizontalLadder
            }else{
                resultLadder[rowIndex][columnIndex] = emptyLadder
            }
        }
    }
    return resultLadder
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
    /// 입력 예외처리 Pair
    let invalidInputPair: (Int, Int, String ) = (ErrorCode.invalidInputRangeNumber.rawValue,
                                                 ErrorCode.invalidInputRangeNumber.rawValue,
                                                 ValidResultCode.invalid.rawValue)
    ///`n` 명의 사람
    print("참여할 사람은 몇 명 인가요? (2이상의 자연수 입력)")
    guard let n: String = readLine()
        else{
            return invalidInputPair
    }
    /// 유효 숫자 체크 입력값이 정수인지 - 에러코드(ErrorCode.notANumber.rawValue)
    let typeCastNumberOfPeople = checkInvalidCharacter(n)
    /// 유효 범위 체크 - 에러코드 (ErrorCode.invalidInputRangeNumber.rawValue)
    let people: Int = checkValidIntegerNumber(typeCastNumberOfPeople)
    
    ///`m` 개의 m 높이의 사다리
    print("최대 사다리 높이는 몇 개인가요? (2이상의 자연수 입력)")
    guard let m: String = readLine()
        else{
            return invalidInputPair
    }
    /// 유효 숫자 체크 입력값이 정수인지 - 에러코드(ErrorCode.notANumber.rawValue)
    let typeCastNumberOfLadders = checkInvalidCharacter(m)
    /// 유효 범위 체크 - 에러코드 (ErrorCode.invalidInputRangeNumber.rawValue)
    let ladders: Int = checkValidIntegerNumber(typeCastNumberOfLadders)
    
    let isValid: String = checkTotalValidity(people, ladders)
    
    return (people, ladders, isValid)
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
    }else{
        return number
    }
}

/// 숫자 외 문자열 여부 체크 함수 - 정상 : 원래 값 정수형태로 반환, 예외 : 에러코드값 반환
func checkInvalidCharacter(_ inputString: String) -> Int {
    if inputString.isNumber() {
        if let integerValue = Int (inputString){
            return integerValue
        }
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
    }else{
        print("유효한 입력값을 넣어주세요 (인원, 높이 각각 2이상).\n양의 실수값 입력시 정수로 내림 처리됩니다.")
    }
}

/// 사다리 게임 시작
startLadderGame()
