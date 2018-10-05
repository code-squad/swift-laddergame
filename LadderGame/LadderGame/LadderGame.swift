//
//  LadderGame.swift
//  LadderGame
//
//  Created by 윤동민 on 2018. 10. 1..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private let inputView : InputView
    private let resultView : ResultView
    
    private(set) var height : Int
    private var names : [LadderPlayer]
    private var ladder : [[LadderStep]]
    
    init(){
        self.height = 0
        self.names = []
        self.ladder = [[]]
        self.inputView = InputView()
        self.resultView = ResultView()
    }
    
    // 입력을 받는 구조체 실행
    mutating func inputFromPlayer() -> Bool{
        let playerNames = inputView.inputJoinPlayersName().split(separator: ",")
        for player in playerNames{
            checkPlayerName(receiveName: String(player))
        }
        height = inputView.inputLadderOfHeight()
        ladder = inputView.setLadder(height: self.height, playerCount: names.count)
        
        return isRightUserInput(input: height)
    }
    
    // 사용자의 사다리 높이 입력 값을 검사
    private func isRightUserInput(input: Int) -> Bool{
        guard input != -1 else {
            return false
        }
        return true
    }
    
    // 입력받은 플레이어 이름이 5글자 이상인 경우 배열에 넣지 않음
    private mutating func checkPlayerName(receiveName: String) {
        if receiveName.count > 5 { return }
        self.names.append(LadderPlayer(name: receiveName))
    }
    
    // 결과를 출력해주는 구조체 실행
    func outputView(){
        resultView.printLadder(ladderHeight: self.height, ladder: self.ladder)
        resultView.printPlayersName(names: self.names)
    }
}
