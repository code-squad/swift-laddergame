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

func main() {
    while true {
        do {
            let pass = try meetMinimum()
            let ladders = makeFullLadder(pass.people, pass.ladder)
            printFull(ladders)
            return
        }
        catch inputError.lackPeople {
            print(inputError.lackPeople.description)
        }
        catch inputError.lackLadder {
            print(inputError.lackLadder.description)
        }
        catch inputError.wrongValue {
            print(inputError.wrongValue.description)
        }
        catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
}

// test minimum value
func meetMinimum() throws -> (people: Int, ladder: Int) {
    let ladder = receiveLadder()
    let people = receivePeople()
    guard let height = Int(ladder),
        let participant = Int(people) else {
            throw inputError.wrongValue
    }
    guard participant >= 1 else {
        throw inputError.lackPeople
    }
    guard height >= 1 else {
        throw inputError.lackLadder
    }
    return (participant, height)
}

// receive input how many ladders are.
func receiveLadder() -> String {
    print("최대 사다리의 높이는 몇개인가요? ex) 5:\n>>> ", terminator: "")
    let input = readLine() ?? " "
    return input
}

// receive input how many people are.
func receivePeople() -> String {
    print("참여하는 사람은 몇명인가요? ex) 3:\n>>> ", terminator: "")
    let input = readLine() ?? " "
    return input
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

// print full ladder
func printFull(_ ladders: [[String]]) {
    for ladder in ladders {
        printPart(of: ladder)
        print()
    }
}

// print a line of ladder
func printPart(of ladders: [String]) {
    print("|", terminator: "")
    for part in ladders {
        print(part, terminator: "|")
    }
}

main()

