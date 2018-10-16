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
    case wrongMin
}

// receive input how many ladders are.
func receiveLadder() throws -> Int {
    print("최대 사다리의 높이는 몇개인가요? ex)5:\n>>> ", terminator: "")
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

// check min value
func check(value: Int) throws -> Int {
    if value < 1 {
        throw inputError.wrongMin
    }
    return value
}

// inspect a exce[t case
func inspectExcept(_ ladders: [String], _ index: Int) -> String {
    guard ladders[index - 2] != "-" else {
        return " "
    }
    return makeHorizon()
}

// make a horizon line
func makeHorizon() -> String {
    var result: String
    result = arc4random_uniform(2) == 1 ? "-" : " "
    return result
}

// create one line ladder
func createLadderPart(_ people: Int, _ maxLadder: Int) -> Array<String> {
    var ladders = Array(repeating: "ㅣ", count: 2 * people - 1)
    for index in stride(from: 1, to: ladders.count - 1 , by: 2) {
        ladders[index] = index >= 3 ? inspectExcept(ladders, index) : makeHorizon()
    }
    return ladders
}

// create completed ladder
func completeLadder(_ people: Int, _ maxLadder: Int) {
    var ladders = [[String]]()
    for _ in 0..<maxLadder {
        let part = createLadderPart(people, maxLadder)
        ladders.append(part)
    }
    for part in ladders {
        print(part.joined(separator: ""))
    }
}

func main() {
    while true {
        do {
            let maxLadder = try check(value: receiveLadder())
            let people = try check(value: receivePeople())
            completeLadder(people, maxLadder)
        } catch inputError.wrongValue {
            print("잘못된 입력값입니다")
        } catch inputError.wrongMin {
            print("1 이상의 수를 입력해주세요")
        } catch {
            print("알 수 없는 에러입니다")
        }
    }
}

main()

