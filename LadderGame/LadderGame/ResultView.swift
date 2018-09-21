//
//  ResultView.swift
//  LadderGame
//
//  Created by 윤지영 on 2018. 9. 21..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    var ladder : [[LadderStep]]
    
    // 하나의 행을 출력 (true: "-----|" false: "     |")
    func printSingle(_ column:LadderStep) {
        if(column.step==true) {
            Swift.print("-----", terminator: "|")
            return
        }
        Swift.print("     ", terminator: "|")
    }
    
    // 위 printSingle(column)으로 만든 행으로 하나의 열을 완성
    func printSingle(_ row:[LadderStep]) {
        for column in row {
            printSingle(column)
        }
    }
    
    // 이름 출력형식 가운데정렬해서 리턴
    func center(_ player:LadderPlayer) -> String {
        switch player.name.count {
        case 1:
            return "   \(player.name)  "
        case 2:
            return "  \(player.name)  "
        case 3:
            return "  \(player.name) "
        case 4:
            return " \(player.name) "
        case 5:
            return "\(player.name) "
        default:
            return "     "
        }
    }
    
    // 하단에 참여자 이름 출력하기
    func print(players:[LadderPlayer]){
        for player in players {
            Swift.print(center(player), terminator: "")
        }
    }
    
    // 위 printSingle(row)으로 만든 열로 사다리 완성
    func print(ladder:[[LadderStep]], players:[LadderPlayer]) {
        for row in ladder {
            Swift.print("  ", terminator: "|")
            printSingle(row)
            Swift.print("")
        }
        print(players:players)
    }
    
}
