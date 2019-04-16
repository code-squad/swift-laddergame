//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
//  Forked and dev by HW on 09/04/2019
import Foundation

/// InputView로 보낼 것
enum ValidRangeCode: Int {
    case validMarginalInputNumberSize = 2
    case maxInputNumberSize = 20
}

/// InputView로 보낼 것
enum ErrorCode: Error {
    case notANumber
    case outOfRangeNumber
    case invalidInput
    case none
    case unknown
}

/// InputView로 보낼 것
struct initialValueState {
    static let defaultNumericState: Int = -1
    static let defaultInputState: String = ""
}

///ResultView로 보낼 것
enum LadderCode: String {
    case horizontalLadder = "-"  ///가로 사다리
    case emptyLadder = " "       ///사다리 없음
}

/// InputView로 보낼 것
protocol PrintMessage {
    var printSpecificMessage: String {get}
    var printBasicMessage: String {get}
}
struct PeopleInfo : PrintMessage {
    var printSpecificMessage: String{
        get{
            return "참여할 사람은 모두 몇 명입니까?"
        }
    }
    var printBasicMessage: String{
        get{
            return "콤마(,)로 구분하여 이름을 나열해주세요\n(ex: khan,faker,teddy,mata,clid )"
        }
    }
}
struct LaddersInfo : PrintMessage {
    var printSpecificMessage: String{
        get{
            return "최대 사다리 높이는 몇 개 입니까?"
        }
    }
    var printBasicMessage: String{
        get{
            return "2이상 20이하의 자연수 입력"
        }
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

///ResultView로 보낼 것
func printLadder(ladder2dMap : [[Bool]]) -> Void {
    for (rowItems) in ladder2dMap {
        printEachRowLadder(rowItems)
    }
}

///ResultView로 보낼 것
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

/// LadderGame 로 보낼 것
func initLadder(numberOfPeople: Int, numberOfLadders: Int) -> [[Bool]] {
    let initialLadder = [[Bool]] (repeating: Array(repeating: false, count: numberOfPeople), count: numberOfLadders)
    return initialLadder
}

/// LadderGame 로 보낼 것
func binaryRandomGenerate() -> Bool {
    let binaryRange:UInt32 = 2
    return (Int(arc4random_uniform(binaryRange))) == 0 ? false : true
}

/// LadderGame 로 보낼 것
func buildLadder(ladder2dMap: [[Bool]]) -> [[Bool]] {
    var resultLadder2dMap = ladder2dMap
    for (rowIndex, rowItems) in ladder2dMap.enumerated() {
        resultLadder2dMap[rowIndex] = buildRandomLadder(rowItems)
        resultLadder2dMap[rowIndex] = eraseHorizonLadderByRule(resultLadder2dMap[rowIndex])
    }
    return resultLadder2dMap
}

/// LadderGame 로 보낼 것
func buildRandomLadder(_ ladderRowMap: [Bool]) -> [Bool] {
    return ladderRowMap.enumerated().map{ (index: Int, element: Bool) -> Bool in
        var ret = element
        ret =  binaryRandomGenerate() ? true : false
        return ret
    }
}

/// 연속해서 |-|-| 나오지 않도록 적용
func eraseHorizonLadderByRule(_ ladderRowMap: [Bool]) -> [Bool] {
    return ladderRowMap.enumerated().map { (index: Int, element: Bool) -> Bool in
        let leastBoundIndex = 1
        if index >= leastBoundIndex && ladderRowMap[index] == true &&
            ladderRowMap[index-1] == ladderRowMap[index] {
            return false
        }
        return element
    }
}

/// InputView로 보낼 것
func checkValidInput() throws -> String{
    guard let input: String = readLine() else{ throw ErrorCode.invalidInput }
    return input
}

/// InputView로 보낼 것
func checkValidNumber(_ inputString: String) throws -> Int {
    if !inputString.isNumber(){
        throw ErrorCode.notANumber
    }
    if let integerValue = Int (inputString){
        return integerValue
    }
    throw ErrorCode.notANumber
}

/// InputView로 보낼 것
func checkValidRange(_ number: Int) throws -> Int {
    if number < ValidRangeCode.validMarginalInputNumberSize.rawValue ||
        number > ValidRangeCode.maxInputNumberSize.rawValue  {
        throw ErrorCode.outOfRangeNumber
    }
    return number
}

/// InputView로 보낼 것
func inputErrorHandle() throws -> Int {
    var input: String = initialValueState.defaultInputState
    var number: Int = initialValueState.defaultNumericState
    input = try checkValidInput()
    number = try checkValidNumber(input)
    number = try checkValidRange(number)
    return number
}

/// InputView로 보낼 것
/// player 이름 입력 받는 기능 ex) khan,clid,faker,teddy,mata
func inputPlayerHandle(_ ladderGame: inout LadderGame) throws -> Void {
    let input: String  = try checkValidInput()
    let playerList = input.split(separator: ",")
    
    /// init
    for player in playerList {
        let ladderPlayer = LadderPlayer(name: String(player ))
        ladderGame.names.append(ladderPlayer)
    }
}

/// InputView로 보낼 것
func inputLadderHandle(_ input: inout LadderGame) throws -> Void {
    input.height = try inputErrorHandle()
}

/// InputView로 보낼 것
func printPeopleMessage() -> Void {
    let peopleInfo: PeopleInfo = PeopleInfo()
    print(peopleInfo.printSpecificMessage)
    print(peopleInfo.printBasicMessage)
}

/// InputView로 보낼 것
func printLaddersMessage() -> Void {
    let laddersInfo: LaddersInfo = LaddersInfo()
    print(laddersInfo.printSpecificMessage)
    print(laddersInfo.printBasicMessage)
}

/// InputView로 보낼 것
func startLadderGame() throws -> Void {
    var ladderGame: LadderGame = LadderGame(_height: 0, names: [LadderPlayer]())
    printPeopleMessage()
    try inputPlayerHandle(&ladderGame)
    printLaddersMessage()
    try inputLadderHandle(&ladderGame)
    
    let initialLadder: [[Bool]] = initLadder(numberOfPeople: ladderGame.numberOfPlayers, numberOfLadders: ladderGame.height)
    let resultLadder: [[Bool]] = buildLadder(ladder2dMap : initialLadder)
    printLadder(ladder2dMap: resultLadder)
}
// khan,clid,faker,teddy,mata
let main = {
    while true {
        do {
            try startLadderGame()
            break;
        }catch ErrorCode.invalidInput{
            print("입력이 없습니다")
        }catch ErrorCode.notANumber{
            print("입력 문자열은 숫자가 아닙니다.")
        }catch ErrorCode.outOfRangeNumber{
            print("입력 범위가 유효한 범위가 아닙니다.")
        }catch {
            print("알 수 없는 에러 발생")
        }
    }
}

main()
