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
        printLadder(ladderDTO: ladderGameDTO)
        printPlayers(playersDTO: ladderGameDTO)
    }
    
    private func printLadder(ladderDTO: LadderGameDTO){
        for rowIndex in 0..<ladderDTO.height{
            print("   ", terminator: "")
            for colummIndex in 0..<ladderDTO.names.count{
                islastIndex(ladderDTO: ladderDTO, row: rowIndex, columm: colummIndex)
            }
            print("")
        }
    }
    
    private func islastIndex(ladderDTO: LadderGameDTO, row: Int, columm: Int){
        if columm == ladderDTO.names.count-1 {
            print("|", terminator: "")
        }
        else{
            print("|", terminator: "")
            printLadderOrSpace(oneStep: ladderDTO.ladder[row][columm].ladderOneStep)
        }
    }
    
    private func printPlayers(playersDTO: LadderGameDTO){
        for player in playersDTO.names{
            print(" \(player.playerName)", terminator: "")
            plusSpaceAfterName(nameCount: player.playerName.count)
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
