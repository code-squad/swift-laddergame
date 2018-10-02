//
//  ResultView.swift
//  LadderGame
//
//  Created by 윤지영 on 2018. 9. 21..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    
    static private let step = "-----"
    static private let noStep = "     "
    
    static private let leftMargin = "  "
    static private let verticalLine = "|"
    static private let noNewLine = ""
    
    static private let whitespace = " "
    
    // -------- 사다리 출력 --------
    // 하나의 행을 출력 (true: "-----|" false: "     |")
    static private func printSingle(_ column:LadderStep) {
        if(column.step==true) {
            print(step, terminator: verticalLine)
            return
        }
        print(noStep, terminator: verticalLine)
    }
    // 위 printSingle(column)으로 만든 행으로 하나의 열을 완성
    static private func printSingle(_ row:[LadderStep]) {
        for column in row {
            printSingle(column)
        }
    }
    // 위 printSingle(row)으로 만든 열로 사다리 완성
    static private func printLadder(_ ladder:[[LadderStep]]) {
        for row in ladder {
            print(leftMargin, terminator: verticalLine)
            printSingle(row)
            print(noNewLine)
        }
    }
    
    // -------- 이름 출력 --------
    // 이름 뒤 공백추가해 5글자로 만들어주기
    static private func printWhiteSpace(nameLength:Int) {
        for _ in 0...(5-nameLength) {
            print(whitespace, terminator: noNewLine)
        }
    }
    // 하단에 참여자 이름 출력하기
    static private func printPlayers(_ names:[String]){
        for name in names {
            print(name, terminator: noNewLine)
            printWhiteSpace(nameLength: name.count)
        }
    }
    
    // 최종 게임 출력
    static func printGame(_ ladderGameDTO:LadderGameDTO) {
        printLadder(ladderGameDTO.ladder)
        printPlayers(ladderGameDTO.playerNames)
    }
    
}
