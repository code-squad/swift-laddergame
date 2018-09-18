//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


//입력: "12" -> 출력: 12(Int), 입력: "asd" -> 출력: 0
func convert(_ value:String) -> Int {
    guard let convertedValue = Int(value) else { return 0 }
    return convertedValue
}

//입력: 2 -> 출력: false, 입력: 3 -> 출력: true
func checkMinimum(number:Int) -> Bool {
    return number >= 2 ? true : false
}

//입력: 3, 4 -> 출력: [["-", " "], [" ", " "], ["-", " "], ["-", " "]]
func makeLadder(_ participant:Int, _ maximumLadderHeight:Int) -> [[String]] {
    var ladder = Array(repeating: Array(repeating: "", count: participant - 1), count: maximumLadderHeight)
    
    for i in 0..<ladder.count {
        ladder[i] = insertRandomElementsTo(ladder[i])
        ladder[i] = removeConnectedGripOf(ladder[i])
    }
    
    return ladder
}

//입력: ["",""], 3 -> 출력: ["-", " "]
func insertRandomElementsTo(_ ladder:[String]) -> [String]{
    var insertedLadder = ladder
    let elementsBetweenBars = [" ","-"]
    var randomElement = ""
    
    for i in 0..<insertedLadder.count {
        randomElement = elementsBetweenBars[Int(arc4random_uniform(2))]
        insertedLadder[i] = randomElement
    }
    
    return insertedLadder
}

//입력: ["-","-","-"] -> 출력: ["-", " ", "-"]
func removeConnectedGripOf(_ ladder:[String]) -> [String]{
    var ladderWithRemovedGrip = ladder
    
    for i in 0..<ladderWithRemovedGrip.count - 1 {
        if ladderWithRemovedGrip[i] == "-" && ladderWithRemovedGrip[i + 1] == "-" {
            ladderWithRemovedGrip[Int(arc4random_uniform(2)) + i] = " "
        }
    }
    
    return ladderWithRemovedGrip
}

func show(ladder:[[String]]) {
    for i in ladder {
        showLayerOf(ladder: i)
        print("|")
    }
}

func showLayerOf(ladder:[String]) {
    for i in ladder {
        print("|", terminator: "")
        print(i, terminator: "")
    }
}

func main(){
    print("참여할 사람은 몇 명 인가요?(2이상의 수를 입력해주세요.)")
    guard let participant = readLine() else { return }
    print("최대 사다리 높이는 몇 개인가요?(2이상의 수를 입력해주세요.)")
    guard let maximumLadderHeight = readLine() else { return }

    let convertedParticipant = convert(participant)
    let convertedLadderHeight = convert(maximumLadderHeight)

    if checkMinimum(number: convertedParticipant) && checkMinimum(number: convertedLadderHeight) {
        show(ladder: makeLadder(convertedParticipant, convertedLadderHeight))
        return
    }
    print("2이상의 수를 입력해주세요.")
}

main()

