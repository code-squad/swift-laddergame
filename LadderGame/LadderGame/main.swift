//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


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

//입력: 2 -> 출력: false, 입력: 3 -> 출력: true
func checkMinimum(number:Int) -> Bool {
    return number >= 3 ? true : false
}

func main(){
    print("참여할 사람은 몇 명 인가요?(3이상의 수를 입력해주세요.)")
    guard let participant = readLine() else { return }
    print("최대 사다리 높이는 몇 개인가요?(3이상의 수를 입력해주세요.)")
    guard let maximumLadderHeight = readLine() else { return }
    
    let convertedParticipant = convertToInt(participant)
    let convertedLadderHeight = convertToInt(maximumLadderHeight)
    
    if checkMinimum(number: convertedParticipant) && checkMinimum(number: convertedLadderHeight) {
        print(makeLadder(convertedParticipant, convertedLadderHeight))
    }
}

main()
