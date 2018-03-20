//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func askQuestion(number: Int) {
    let questions = ["참여할 사람은 몇 명인가요?", "최대 사다리 높이는 몇 개인가요?"]
    
    print(questions[number - 1])
}

func getNumberOfPeople() -> Int {
    guard let input = readLine(), let numberOfPeople = Int(input) else {
        return 0
    }
    
    return numberOfPeople
}

func calculateWidthOfLadderBy(_ numberOfPeople: Int) -> Int {
    return 2 * numberOfPeople - 1
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

func drawLine() -> String {
    return arc4random_uniform(2) == 0 ? " " : "-"
}

func makeColumn(_ width: Int) -> [String] {
    var column = [String]()
    
    for line in 0..<width {
        column.append(line % 2 == 0 ? "|" : drawLine())
    }
    
    return column
}


func makeLadder(width: Int, height: Int) -> [[String]] {
    
    var ladder = [[String]]()
    
    for _ in 0..<height {
        ladder.append(makeColumn(width))
    }
    
    return ladder
}

func checkInvalid(_ people: Int, _ height: Int) {
    if people == 0 || height == 0 {
        print("입력된 숫자 중 0이 있습니다.")
        print("입력된 사람: \(people)")
        print("입력된 사다리 높이: \(height)")
    }
}

func printLadder(_ ladder: [[String]]) {
    for column in ladder {
        print(column.joined())
    }
}

func runLadderGame() {
    
    askQuestion(number: 1)
    let numberOfPeople: Int = getNumberOfPeople()
    
    askQuestion(number: 2)
    let widthOfLadder: Int = calculateWidthOfLadderBy(numberOfPeople)
    let heightOfLadder = getHeightOfLadder()

    checkInvalid(numberOfPeople, heightOfLadder)
    
    let ladder = makeLadder(width: widthOfLadder, height: heightOfLadder)
    
    printLadder(ladder)
}


// MARK: Run a program.
runLadderGame()
