//
//  InputView.swift
//  LadderGame
//
//  Created by JH on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    func inputUserPlayerName(messageType: Type) -> LadderPlayer {
        showMessage(getType: messageType)
        let inputName = readLine()!
        
        var player = LadderPlayer()
        player.names = inputName.components(separatedBy: ",")
        
        return player
    }
    
    //사라리높이 입력받는 함수
    func inputUserLadderCount(messageType: Type) -> Int {
        showMessage(getType: messageType)
        let inputCount = readLine()!
        guard let ladderNum = Int(inputCount) else {
            return 0
        }
        return ladderNum
    }
    
}
