//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func writeData() -> (Int, Int) {
    print("참여할 사람은 몇 명 인가요?")
    let numberOfPeople = Int(readLine() ?? "0") ?? 0

    print("최대 사다리 높이는 몇 개인가요?")
    let numberOfLadders = Int(readLine() ?? "0") ?? 0

    return (numberOfPeople, numberOfLadders)
}

func printLadders(_ people: Int, _ height: Int) {
    var ladder = Array<Array<Bool>>()

    for _ in 1..<height {
        var ladderRow = Array<Bool>()
        for _ in 1..<people {
            ladderRow.append(Bool.random())
        }
        ladder.append(ladderRow)
    }

    for ladderRow in ladder {
        print("|", terminator: "")
        for step in ladderRow {
            print(step ? "-|" : " |", terminator: "")
        }
        print("")
    }
}

let (numberOfPeople, numberOfLadders) = writeData()
printLadders(numberOfPeople, numberOfLadders)
