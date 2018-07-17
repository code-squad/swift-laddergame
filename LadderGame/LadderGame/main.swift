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

func generateLadder(applicants: Int, height: Int) -> [[String]]{
    var ladder: [[String]] = []
    for _ in 0..<height {
        ladder.append(generateValidStage(applicants))
    }
    return ladder
}

func generateValidStage(_ applicant: Int) -> [String] {
    var stage = generateRandomStage(applicant: applicant)
    while !isValidStage(stage) {
        stage = generateRandomStage(applicant: applicant)
    }
    return stage
}

func isValidStage(_ stage: [String]) -> Bool {
    return !stage.joined().contains("--")
}

func generateRandomStage(applicant: Int) -> [String]{
    var stage:[String] = []
    for _ in 0..<applicant - 1 {
        stage.append(generateBridge())
    }
    return stage
}

func generateBridge()-> String {
    let newBridge = arc4random_uniform(2)
    return newBridge == 1 ? "-" : " "
}

func display(ladder: [[String]]) {
    ladder.forEach{print(generateDisplayForm(stage: $0))}
}

func generateDisplayForm(stage: [String]) -> String {
    let displayForm = stage.reduce("|") { "\($0)\($1)|" }
    return displayForm
}

startGame()

