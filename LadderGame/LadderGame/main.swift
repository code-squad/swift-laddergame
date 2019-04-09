//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func getUserInput() -> (numberOfParticipants: Int, ladderHeight: Int)? {
    print("참여할 사람은 몇 명인가요?")
    guard let numberOfParticipants = Int(readLine()!) else { return nil }
    
    print("최대 사다리 높이는 몇 개인가요?")
    guard let ladderHeight = Int(readLine()!) else { return nil }
    
    return (numberOfParticipants, ladderHeight)
}

func makeLadder(numberOfParticipants: Int, ladderHeight: Int) -> [[Bool]] {
    let column = numberOfParticipants * 2 - 1
    let ladder = Array(repeating: Array(repeating: false, count: column), count: ladderHeight)
    
    return ladder
}

func main() {
    guard let userInput = getUserInput() else { return }
    var ladder = makeLadder(numberOfParticipants: userInput.numberOfParticipants, ladderHeight: userInput.ladderHeight)
    
}

main()
