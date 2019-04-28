//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

let inputView = InputView()
let ladderStep = LadderStep()
let ladderFloor = LadderFloor()
let ladder = Ladder()



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
    let checkPlayer = inputView.inputUserPlayerName(messageType: Type.peopleNum)
    
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
    let checkLadder = inputView.inputUserLadderCount(messageType: Type.ladderNum)
    
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
