//
//  ResultView.swift
//  LadderGame
//
//  Created by KIMMINSIK on 2018. 7. 29..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {

    // 출력 함수 -> ResultView
    func ladderFrameCreate(_ playerNumber: Array<String>, _ maxLadderNumber: Int) {
        var maxLadderNumber = maxLadderNumber
        let playerNumberCount = playerNumber.count
        while 0 < maxLadderNumber {
            printLadder(playerNumberCount)
            print("ㅣ")
            maxLadderNumber -= 1
        }
        playerNamePrint(playerNumber)
    }
    func printLadder(_ playerNumberCount: Int) {
        
        let ladderGame = LadderGame()
        
        for _ in 0..<playerNumberCount-1 {
            print("ㅣ", terminator: ladderGame.ladderRowCreater())
        }
    }
    // 플레이어 이름 출력 함수 -> ResultView
    func playerNamePrint(_ playerNames: Array<String>) -> String? {
        let playerNamesPrint = playerNames.joined(separator: ",")
        print(playerNamesPrint.replacingOccurrences(of: ",", with: " "))
        return nil
    }
}
