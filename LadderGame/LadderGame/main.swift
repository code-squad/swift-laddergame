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
}

// check error
func check(type: String) throws -> Int {
    guard let result = Int(type) else {
        throw inputError.wrongValue
    }
    return result
}

// receive a user value
func receive() -> String {
    var value = String()
    if let message = readLine() {
        value = message
    }
    return value
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

// convert number to multiple of two
func convertToMultiple(from index: Int, max: Int) -> Int {
    var multipleNum = Int()
    if 2 * index < max {
        multipleNum = index * 2
    }
    return multipleNum
}
            


// create one line ladder
// Fixing
func createLadderPart(_ people: Int, _ maxLadder: Int) -> Array<String> {
    var ladders = Array(repeating: "N", count: 2 * people - 1)
    for index in 0..<ladders.count {
        if index % 2 == 1 && ladders[index] != "-" {
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
    while true {
        do {
            print("최대 사다리의 높이는 몇개인가요?(ex: 5): " , terminator: " ")
            let maxLadder = try check(type: receive())
            print("참여할 사람은 몇명인가요?(ex: 3): " , terminator: " ")
            let people = try check(type: receive())
            completeLadder(people, maxLadder)

        } catch inputError.wrongValue {
            print("잘못된 입력값입니다")
        } catch {
            print("알 수 없는 에러입니다")
        }
    }
}

main()

