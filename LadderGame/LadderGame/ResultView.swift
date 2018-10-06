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

struct ResultView {
    private var ladder: [[Bool]]
    private var players: [LadderPlayer]
    
    init(ladder: [[Bool]], players: [LadderPlayer]) {
        self.ladder = ladder
        self.players = players
    }
    
    // 사다리를 출력하는 함수
    func printOut() {
        for step in ladder {
            printOneStepUsing(step)
        }
    }
    
    // --------------------내부에서만 호출하는 메소드---------------------
    
    // 추상화된 사다리 정보를 출력을 위해 변환
    private func legToVisible(step: Bool) -> String {
        let have = "-----", none = "     "
        
        if step == true {
            return have
        }
        
        return none
    }
    
    // 사다리 중 한 계단을 출력하는 함수
    private func printOneStepUsing(_ leg: [Bool]) {
        var visibleLeg = String()
        let edge = "|"
        
        for i in leg {
            visibleLeg += legToVisible(step: i) + edge
        }
        
        print("\(edge)\(visibleLeg)")
    }
}
