//
//  InputView.swift
//  LadderGame
//
//  Created by 윤지영 on 2018. 9. 21..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

enum guideMessage : String {
    case playerNames = "참여할 사람의 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)"
    case maxHeight = "최대 사다리 높이는 몇 개인가요?"
}

struct InputView {
    private var guideMessage : guideMessage
    
    init(guideMessage:guideMessage) {
        self.guideMessage = guideMessage
    }
    
    func getInput() -> String {
        print(self.guideMessage.rawValue)
        guard let input:String = readLine() else { return String() }
        return input
    }
}
