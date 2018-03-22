//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//


import Foundation


enum Question: String {
    case numberOfPeople = "참여할 사람은 몇 인가요?"
    case numberOfHeight = "최대 사다리 높이는 몇 개인가요?"
}

func ask(question: Question) {
    print(question.rawValue)
}

func getNumberOfPeople() -> Int {
    guard let input = readLine(), let numberOfPeople = Int(input) else {
        return 0
    }
    
    return numberOfPeople
}

func getHeightOfLadder() -> Int {
    guard let input = readLine() else {
        return 0
    }
    
    guard let heightOfLadder = Int(input) else {
        return 0
    }
    
    return heightOfLadder
}

func hasNumberZero(_ people: Int, _ height: Int) -> Bool {
    return (people == 0 || height == 0)
}

func makeLadder(numberOfColumn: Int, numberOfRow: Int) -> [[Bool]] {
    var ladder = [[Bool]](repeating: Array(repeating: false, count: numberOfColumn), count: numberOfRow)
    
    for row in 0..<numberOfRow {
        for column in 0..<numberOfColumn {
            ladder[row][column] = generateRandom()
        }
    }
    
    return ladder
}

func makeColumn(_ numberOfColumn: Int) -> [Bool] {
    var column = [Bool]()

    for _ in 0..<numberOfColumn {
        column.append(generateRandom())
    }
    
    return column
}

func generateRandom() -> Bool {
    return arc4random_uniform(2) == 1
}

func drawLadder(_ ladder: [[Bool]]) {
    
    for row in ladder {
        print("|", terminator: "")
        for column in row {
            print(makeBar(element: column), terminator: "|")
        }
        print()
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
    var removed = ladder
    
    for row in 0..<ladder.count {
        var flag = false
        for column in 0..<ladder[row].count {
            if flag, ladder[row][column] {
                removed[row][column] = !flag
            }
            flag = removed[row][column]
        }
    }
    
    return removed
}

func runLadderGame() {
    
    ask(question: Question.numberOfPeople)
    let numberOfPeople: Int = getNumberOfPeople()
    
    ask(question: Question.numberOfHeight)
    let heightOfLadder = getHeightOfLadder()
    
    guard !hasNumberZero(numberOfPeople, heightOfLadder) else {
        return
    }
    
    let numberOfFrame = numberOfFrameFor(numberOfPeople)
    let ladder = makeLadder(numberOfColumn: numberOfFrame, numberOfRow: heightOfLadder)
    
    let nonRepeatLadder = removeRepeatLadder(origin: ladder)
    drawLadder(nonRepeatLadder)
    
}


// MARK: Run a program.
runLadderGame()
