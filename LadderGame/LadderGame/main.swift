//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// 참여할 사람의 숫자를 사용자로 부터 입력받음
func inputPeopleNumber() -> Int{
    while true{
        print("참여할 사람은 몇 명 인가요?")
        let userPeopleInput = readLine()!
        if let peopleCount = Int(userPeopleInput){
            return peopleCount
        }
    }
}

// 최대 사다리의 높이를 사용자로 부터 입력받음
func inputLadderHeight() -> Int{
    while true{
        print("최대 사다리 높이는 몇 개 인가요?")
        let userLadderInput = readLine()!
        if let ladderHeight = Int(userLadderInput){
            return ladderHeight
        }
    }
}

// 랜덤 함수로 1일 경우 "-"생성을 위해 true를 반환, 0일 경우 " "생성을 위해 false를 반환
func isExistLadder() -> Bool{
    if arc4random_uniform(2) == 0 {
        return true
    }
    else{
        return false
    }
}

// isExistLadder함수의 결과로 ture일 경우 "-"를 생성, false일 경우 " "을 생성
func createLadderOrSpace() -> String{
    if isExistLadder() == true{
        return "-"
    }
    else{
        return " "
    }
}

// 입력받은 사람 수와 사다리 최대 높이에 따라 사다리를 초기화
func initializeLadder(peopleCount: Int, heightLadder : Int) -> [[String]]{
    var ladder : [[String]] = Array(repeating: Array(repeating: "|", count: peopleCount), count: heightLadder)
    
    for i in 0..<heightLadder{
        for j in 0..<peopleCount-1{
            ladder[i].insert(createLadderOrSpace(), at: 2*j+1)
        }
    }
    return ladder
}

let peopleCount : Int = inputPeopleNumber()
let heightLadder : Int = inputLadderHeight()
let ladder : [[String]] = initializeLadder(peopleCount: peopleCount, heightLadder: heightLadder)

for i in 0..<heightLadder{
    for j in 0..<ladder[i].count{
        print("\(ladder[i][j])", terminator : "")
    }
    print("")
}
