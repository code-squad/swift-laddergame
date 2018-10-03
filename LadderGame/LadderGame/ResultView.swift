//
//  resultView.swift
//  LadderGame
//
//  Created by 김장수 on 2018. 10. 1..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

// ResultValue 객체는 LadderGame에서 만들어진 사다리 뼈대를
// 사다리 모양으로 출력해주는 메소드를 보유

struct ResultValue {
    // 사다리를 출력하는 함수
    func printOut(_ ladder: [[Bool]], _ players: [LadderPlayer]) {
        for step in ladder {
            printOneStepUsing(step)
        }
        
        // 참가자 이름을 사다리 하단에 출력하는 함수
        let list = markList(players)
        print(list)
    }
    
    // --------------------내부에서만 호출하는 메소드---------------------
    
    // 추상화된 사다리 정보를 출력을 위해 변환
    private func legToVisible(existence: Bool) -> String {
        let have = "-----", none = "     "
        
        if existence == true {
            return have
        }
        
        return none
    }
    
    // 사다리 중 한 계단을 출력하는 함수
    private func printOneStepUsing(_ leg: [Bool]) {
        var visibleLeg = String()
        let edge = "|"
        
        for i in leg {
            visibleLeg += legToVisible(existence: i) + edge
        }
        
        print("   \(edge)\(visibleLeg)")
    }
    
    // 참가자 이름의 길이를 체크하는 함수
    private func checkLengthOf(_ playerName: String) -> String {
        let length:Int = playerName.count
        switch length {
        case let length where length == 5:
            return " \(playerName)"
        case let length where length == 4:
            return "  \(playerName)"
        case let length where length == 3:
            return "   \(playerName)"
        case let length where length == 2:
            return "    \(playerName)"
        default:
            return "\n이름을 똑바로 입력해주세요\n"
        }
    }
    
    // 사다리 아래 참가자를 넣어주는 함수
    private func markList(_ players: [LadderPlayer]) -> String {
        var list = ""
        
        for player in players {
            list += checkLengthOf(player.name)
        }
        
        return list
    }
}
