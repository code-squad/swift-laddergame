//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// set error Case
enum inputError: Error {
    case wrongInt
}

// check error
func check(type: String) throws -> Int {
    guard let result = Int(type) else {
        throw inputError.wrongInt
    }
    return result
}

// receive a user value
func receive() throws -> String {
    guard let number = readLine() else {
        throw inputError.wrongString
    }
    return number
}

// make a horizon line
func makeHorizon() -> String {
    var result = String()
    if arc4random_uniform(2) == 1 {
        result = "-"
    } else {
        result = " "
    }
    return result
}

// request user input
func request() -> (people: Int, maxLadder: Int) {
    var people = Int()
    var maxLadder = Int()
    do {
        print("최대 사다리의 높이는 몇개인가요?(ex: 5): " , terminator: " ")
        maxLadder = try check(type: receive())
        print("참여할 사람은 몇명인가요?(ex: 3): " , terminator: " ")
        people = try check(type: receive())
    } catch inputError.wrongInt {
        print("숫자로 바꿀 수 없는 입력값입니다")
    } catch {
        print("알 수 없는 에러입니다")
    }
    return (people, maxLadder)
}

// create one line ladder
func createLadderPart(_ people: Int, _ maxLadder: Int) -> Array<String> {
    var ladders = Array(repeating: " ", count: 2 * people - 1)
    for index in 0..<ladders.count {
        if index % 2 == 1 && ladders.contains("-") == false {
            ladders[index] = makeHorizon()
        } else if index % 2 == 0{
            ladders[index] = "|"
        }
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
        print(part.joined(separator: " "))
    }
}

func main() {
    let source = request()
    completeLadder(source.people, source.maxLadder)
}

main()

