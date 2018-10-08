//
//  InputView.swift
//  LadderGame
//
//  Created by 윤동민 on 2018. 10. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView{
    
    // 참여할 플레이어 이름을 입력받음
    func inputJoinPlayersName() -> String{
        print("참여할 사람 이름을 입력하세요.")
        guard let players = readLine() else{
            return "Error"
        }
        return players
    }
    
    // 유저로 부터 입력받은 이름을 ","을 기준으로 나누어 준다.
    func splitUserInputName(userInput: String) -> [LadderPlayer]{
        var userList : [LadderPlayer] = []
        let splitUserNames : [String] = userInput.split(separator: ",").map(String.init)
        for name in splitUserNames{
            if checkPlayNameCount(receiveName: name){ userList.append( LadderPlayer(name: name) ) }
        }
        return userList
    }
    
    // 플레이어의 이름이 5글자 이상 입력되었는지 검사
    private func checkPlayNameCount(receiveName: String) -> Bool{
        if receiveName.count > 5 { return false }
        return true
    }
    
    // 플레이어의 네임이 제대로 한 명도 입력되지 않은 경우 False 리턴
    func isRightUserNameInput(userNames: [LadderPlayer]) -> Bool{
        guard userNames.count == 0 else {
            return true
        }
        return false
    }
    
    // 사다리의 최대 높이를 입력받음
    func inputLadderOfHeight() -> Int{
        print("최대 사다리의 높이를 입력하세요.")
        guard let ladderHeight = readLine() else {
            return -1
        }
        return Int(ladderHeight) ?? -1
    }
    
    // 사용자의 사다리 높이 입력 값을 검사
    func isRightUserHeightInput(input: Int) -> Bool{
        guard input > -1 else {
            return false
        }
        return true
    }
}
