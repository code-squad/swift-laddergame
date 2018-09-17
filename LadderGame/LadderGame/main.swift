//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation
import GameplayKit

func initialize() -> String {
    print("참여할 사람은 몇 명 인가요?(3이상의 수를 입력해주세요.)")
    guard let participant = readLine() else { return "입력값을 확인해 주세요." }
    print("최대 사다리 높이는 몇 개인가요?(2이상의 수를 입력해주세요.)")
    guard let maximumLadderHeight = readLine() else { return "입력값을 확인해 주세요." }
    
    let convertedParticipant = convertToInt(participant)
    let convertedLadderHeight = convertToInt(maximumLadderHeight)
    
    if convertedParticipant >= 3 && convertedLadderHeight >= 2 {
        return makeLadder(convertedParticipant, convertedLadderHeight)
    }
    return "입력하신 수를 확인해 주세요."
}

//입력: "12" -> 출력: 12(Int), 입력: "asd" -> 출력: 0
func convertToInt(_ valueToConvert:String) -> Int {
    guard let convertedValue = Int(valueToConvert) else { return 0 }
    return convertedValue
}

//입력: 2(참가자 수), 2(사다리 높이) -> 출력: |-|\n| |\n
func makeLadder(_ participant:Int, _ maximumLadderHeight:Int) -> String {
    var ladder = ""
    for _ in 0..<maximumLadderHeight {
        for i in makeHorizontalOfLadder(participant) {
            ladder += i
        }
    }
    return ladder
}

//입력: 3 -> 출력: ["|","-","|"," ","|"]
func makeHorizontalOfLadder(_ participant:Int) -> [String]{
    var horizontalOfLadder = Array(repeating: "|", count: (participant * 2) - 1)
    var elementsBetweenBars = Array(repeating: " ", count: participant - 1)
    let random = arc4random_uniform(UInt32(participant) - 1)
    elementsBetweenBars[Int(random)] = "-"
    for i in 0..<elementsBetweenBars.count {
        horizontalOfLadder[(i * 2) + 1] = elementsBetweenBars[i]
    }
    horizontalOfLadder.append("\n")
    return horizontalOfLadder
}

print(initialize())
