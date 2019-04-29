//
//  InputView.swift
//  LadderGame
//
//  Created by JH on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    var playerNames = Array<String>()
    
    //메세지를 출력하는 함수
    func showMessage(getType: Message) {
        switch getType {
        case .peopleNum:
            print(Message.peopleNum.inputMessage)
        case .ladderNum:
            print(Message.ladderNum.inputMessage)
        }
    }
    
    func inputUserPlayerName(messageType: Message) -> LadderPlayer {
        showMessage(getType: messageType)
        let inputName = readLine()!
        
        var player = LadderPlayer()
        player.names = inputName.components(separatedBy: ",")
        
        return player
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
    
    //플레이어입력의 에러를 체크하고 행동하는 함수
    mutating func checkPlayerError() -> [String] {
        let checkPlayer = inputUserPlayerName(messageType: Message.peopleNum)
        
        do {
            try showPlayerError(chNames: checkPlayer)
            
        } catch UserInputError.overNameCount {
            exit(0)
        } catch UserInputError.incorrectPlayerData {
            exit(0)
        } catch {
            print("모든상황에러")
        }
        self.playerNames = checkPlayer.names
        return checkPlayer.names
    }
    
    //사다리층입력의 에러를 체크해서 행동하는 함수
    func checkLadderError() -> Int {
        let checkLadder = inputUserLadderCount(messageType: Message.ladderNum)
        
        do {
            try showLabberError(chladderNum: checkLadder)
            
        } catch UserInputError.incorrectLadderData {
            exit(0)
        } catch {
            print("모든상황에러")
        }
        return checkLadder
    }
    
    
    
    
}
