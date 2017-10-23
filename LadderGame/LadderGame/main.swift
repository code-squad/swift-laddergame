//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

print("참여할 사람은 몇 명 인가요?")
let peopleCount : Int = Int(readLine() ?? "0") ?? 0
print("최대 사다리의 높이는 몇 개인가요?")
let ladderCount : Int = Int(readLine() ?? "0") ?? 0

enum LadderPrint : Character {
    case bar = "|"
    case step = "-"
    case empty = " "
}

var result : Array<Array<Character>> = Array<Array<Character>>()
for i in 0..<ladderCount {
    result.append(Array<Character>())
    for _ in 1..<peopleCount {
        result[i].append(LadderPrint.bar.rawValue)
        let ladderLine : Int = Int(arc4random_uniform(2))
        switch ladderLine {
        case 0:
            result[i].append(LadderPrint.step.rawValue)
        default:
            result[i].append(LadderPrint.empty.rawValue)
        }
    }
    result[i].append(LadderPrint.bar.rawValue)
}

func printResult(result: Array<Array<Character>>) {
    for i in 0..<result.count {
        let peopleCount : Int = result[i].count
        for j in 0..<peopleCount {
            if j == peopleCount - 1 {
                print(result[i][j])
            } else {
                print(result[i][j], terminator: "")
            }
        }
    }
}

printResult(result: result)

