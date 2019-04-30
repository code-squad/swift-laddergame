//
//  InputView.swift
//  LadderGame
//
//  Created by JH on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    //메세지를 출력하는 함수
    func showMessage(getType: Message) {
        switch getType {
        case .peopleNum:
            print(Message.peopleNum.inputMessage)
        case .ladderNum:
            print(Message.ladderNum.inputMessage)
        }
    }
    
    func inputUserPlayerName(messageType: Message) -> Array<String> {
        showMessage(getType: messageType)
        let inputName = LadderPlayer(name: readLine()!)
        let names = inputName.name.components(separatedBy: ",")
        return names
    }
    
    //사라리높이 입력받는 함수
    func inputUserLadderCount(messageType: Message) -> Int {
        showMessage(getType: messageType)
        let inputCount = readLine()!
        guard let ladderNum = Int(inputCount) else {
            return 0
        }
        return ladderNum
    }
}
