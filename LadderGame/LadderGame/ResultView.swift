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
    func printMainLadder(_ numberOfPlayer: Int, _ height: Int) {
        for _ in 0..<height {
            print("  |", terminator: "")
            for _ in 0..<numberOfPlayer-1 {
                print(generateRandomBar(), terminator: "|")
            }
            print("")
        }
        printPlayerNames(ladderInfo.playerNameTags())
    }
    
    //LadderGame에서 넘겨준 Bool값에 따라 사다리 중간 수평 bar의 모양을 리턴
    private func generateRandomBar( ) -> String {
        if ladderInfo.makeRandomBar() == true {
            return "-----"
        } else {
            return "     "
        }
    }
    
    //메인 사다리의 마지막 줄에 player이름들을 출력하는 함수
    private func printPlayerNames(_ playerNames: [String]) {
        for turn in 0..<playerNames.count{
            print("",playerNames[turn], separator:" ", terminator:"  ")
        }
        print("")
    }
    
    
}
