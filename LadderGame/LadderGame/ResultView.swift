//
//  ResultView.swift
//  LadderGame
//
//  Created by YOUTH on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    let ladderInfo : LadderInfo
    
    init (_ ladderInfo: LadderInfo) {
        self.ladderInfo = ladderInfo
    }
    
    //프로그램의 메인 사다리 출력하는 함수
    func printMainLadder() {
        for i in 0..<ladderInfo.randomBars.count {
            print("  |", terminator: "")
            for j in 0..<ladderInfo.randomBars[i].count {
                print(randomBar(i, j), terminator: "|")
            }
            print("")
        }
        printPlayerNames()
    }
    
    //LadderGame에서 넘겨준 Bool값에 따라 사다리 중간 수평 bar의 모양을 리턴
    private func randomBar(_ i: Int, _ j: Int) -> String {
            if ladderInfo.randomBars[i][j] == true {
                return "-----"
            } else {
                return "     "
        }
    }
    
    //메인 사다리의 마지막 줄에 player이름들을 출력하는 함수
    private func printPlayerNames() {
        for turn in 0..<ladderInfo.playerNames.count {
            print("",ladderInfo.playerNames[turn], separator:" ", terminator:"  ")
        }
        print("")
    }
    
}

