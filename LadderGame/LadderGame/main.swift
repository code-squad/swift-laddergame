//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation



func executeLadderGame() {
    let (n, m) = getUserInputForGame()
    print(n, m)
}

func getUserInputForGame() -> (Int, Int){
    print("참여할 사람 수: ")
    let n = readLine()
    
    print("최대 사다리 높이: ")
    let m = readLine()
    
    guard let numberOfPeople = Int(n!), let maxLadderHeight = Int(m!) else {
        fatalError("잘못된 입력입니다.")
    }
    
    return (numberOfPeople, maxLadderHeight)
}

executeLadderGame()
