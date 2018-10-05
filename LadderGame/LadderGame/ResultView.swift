//
//  ResultView.swift
//  LadderGame
//
//  Created by 윤동민 on 2018. 10. 5..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    // 사다리를 출력
    func printLadder(ladderHeight: Int, ladder: [[LadderStep]]){
        for index in 0..<ladderHeight{
            print("   ", terminator: "")
            for onestep in ladder[index]{
                print("\(onestep.ladderOneStep)", terminator: "")
            }
            print("")
        }
    }
    
    // 플레이어 이름 출력
    func printPlayersName(names: [LadderPlayer]){
        for player in names{
            print(" \(player.playerName)", terminator: "")
            plusSpaceAfterName(nameCount: player.playerName.count)
        }
    }
    
    // 이름의 글자 수에 따라 공백 생성
    private func plusSpaceAfterName(nameCount: Int){
        for _ in 0..<5-nameCount {
            print(" ", terminator: "")
        }
    }
}
