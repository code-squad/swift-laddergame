//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func inputValue() -> Int {
    guard let value = readLine() else {return 0}
    return convertStringToInt(value)
}

//입력: "12" -> 출력: 12(Int), 입력: "asd" -> 출력: 0
func convertStringToInt(_ value:String) -> Int {
    guard let convertedValue = Int(value) else { return 0 }
    return convertedValue
}

//입력: 2 -> 출력: false, 입력: 2 -> 출력: true
func checkMinimum(number:Int) -> Bool {
    return number >= 2 ? true : false
}

//입력: 3,4 -> 출력: [[false, true], [true, false], [false, true], [true, false]]
func makeLadder(_ participant:Int, _ ladderHeight:Int) -> [[Bool]]{
    var ladder = Array(repeating: Array(repeating: false, count: participant - 1), count: ladderHeight)
    for i in ladder.startIndex..<ladder.endIndex {
        ladder[i] = insertGripOn(ladder[i])
        ladder[i] = removeConnectedGripOf(ladder[i])
    }
    return ladder
}

//입력: [false,false,false] -> 출력: [false,true,true]
func insertGripOn(_ ladder:[Bool]) -> [Bool]{
    var insertedLadder = ladder
    for i in insertedLadder.startIndex..<insertedLadder.endIndex {
        insertedLadder[i] = outputTrueOrFalse()
    }
    return insertedLadder
}

func outputTrueOrFalse() -> Bool {
    return arc4random_uniform(UInt32(2)) == 1
}

//입력: [true,true,true] -> 출력: [true,false,true]
func removeConnectedGripOf(_ ladder:[Bool]) -> [Bool] {
    var ladderWithRemovedGrip = ladder
    for i in ladderWithRemovedGrip.startIndex..<ladderWithRemovedGrip.endIndex - 1 {
        ladderWithRemovedGrip[i+1] = removeGrip(left: ladderWithRemovedGrip[i], right: ladderWithRemovedGrip[i+1])
    }
    return ladderWithRemovedGrip
}

func removeGrip(left:Bool, right:Bool) -> Bool{
    if left == right && right == true {
        return false
    }
    return right
}

func show(_ ladder:[[Bool]]) {
    for i in ladder {
        showLayerOf(ladder: i)
    }
}

func showLayerOf(ladder:[Bool]) {
    let ladderInfo:[Bool:String] = [true:"-", false:" "]
    for i in ladder {
        print("|", terminator: "")
        print(ladderInfo[i] ?? " ", terminator: "")
    }
    print("|")
}

func main(){
    print("참여할 사람은 몇 명 인가요?(2이상의 수를 입력해주세요.)")
    let participant = inputValue()
    print("최대 사다리 높이는 몇 개인가요?(2이상의 수를 입력해주세요.)")
    let ladderHeight = inputValue()
    
    if checkMinimum(number: participant) && checkMinimum(number: ladderHeight) {
        let ladder = makeLadder(participant, ladderHeight)
        show(ladder)
        return
    }
    print("2이상의 수를 입력해주세요.")
}

main()
