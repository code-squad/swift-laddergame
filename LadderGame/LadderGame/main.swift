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
    ladder = makeLadder(applicants: applicants, height: ladderHeight)
    
    displayLadder(ladder)
}

func getInputValue(comment: String) -> Int?{
    print(comment)
    let rawInput = readLine()
    if let rawInput = rawInput {
        return Int(rawInput)
    }
    return nil
}

func makeLadder(applicants: Int, height: Int) -> LadderType {
    let frame = makeLadderFrame(applicants: applicants, height: height)
    let ladder = insertBridge(to: frame)
    return ladder
}

func makeLadderFrame(applicants: Int, height: Int) -> LadderType {
    let emptyLadder:LadderType = [[String]].init(repeating: [], count: height) // [ [], [], [], .... ]
    let frame = emptyLadder.map { (_) -> [String] in
        return makeLadderStageFrame(applicants)
    }
    return frame
}

func makeLadderStageFrame(_ applicants: Int) -> [String]{
    let stage = [String].init(repeating: "|", count: applicants * 2 - 1) // [ "|", "|", "|", "|", "|"]
    let result = stage.enumerated().map({ $0.offset % 2 != 0 ? " " : $0.element}) // ["|", " ", "|", " ", "|"]
    return result
}

func insertBridge(to frame: LadderType) -> LadderType{
    let ladderFrame = frame
    let ladderWithBridge = ladderFrame.map {$0.map(makeRandomBridge)}
    return ladderWithBridge
}

func makeRandomBridge(space: String) -> String {
    let shouldInsertBridge = Int(arc4random_uniform(2))
    if space == " " && shouldInsertBridge == 1{ // 빈 공간에서 1 이면 다리를 만들고 0 이면 패스
        return "-"
    }
    return space
}

func displayLadder(_ ladder: LadderType){
    ladder.forEach(displayStage)
}

func displayStage(_ stage: [String]) {
    stage.forEach({print($0, terminator:"")})
    print("")
}

startGame()

