//
//  ResultView.swift
//  LadderGame
//
//  Created by 윤동민 on 2018. 10. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    // 사다리를 출력
    func printLadder(ladderHeight: Int, ladder: [[LadderStep]]){
        for rowIndex in 0..<ladderHeight{
            print("   ", terminator: "")
            for colummIndex in 0..<ladder[rowIndex].count{
                separatePlayerAndLadder(rowLadder: ladder[rowIndex][colummIndex], index: colummIndex)
            }
            print("")
        }
    }
    
    // 플레이어의 자리와 사다리 한 스텝을 구분하여 출력
    func separatePlayerAndLadder(rowLadder: LadderStep, index: Int){
        if index % 2 == 0{
            print("|", terminator: "")
        }
        else{
            printLadderOrSpace(oneStep: rowLadder.ladderOneStep)
        }
    }
    
    // True인 경우 "-----" 다리 출력, False인 경우 "     " 공백 출력
    func printLadderOrSpace(oneStep: Bool){
        if oneStep == true{
            print("-----", terminator: "")
        }
        else{
            print("     ", terminator: "")
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
