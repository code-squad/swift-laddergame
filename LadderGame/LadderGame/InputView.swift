//
//  InputView.swift
//  LadderGame
//
//  Created by hw on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

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
