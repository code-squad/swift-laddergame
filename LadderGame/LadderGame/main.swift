//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

let ladderStep = LadderStep()
let ladderFloor = LadderFloor()
let ladder = Ladder()


//플레이어이름 입력받는 함수
func inputUserPlayerName(messageType: Type) -> LadderPlayer {
    showMessage(getType: messageType)
    let inputName = readLine()!
    
    var player = LadderPlayer()
    player.names = inputName.components(separatedBy: ",")
    
    return player
}

//사라리높이 입력받는 함수
func inputUserLadderCount(messageType: Type) -> Int {
    showMessage(getType: messageType)
    let inputCount = readLine()!
    guard let ladderNum = Int(inputCount) else {
        return 0
    }
    return ladderNum
}




//사다리의 1가로줄만드는걸 가지고 사다리높이만큼 반복하는 함수
func horizontalSubjectsChangeHorizontalLadders(changeSubjects: [[Bool]]) -> [[String]]{
    let ladderWidth = changeSubjects[0].count
    let ladderHeight = changeSubjects.count
    
    
    var horizontalLadders: [[String]] = Array(repeating: Array(repeating: "-", count: ladderWidth), count: ladderHeight)
    
    for horizontalLaddersIndex in 0 ..< ladderHeight {
        horizontalLadders[horizontalLaddersIndex] = ladderFloor.makeFloorLadders(data: changeSubjects[horizontalLaddersIndex], ladders: horizontalLadders[horizontalLaddersIndex])
    }
    return horizontalLadders
}


//배열에있는 그림으로 사다리1행 만드는 함수
func makeLadderOneLine(lineCount: Int, ladderValues: [[String]]) {
    let ladderWidth = ladderValues[0].count
    
    var verticalLine = "|"
    for oneLineladderCount in 0 ..< ladderWidth {
        verticalLine = verticalLine + ladderValues[lineCount][oneLineladderCount]
        verticalLine = verticalLine + "|"
    }
    print(verticalLine)
    verticalLine = " "
}


//사다리높이만큼 사다리그림을 1행씩 증가시키는 함수
func increaseByladderLine(ladders: [[String]]) {
    let ladderHeight = ladders.count
    
    for ladderHeightCount in 0 ..< ladderHeight {
        makeLadderOneLine(lineCount: ladderHeightCount, ladderValues: ladders)
    }
}

//에러체크된 플레이어이름을 저장할 변수
var playerNames = Array<String>()

//플레이어입력의 에러를 체크하고 행동하는 함수
func checkPlayerError() -> [String] {
    let checkPlayer = inputUserPlayerName(messageType: Type.peopleNum)
    
    do {
        try showPlayerError(chNames: checkPlayer)
        
    } catch UserInputError.overNameCount {
        exit(0)
    } catch UserInputError.incorrectPlayerData {
        exit(0)
    } catch {
        print("모든상황에러")
    }
    playerNames = checkPlayer.names
    return checkPlayer.names
}

//사다리층입력의 에러를 체크해서 행동하는 함수
func checkLadderError() -> Int {
    let checkLadder = inputUserLadderCount(messageType: Type.ladderNum)
    
    do {
        try showLabberError(chladderNum: checkLadder)
        
    } catch UserInputError.incorrectLadderData {
        exit(0)
    } catch {
        print("모든상황에러")
    }
    return checkLadder
}

//플레이어이름 출력하는 함수
func showPlayerName(playerName: Array<String>) {
    var showName = String()
    
    for index in 0..<playerNames.count {
       var name = playerNames[index]
        while name.count < 6 {
            name.insert(" ", at: name.endIndex)
        }
        showName = showName + name
    }
    print(showName)
}



//게임 실행하는 함수
func playGame() {
    let data = ladder.makeLadderData(peopleNum: checkPlayerError().count, ladderNum: checkLadderError())
    let horizontal = ladder.makeHorizontalLadders(makeData: data)
    increaseByladderLine(ladders: horizontal)
    showPlayerName(playerName: playerNames)
}

playGame()
