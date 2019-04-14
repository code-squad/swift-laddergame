//
//  ResultView.swift
//  LadderGame
//
//  Created by joon-ho kil on 4/12/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    /// 사다리를 출력하는 함수
    func printLadder (_ players: [LadderPlayer], _ ladderBoolBoard:[[Bool]]) -> () {
        let maximumHeight = ladderBoolBoard.count
        
        for heightIndex in 0..<maximumHeight {
            printLadderRow(ladderBoolRow: ladderBoolBoard[heightIndex])
        }
        printPlayerName(players)
    }
    
    /// 사다리 한줄을 출력하는 함수
    func printLadderRow (ladderBoolRow:[Bool]) -> () {
        let players = ladderBoolRow.count
        print("  ", terminator: "")
        for playerIndex in 0..<players-1 {
            print("|", terminator: "")
            switch ladderBoolRow[playerIndex] {
            case true : print("-----", terminator: "")
            case false : print("     ", terminator: "")
            }
        }
        print("|")
    }
    
    /// 사다리 마지막에 참가자 이름을 출력하는 함수
    func printPlayerName (_ players: [LadderPlayer]) -> () {
        printWhiteSpaceBeforeFirstPlayerName(players[0].name.count)
        
        for player in players {
            print("\(player.name)", terminator: "")
            printWhiteSpaceAfterPlayerName(player.name.count)
        }
        print("")
    }
    
    /// 첫번째 이름 출력하기 전 공백을 출력하는 함수
    func printWhiteSpaceBeforeFirstPlayerName (_ fisrtPlayerNameCharacterCount: Int) {
        switch fisrtPlayerNameCharacterCount {
        case 1: print("  ", terminator: "")
        case 2: print(" ", terminator: "")
        case 3: print(" ", terminator: "")
        case 4: print(" ", terminator: "")
        case 5: print("", terminator: "")
        default: print("", terminator: "")
        }
    }
    
    /// 이름 뒤에 공백을 출력하는 함수
    func printWhiteSpaceAfterPlayerName (_ playerNameCharacterCount: Int) {
        switch playerNameCharacterCount {
        case 1: print("     ", terminator: "")
        case 2: print("    ", terminator: "")
        case 3: print("    ", terminator: "")
        case 4: print("   ", terminator: "")
        case 5: print(" ", terminator: "")
        default: print("", terminator: "")
        }
    }
}
