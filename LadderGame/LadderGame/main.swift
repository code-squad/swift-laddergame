//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// set error case
enum inputError: Error {
    case wrongValue
    case lackLadder
    case lackPeople
}

// receive input how many ladders are.
func receiveLadder() throws -> Int {
    print("최대 사다리의 높이는 몇개인가요? ex) 5:\n>>> ", terminator: "")
    let input = readLine() ?? " "
    guard let ladder = Int(input) else {
        throw inputError.wrongValue
    }
    return ladder
}

// receive input how many people are.
func receivePeople() throws -> Int {
    print("참여하는 사람은 몇명인가요? ex) 3:\n>>> ", terminator: "")
    let input = readLine() ?? " "
    guard let people = Int(input) else {
        throw inputError.wrongValue
    }
    return people
}

// check min people
func checkPeople(value: Int) throws -> Int {
    if value < 1 {
        throw inputError.lackPeople
    }
    return value
}
// check min ladder
func checkLadder(value: Int) throws -> Int {
    if value < 1 {
        throw inputError.lackLadder
    }
    return value
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
    for _ in 0..<maxLadder {
        let part = makeLadderPart(from: people)
        ladders.append(part)
    }
    return ladders
}

func validateLadder() -> Int {
    var height = Int()
    while true {
        do {
            height = try receiveLadder()
            return height
        }
        catch inputError.wrongValue {
            print("잘못된 입력값입니다.\n")
        }
        catch {
            print("알 수 없는 에러입니다\n")
        }
    }
}

func validatePeople() -> Int {
    var people = Int()
    while true {
        do {
            people = try receivePeople()
            return people
        }
        catch inputError.wrongValue {
            print("잘못된 입력값입니다.\n")
        }
        catch {
            print("알 수 없는 에러입니다\n")
        }
    }
}

func meetMinLadder() -> Int {
    var maxLadder = Int()
    while true {
        do {
            maxLadder = try checkLadder(value: validateLadder())
            return maxLadder
        }
        catch inputError.lackLadder {
            print("1개 이상의 사다리를 입력해주세요\n")
        }
        catch {
            print("알 수 없는 에러입니다\n")
        }
    }
}

func meetMinPeople() -> Int {
    var people = Int()
    while true {
        do {
            people = try checkPeople(value: validatePeople())
            return people
        }
        catch inputError.lackPeople {
            print("1명 이상의 참여자가 필요합니다\n")
        }
        catch {
            print("알 수 없는 에러입니다\n")
        }
    }
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
    let height = meetMinLadder()
    let people = meetMinPeople()
    let ladders = makeFullLadder(people, height)
    printFull(ladders)
}

main()

