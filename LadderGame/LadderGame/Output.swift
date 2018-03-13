//
//  Output.swift
//  LadderGame
//
//  Created by rhino Q on 2018. 3. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
/*
 들여쓰기 depth를  1단계로 줄이기
 메소드의 라인 최대 10줄
 method가 한 가지일만 하도록
 
 */

import Foundation
struct Output {
    private let pillar = "|"
    private let weightOfLadder = "-----"
    private let space = "     "
    private let firstSapce = " "
    func printLadder(_ ladderMatrix:[[Bool]]){
        for row in ladderMatrix{
            print("\(firstSapce)\(pillar)", terminator:"")
            printColOfRow(row)
            print()
        }
    }
    
    private func printColOfRow(_ row:[Bool]){
        for col in row{
            printCol(col: col)
        }
    }
    private func printCol( col:Bool){
        if col == true{
            print("\(weightOfLadder)\(pillar)", terminator:"")
            return
        }
        print("\(space)\(pillar)", terminator:"")
    }
    func printPlayers(_ players:[LadderPlayer]){
        for player in players{
            printPlayer(player)
        }
    }
    
    func printPlayer(_ player:LadderPlayer){
        let emptySapce = repeatElement(" ", count: 6-player.name.count).joined(separator:"")
        print(player.name, terminator:emptySapce)
    }
}
