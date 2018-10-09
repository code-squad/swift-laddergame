//
//  ResultView.swift
//  LadderGame
//
//  Created by 윤동민 on 2018. 10. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    // 출력
    func printResult(ladderGameDTO: LadderGameDTO){
        for rowIndex in 0..<ladderGameDTO.height{
            print("   ", terminator: "")
            for colummIndex in 0..<ladderGameDTO.ladder[rowIndex].count{
                separatePlayerAndLadder(rowLadder: ladderGameDTO.ladder[rowIndex][colummIndex], index: colummIndex)
            }
            print("")
        }
        for player in ladderGameDTO.names{
            print(" \(player.playerName)", terminator: "")
            plusSpaceAfterName(nameCount: player.playerName.count)
        }
    }
    
    // 플레이어의 자리와 사다리 한 스텝을 구분하여 출력
    private func separatePlayerAndLadder(rowLadder: LadderStep, index: Int){
        if index % 2 == 0{
            print("|", terminator: "")
        }
        else{
            printLadderOrSpace(oneStep: rowLadder.ladderOneStep)
        }
    }
    
    // True인 경우 "-----" 다리 출력, False인 경우 "     " 공백 출력
    private func printLadderOrSpace(oneStep: Bool){
        if oneStep == true{
            print("-----", terminator: "")
        }
        else{
            print("     ", terminator: "")
        }
    }
    
    // 이름의 글자 수에 따라 공백 생성
    private func plusSpaceAfterName(nameCount: Int){
        for _ in 0..<5-nameCount {
            print(" ", terminator: "")
        }
    }
}
