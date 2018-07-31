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
    func printLadder(_ playerNumber: Int) {
        
        let ladderStep = LadderStep()
        
        for _ in 0..<playerNumber-1 {
            print("ㅣ", terminator: ladderStep.ladderRowCreater())
        }
    }
    // 플레이어 이름 출력 함수 -> ResultView
    func playerNamePrint() {
        let inputView = InputView()
        print(inputView.inputUserName!.replacingOccurrences(of: ",", with: " "))
    }
}
