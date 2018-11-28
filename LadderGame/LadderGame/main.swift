//
//  main.swift
//  LadderGame
//
//  Created by kcushy
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// set error case
enum inputError: Error {
    case wrongValue
    case lackLadder
    case lackPeople
    var description: String {
        switch self {
        case .lackLadder: return "1개 이상의 사다리를 입력해주세요"
        case .lackPeople: return "1명 이상의 참여자가 필요합니다"
        case .wrongValue: return "잘못된 값입니다"
        }
    }
}

// receive input how many ladders are.
func receiveLadder() throws -> Int {
    print("최대 사다리의 높이는 몇개인가요? ex) 5:\n>>> ", terminator: "")
    let input = readLine() ?? " "
    if let ladder = Int(input) {
        return ladder
    }
}

// receive input how many people are.
func receivePeople() throws -> Int {
    print("참여하는 사람은 몇명인가요? ex) 3:\n>>> ", terminator: "")
    let input = readLine() ?? " "
    if let people = Int(input) {
        return people
    }
}

func meetMinimum(ladder: Int, people: Int) throws {
    guard ladder < 1 else {
        throw inputError.lackLadder
    }
    guard people < 1 else {
        throw inputError.lackPeople
    }
}

// inspect a except case
func inspectExcept(_ ladders: [String], _ index: Int) -> String {
    guard index > 0 && ladders[index - 1] == "-" else {
        return makeHorizon()
    }
    return " "
}

// make a horizon line
func makeHorizon() -> String {
    guard arc4random_uniform(2) == 1 else {
        return " "
    }
    return "-"
}

// create one line ladder
func makeLadderPart(from people: Int) -> [String] {
    var ladders = [String](repeating: " ", count: people - 1)
    guard !ladders.isEmpty else {
        return []
    }
    for index in 0..<people - 1 {
        ladders[index] = inspectExcept(ladders, index)
    }
    return ladders
}


// create completed ladder
func makeFullLadder(_ people: Int, _ maxLadder: Int) -> [[String]] {
    var ladders = [[String]]()
    while ladders.count < maxLadder {
        let part = makeLadderPart(from: people)
        ladders.append(part)
    }
    return ladders
}

// print a line of ladder
func printPart(of ladders: [String]) {
    print("|", terminator: "")
    for part in ladders {
        print(part, terminator: "|")
    }
}

// print full ladder
func printFull(_ ladders: [[String]]) {
    for ladder in ladders {
        printPart(of: ladder)
        print()
    }
}

func main() {
    let height = provideHeight()
    let people = provideParticipant()
    let ladders = makeFullLadder(people, height)
    printFull(ladders)
}

main()

