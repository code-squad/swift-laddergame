//
//  ResultView.swift
//  LadderGame
//
//  Created by 심 승민 on 2017. 10. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView{
    var game: LadderGame
    
    init(of game: LadderGame) {
        self.game = game
    }
    
    // 전체 사다리 출력 함수.
    func drawLadder(){
        // 랜덤으로 사다리(-) 생성.
        let transLinePos = self.game.transverLine
        // 모든 줄(row) 출력.
        for rows in transLinePos{
            drawLadderOf(row: rows)                 // 한 줄(row) 출력.
            printVerticalLine(hasLineFeed: true)    // 한 줄이 끝나면 마지막 '|' 출력 후 개행.
        }
        printNames(of: self.game.names)
    }
    
    // 한 줄(row)의 사다리를 출력.
    private func drawLadderOf(row currRows: [Bool]){
        for elem in currRows{
            printVerticalLine(hasLineFeed: false)   // 첫 '|' 출력.
            printTransverseLine(elem)               // 사다리가 있으면 사다리 출력.
            printEmptySpace(elem)                   // 사다리 없으면 공백 출력.
        }
    }
    
    private func printVerticalLine(hasLineFeed: Bool){
        guard hasLineFeed else{
            // 출력. (좌측 세로줄)
            print("|", terminator: "")
            return
        }
        // 출력 및 개행. (우측 세로줄)
        print("|")
    }
    
    private func printNames(of playerNames: [LadderPlayer]){
        // 플레이어 이름 출력.
        for player in playerNames{
            print(player.name, terminator: "  ")
        }
        print("\n")     // 이름 출력 후 다음 input 명령과의 간격.
    }
    
    private func printTransverseLine(_ transverseLineExist: Bool){
        if transverseLineExist {
            // 사다리가 있으면 출력.
            print("-----", terminator:"")
        }
    }
    
    private func printEmptySpace(_ transverseLineExist: Bool){
        if !transverseLineExist{
            // 사다리가 없으면 공백 출력.
            print("     ", terminator:"")
        }
    }
}
