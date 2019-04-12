//
//  InputView.swift
//  LadderGame
//
//  Created by jang gukjin on 12/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

/// 사용자의 입력을 받는 구조체
struct InputView {
    /// 사람과 사다리의 수를 입력받는 함수
    static func inputName()->[String] {
        print("참여할 사람 이름을 입력하세요")
        let nameText = readLine()
        if nameText != nil {
            let names = String(nameText!)
            return names.split(separator: ",").map{ String($0) }
        }
        return []
    }
    
    static func inputHeight()->Int {
        print("최대 사다리 높이는 몇개인가요")
        let heightText = readLine()
        guard let heightPositiveNumber = UInt(heightText!) else {
            return 0
        }
        let height = Int(heightPositiveNumber)
        return height
    }
}
