//
//  ResultView.swift
//  ladderGameStep3
//
//  Created by Choi Jeong Hoon on 2017. 11. 6..
//  Copyright © 2017년 JH Factory. All rights reserved.
//

import Foundation

// 사다리를 출력하는 구조체
struct ResultView {
    private enum LadderElements: String {
        case verticalLine = "-----"
        case horizontalLine = "|"
        case whiteSpace = "     "
    }
    
    // 0. LadderGame의 인스턴스 생성
    private let ladderGame : LadderGame
    init (_ ladderGame: LadderGame) {
        self.ladderGame = ladderGame
    }
    
    // 1. 불값을 사다리요소로 바꿔주는 함수
    private func transferBooltoString(hasLadder: Bool) -> String{
        return hasLadder ? LadderElements.verticalLine.rawValue : LadderElements.whiteSpace.rawValue
    }
    
    // 2. 랜덤불값 배열을 리얼 사다리로 바꾸기
    private func printLadder ()  {
        let player = ladderGame.participant
        let height = ladderGame.height
        var inputArray = ladderGame.makeTwoDimentionalArray(player.count, height)
        for outer in 0 ..< height {
            for inner in 0 ..< player.count-1 {
                let ladderString = transferBooltoString(hasLadder: inputArray[outer][inner])
                print("|\(ladderString)", terminator: "")
            }
            print("|")
        }
    }
    
    // 3. 참가자 이름을 출력하는 메소드
    private func printNames () {
        let player = ladderGame.participant
        for name in 0 ..< player.count {
            print(player[name].name, terminator: " ")
        }
        print ()
    }
    
    // 4. 출력기능만 담당하는 함수 (사다리와 참가자를 출력)
      func printFullLadder () {
        printLadder()
        printNames()
    }
}
