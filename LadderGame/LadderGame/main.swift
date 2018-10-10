//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

enum inputError: Error {
    case wrongInt
    case wrongString
}

func check(type: String) throws -> Int {
    guard let result = Int(type) else {
        throw inputError.wrongInt
    }
    return result
}

func count() throws -> String {
    guard let input = readLine() else {
        throw inputError.wrongString
    }
    return input
}

func isLadder() -> String {
    var result = String()
    if arc4random_uniform(2) == 1 {
        result = "-"
    }
    return result
}

func input() -> (people: Int, maxLadder: Int) {
    var people = Int()
    var maxLadder = Int()
    do {
        print("최대 사다리의 높이는 몇개인가요?(ex: 5): " , terminator: " ")
        maxLadder = try check(type: count())
        print("참여할 사람은 몇명인가요?(ex: 3): " , terminator: " ")
        people = try check(type: count())
    } catch inputError.wrongInt {
        print("숫자로 바꿀 수 없는 입력값입니다")
    } catch inputError.wrongString {
        print("잘못된 입력입니다")
    } catch {
        print("알 수 없는 에러입니다")
    }
    return (people, maxLadder)
}

func createLadder(people: Int, maxLadder: Int) -> Array<String> {
    var ladder = Array(repeating: " ", count: 2 * people - 1)
    for index in 1...ladder.count {
        switch index % 2 {
        case 1:
            ladder.insert(isLadder(), at: index)
        default:
            ladder.insert("|", at: index)
        }
    }
    return ladder
}


func main() {
    
}


main()
