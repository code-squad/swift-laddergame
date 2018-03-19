//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func getNumberOfPeople() -> Int {
    print("참여할 사람은 몇 명인가요?")
    guard let people = readLine() else {
        return 0
    }
    
    guard let number = Int(people) else {
        return 0
    }
    
    return number
}

func getWidthOfLadder(_ people: Int) -> Int {
    return 2 * people - 1
}

func getHeightOfLadder() -> Int {
    print("최대 사다리 높이는 몇 개인가요?")
    guard let input = readLine() else {
        return 0
    }
    
    guard let height = Int(input) else {
        return 0
    }
    
    return height
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
    
    let people: Int = getNumberOfPeople()
    let widthOfLadder = getWidthOfLadder(people)
    let heightOfLadder = getHeightOfLadder()

    checkInvalid(people, heightOfLadder)
    
    let ladder = makeLadder(width: widthOfLadder, height: heightOfLadder)
    
    printLadder(ladder)
}


// MARK: Run a program.
runLadderGame()
