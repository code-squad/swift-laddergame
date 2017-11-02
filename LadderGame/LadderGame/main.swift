
//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func userInput () -> (Int, Int) {
    print("참여할 사람은 몇 명 인가요?")
    let inputUserNum = Int(readLine()!)
    print("최대 사다리 높이는 몇 개인가요?")
    let inputLadderNum = Int(readLine()!)
    let inputValue = (inputUserNum!, inputLadderNum!)
    return inputValue
}

//사다리 한 층을 만드는 함수
func oneLadder (_ countOfUser: Int) -> Array<String> {
    var oneLadderLine = [String](repeating:" ", count: ((countOfUser * 2)))
    for i in 0..<(countOfUser*2) where i % 2 == 0 {
        oneLadderLine[i] = "|"
    }
    for j in 1..<((countOfUser*2)-1) where j % 2 != 0 {
        oneLadderLine[j] = setRandomBar()
    }
    return oneLadderLine
}

//사다리 한 층에서 사이사이 bar를 랜덤으로 만드는 함수.
func setRandomBar() -> String {
    var randomIndex: Int = 0
    randomIndex = Int(arc4random_uniform(2))
    if randomIndex == 0 {
        return "-"
    } else {
        return " "
    }
}

//사다리 높이만큼 2차원배열을 늘리는 함수 (사다리 높이만큼 oneLadder를 추가)
func generateLadder(_ gameOption: (userNum: Int, ladderNum: Int)) -> Array<Array<String>> {
    var ladder : [[String]] = [[]]
    for _ in 0..<gameOption.ladderNum {
        ladder.append(oneLadder(gameOption.userNum))
    }
    return ladder
}

//출력할 때 2차원배열의 값을 하나씩 꺼내와서 줄바꿈과 함께 출력
func printLadder(mainLadder: Array<Array<String>>) {
    for i in 0..<mainLadder.count {
        for j in 0..<mainLadder[i].count {
            print(mainLadder[i][j], terminator: "")
        }
        print("")
    }
}


printLadder(mainLadder: generateLadder(userInput()))
