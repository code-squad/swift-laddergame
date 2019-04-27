//
//  message.swift
//  LadderGame
//
//  Created by JH on 28/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

//사람수와 사다리수로 enum을 사용하여 구분하고 케이스별로 출력할 문구를 정리.
enum Type {
    case peopleNum
    case ladderNum
    
    var inputMessage: String {
        switch self {
        case .peopleNum:
            return "참여할 사람은 몇 명 인가요?"
        case .ladderNum:
            return "최대 사다리 높이는 몇 개인가요?"
        }
    }
}
//메세지를 출력하는 함수
func showMessage(getType: Type) {
    switch getType {
    case .peopleNum:
        print(Type.peopleNum.inputMessage)
    case .ladderNum:
        print(Type.ladderNum.inputMessage)
    }
}
