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
}
