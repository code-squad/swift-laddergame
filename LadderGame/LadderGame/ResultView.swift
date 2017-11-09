//
//  ResultView.swift
//  LadderGame
//
//  Created by YOUTH on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    let ladderInfo : LadderGame
    
    init (_ ladderInfo: LadderGame) {
        self.ladderInfo = ladderInfo
    }
    
    //프로그램의 메인 사다리 출력하는 함수
    func printMainLadder() {
        for _ in 0..<ladderInfo.height {
            print("  |", terminator: "")
            for _ in 0..<ladderInfo.players.count-1 {
                print(generateRandomBar(), terminator: "|")
            }
            print("")
        }
        printPlayerNames()
    }
    
    //LadderGame에서 넘겨준 Bool값에 따라 사다리 중간 수평 bar의 모양을 리턴
    private func generateRandomBar() -> String {
        if ladderInfo.makeRandomBar() == true {
            return "-----"
        } else {
            return "     "
        }
    }
    
    //메인 사다리의 마지막 줄에 player이름들을 출력하는 함수
    private func printPlayerNames() {
        for turn in 0..<ladderInfo.players.count {
            print("",ladderInfo.players[turn].name, separator:" ", terminator:"  ")
        }
        print("")
    }
    
}

