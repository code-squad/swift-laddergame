//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation



func executeLadderGame() {
    let (m, n) = getUserInputForGame()
    buildLadder(ofMaxHeight: m, numberOfPlayer: n)
}

func getUserInputForGame() -> (Int, Int){
    print("참여할 사람 수: ")
    let n = readLine()
    
    print("최대 사다리 높이: ")
    let m = readLine()
    
    guard let numberOfPeople = Int(n!), let maxLadderHeight = Int(m!) else {
        fatalError("잘못된 입력입니다.")
    }
    
    return (maxLadderHeight, numberOfPeople)
}

func buildLadder(ofMaxHeight height: Int, numberOfPlayer: Int) {
    let blankStep: String = " "
    var rowLadder = Array(repeating: blankStep, count: 2 * numberOfPlayer - 1)
    var fullLadder = Array(repeating: rowLadder, count: height)
    
    for (i, row) in fullLadder.enumerated() {
        for j  in 0..<row.count {
            if j % 2 == 0 {
                fullLadder[i][j] = "|"
            } else {
                fullLadder[i][j] = getRandomStep()
            }
            print(fullLadder[i][j], terminator: "")
        }
        print("")
    }
}

// return step - space or "-"
func getRandomStep() -> String {
    let ladderSteps = [" ", "-"]
    return ladderSteps[Int.random(in: 0...1)]
}

executeLadderGame()

