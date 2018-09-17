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

//입력: 3, 3 -> 출력: [["|", "-", "|", " ", "|"], ["|", "-", "|", " ", "|"], ["|", "-", "|", " ", "|"]]
func makeLadder(_ participant:Int, _ maximumLadderHeight:Int) -> [[String]] {
    var ladder = Array(repeating: Array(repeating: "|", count: participant), count: maximumLadderHeight)
    for i in 0..<ladder.count {
        ladder[i] = makeGripOfLadder(ladder[i])
    }
    return ladder
}

//입력: ["|","|","|"] -> 출력: ["|", "-", "|", " ", "|"]
func makeGripOfLadder(_ ladder:[String]) -> [String]{
    var madeGripLadder = ladder
    var grips = Array(repeating: " ", count: ladder.count - 1)
    let random = arc4random_uniform(UInt32(grips.count))
    grips[Int(random)] = "-"
    
    for i in 0..<grips.count {
        madeGripLadder.insert(grips[i], at: i * 2 + 1)
    }
    
    return madeGripLadder
}

//입력: 2 -> 출력: false, 입력: 3 -> 출력: true
func checkMinimum(number:Int) -> Bool {
    return number >= 3 ? true : false
}

func show(ladder:[[String]]) {
    for i in ladder {
        for j in i {
            print(j, terminator: "")
        }
        print("")
    }
}

func main(){
    print("참여할 사람은 몇 명 인가요?(3이상의 수를 입력해주세요.)")
    guard let participant = readLine() else { return }
    print("최대 사다리 높이는 몇 개인가요?(3이상의 수를 입력해주세요.)")
    guard let maximumLadderHeight = readLine() else { return }

    let convertedParticipant = convert(participant)
    let convertedLadderHeight = convert(maximumLadderHeight)

    if checkMinimum(number: convertedParticipant) && checkMinimum(number: convertedLadderHeight) {
        show(ladder: makeLadder(convertedParticipant, convertedLadderHeight))
    } else {
        print("3이상의 수를 입력해주세요.")
    }
}


main()
