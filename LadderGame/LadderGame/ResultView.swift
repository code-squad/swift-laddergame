//
//  ResultView.swift
//  LadderGame
//
//  Created by jack on 2017. 12. 4..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//
//결과를 출력하는 구조체
import Foundation

struct ResultView {
    //가로줄이 그려진 사다리 배열에 세로줄을 그려 출력하는 함수
    //입력 : 가로줄이 들어가 있는 사다리 배열
    func drawVerticalLines (_ ladderWithHorizontalLine : [String]) {
        print("  |" + ladderWithHorizontalLine[0], terminator: "")
        for i in 1..<ladderWithHorizontalLine.count {
            print("|" + ladderWithHorizontalLine[i], terminator: "")
        }
        print("|")
    }
    //세로줄을 포함한 완성된 사다리 모양을 문자열로 출력하는 함수
    //입력 : 가로줄이 들어가 있는 2차원 사다리 배열
    func printCompleteLadder (ladderSet : [[String]], players : [String]) {
        var playerNames = " "
        for indexOfHeight in 0..<ladderSet.count {
            drawVerticalLines(ladderSet[indexOfHeight])
        }
        for index in 0..<players.count {
            playerNames += players[index] + " "
            
        }
        print(playerNames)
    }
}
