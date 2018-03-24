//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//


import Foundation


func hasNumberZero(_ people: Int, _ height: Int) -> Bool {
    return (people == 0 || height == 0)
}

func drawLadder(_ ladder: [[Bool]]) {
    for row in ladder {
        print("|", terminator: "")
        drawBar(row)
        print()
    }
}

func drawBar(_ row: [Bool]) {
    for column in row {
        print(makeBar(element: column), terminator: "|")
    }
}

func makeBar(element: Bool) -> String {
    return element ? "-" : " "
}

func numberOfFrameFor(_ numberOfPeople: Int) -> Int {
    return numberOfPeople - 1
}

// 이전 값의 상태를 저장하는 flag 설정 -> flag와 현재값이 모두 true이면 false로
func removeRepeatLadder(origin ladder: [[Bool]]) -> [[Bool]] {
    var removedLadder = ladder
    
    for row in 0..<ladder.count {
        removedLadder[row] = changeRow(ladder[row])
    }
    
    return removedLadder
}

func changeRow(_ row: [Bool]) -> [Bool] {
    var flag = false
    var changedRow = row

    for index in 0..<row.count {
        changedRow[index] = flag && row[index] ? !changedRow[index] : changedRow[index]
        flag = changedRow[index]
    }

    return changedRow
}

func runLadderGame() {
    
    let inputView: InputView = InputView()
    
    inputView.ask(question: InputView.Question.namesOfPlayers)
    let namesOfPlayers: [String] = inputView.getNamesOfPlayers()
    
    inputView.ask(question: InputView.Question.heightOfLadder)
    let heightOfLadder: Int = inputView.getHeightOfLadder()
    
    let ladderPlayers: [LadderPlayer] = inputView.setLadderPlayers(by: namesOfPlayers)
    
    let ladderGame: LadderGame = LadderGame(names: ladderPlayers, height: heightOfLadder)
    
    let ladder: [[LadderStep]] = ladderGame.makeLadder()
    print(ladder)
    
    let unRepeatedLadder = RepeatingChecker().removeRepeatLadder(origin: ladder)
    
    
}


// MARK: Run a program.
runLadderGame()
