//
//  PrintView.swift
//  LadderGame
//
//  Created by Jun ho Lee on 2018. 10. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct PrintView {
    
    //사다리 그리기 요소
    private enum Step: String {
        case have = "-----"
        case none = "     "
    }
    private let drawElements: [Bool:Step] = [true: Step.have, false: Step.none]
    
    //이름 앞뒤에 맞춘 여백값을 보관하는 배열. 이름사이즈 === index
    private let frontMargin = ["   ","  ","  "," "," "," "]
    private let backMargin = ["   ","   ","  ","  "," ",""]
    
    // 이름을 출력
    func orderPlayerNames(players: [LadderPlayer]) {
        var orderedPlayerNames = ""
        for player in players {
            orderedPlayerNames.append("\(frontMargin[player.name.count])\(player.name)\(backMargin[player.name.count])")
        }
        print(orderedPlayerNames)
    }
    
    
    
    // StepData: Bool에 따라 "-----", "     " 반환
    private func drawOneLine(oneFloor: [LadderStep]) -> String {
        //그릴 문자열 맨 왼쪽 세로줄 포함하여 초기화
        var drawnLine = "  |"
        //LadderStep의 bool값을 체크하여 그리기
        for step in oneFloor {
            // enum 언래핑
            guard let haveOrNone = drawElements[step.stepDecision] else {
                return "error"
            }
            drawnLine.append("\(haveOrNone.rawValue)|")
        }
        return drawnLine
    }
    
    // 전체 이중배열을 준비된 문자열로 출력
    func printWholeLine(wholeLadder: [[LadderStep]]) {
        for oneFloor in wholeLadder {
            print(drawOneLine(oneFloor: oneFloor))
        }
    }
    
}
