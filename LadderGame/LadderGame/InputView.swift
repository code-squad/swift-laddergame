//
//  InputView.swift
//  LadderGame
//
//  Created by 윤지영 on 2018. 9. 21..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

public enum InputError: Error {
    case invalidType
    case outOfNameLength
}

struct InputView {
    var guideMessage : [String]
    var ladderGame : LadderGame
    
    init() {
        guideMessage = ["참여할 사람의 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)", "최대 사다리 높이는 몇 개인가요?"]
        ladderGame = LadderGame(height:0, playerNames:[])
    }
    
    // guide 메세지를 프린트 + 입력값을 받아와서 문자열로 리턴하는 함수
    func getInput(_ guideMessage:String) -> String {
        print(guideMessage)
        guard let input:String = readLine() else { return String() }
        return input
    }
    
    // 문자열을 ,로 분리해서 문자열배열로 리턴하는 함수
    func separate(inputNames:String) -> [String] {
        return inputNames.split(separator: ",").map({String($0)})
    }
    
    // 입력한 이름들에 대해 최대허용글자수 체크하여 Bool 리턴하는 함수
    func isOutOf(allowedLength:Int, names:[String]) -> Bool {
        for name in names {
            if(name.count > allowedLength) { return true }
        }
        return false
    }
    
    // 위 문자열과 문자열배열로 ladderGame 값을 변경해주는 함수
    mutating func writeInfoOf(_ maxHeight:Int, _ playerNames:[String]) {
        ladderGame.height = maxHeight
        for name in playerNames {
            ladderGame.playerNames.append(LadderPlayer(name:name))
        }
    }
    
    mutating func execute() throws {
        var input = getInput(guideMessage[0])
        let playerNames:[String] = separate(inputNames: input)
        if isOutOf(allowedLength: 5, names: playerNames) { throw InputError.outOfNameLength }
        
        input = getInput(guideMessage[1])
        guard let maxHeight:Int = Int(input) else { throw InputError.invalidType }
        
        writeInfoOf(maxHeight, playerNames)
    }

}
