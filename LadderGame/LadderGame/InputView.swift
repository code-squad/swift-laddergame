//
//  InputView.swift
//  LadderGame
//
//  Created by 이동영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView{
    
    private enum Question:String,CaseIterable{
        case aboutNameOfPlayers = "참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)"
        case aboutHeightOfLadder = "최대 사다리의 높이는 몇 개 인가요?"
    }
    /**
     질문을 입력받고 사용자에게 대답을 얻어서 반환한다.
     
     - parameter question: 질의문
     - throws: Wrong Input
     - returns: String      사용자응답
     */
    private func ask(question:Question) throws ->(String){
        print(question.rawValue)
        guard let input = readLine() else {
            throw ErrorType.wrongInput
        }
        return input
    }
    /**
     참가자들의 이름으로 구성된 문자열을 받아서 [LadderPlayer] 로 반환하는 메소드
     
     - parameter string: 참가자들의 이름으로 된 문자열
     - parameter separator: 구분자
     
     - returns: [LadderPlayer]  -  참가자의 배열
     */
    private func stringToPlayers(_ string:String) throws ->([LadderPlayer]){
        let names = string.split(separator: ",")
        let players = try names.map{
            name in
            return (try LadderPlayer(name: String(name)))
        }
        return players
    }
    /**
     문자열을 입력받고 0보다 큰 정수를 반환한다.
     
     - parameter string: Int로 바꿀 문자열
     
     - returns: Int      사다리의 높이
     - throws:
     - Wrong Input
     - Out of Range
     */
    private func stringToInt(_ string:String) throws -> (Int){
        guard let result = Int.init(string) else { throw ErrorType.wrongInput }
        guard result > 0 else {throw ErrorType.outOfRange}
        return result
    }
    func run() throws->(LadderInfo){
        let players = try stringToPlayers(ask(question: Question.aboutNameOfPlayers))
        let height = try stringToInt(ask(question: Question.aboutHeightOfLadder))
        return LadderInfo.init(players: players, height: height)
    }
}

