//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

/*
 1. Frame : 길만 있는 것. (세로)
 2. Bridge : 길과 길을 연결 (가로)
*/

import Foundation

typealias LadderType = [[String]]

func startGame(){
    var ladder:LadderType = []
    guard let applicants = getInputValue(comment: "참여할 사람은 몇 명 인가요?") else { return }
    guard let ladderHeight = getInputValue(comment: "최대 사다리 높이는 몇 개인가요?") else { return }
    ladder = generateLadder(applicants: applicants, height: ladderHeight)
    display(ladder: ladder)
}

func getInputValue(comment: String) -> Int?{
    print(comment)
    let rawInput = readLine()
    if let rawInput = rawInput {
        return Int(rawInput)
    }
    return nil
}

func generateLadder(applicants: Int, height: Int) -> LadderType {
    let frame = generateLadderFrame(applicants: applicants, height: height)
    let ladder = insertBridge(to: frame)
    return ladder
}

func insertBridge(to frame: LadderType) -> LadderType{
    let ladderFrame = frame
    let ladderWithBridge = ladderFrame.map(generateValidStage)
    return ladderWithBridge
}

func generateValidStage(_ stage: [String]) -> [String] {
    var stageWithBridge = stage.enumerated().map(generateRandomBridge)
    while !isValidStage(stageWithBridge) {
        stageWithBridge = stage.enumerated().map(generateRandomBridge)
    }
    return stageWithBridge
}

func generateRandomBridge(transform: (offset: Int, element: String)) -> String {
    let shouldInsertBridge = Int(arc4random_uniform(2))
    if transform.offset % 2 == 1{
        return shouldInsertBridge == 1 ? "-" : " " // 1 이면 다리를 만들고 0 이면 패스
    }
    return transform.element
}

func isValidStage(_ stage:[String]) -> Bool {
    return !stage.joined().contains("-|-")
}

func display(ladder: LadderType){
    ladder.forEach({print($0.joined())})
}

startGame()

