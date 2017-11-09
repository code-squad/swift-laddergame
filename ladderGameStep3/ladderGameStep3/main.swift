//
//  main.swift
//  ladderGameStep3
//
//  Created by Choi Jeong Hoon on 2017. 11. 6..
//  Copyright © 2017년 JH Factory. All rights reserved.
//

import Foundation

while (true) {
    let inputView = InputView()
    // 1-1. 인풋뷰의 입력값 받는 메소드를 호출하여 튜플 상수에 대입
    let (participants, heightOfLadder) = inputView.getUserInput()
    if participants.count == 0 || heightOfLadder == 0 {
        break
    }
    // 2. LadderGame인스턴스 생성 (LadderPlayer를 받음)
    let ladderGame: Array<LadderPlayer> = LadderGame(participants).participant
    
    // 3. 참가자 이름을 받는 상수 선언
    let names = LadderGame.getParticipants(ladderGame)
    
    // 4. ResultView인스턴스 생성
    let resultView = ResultView()
    
    // 4-1. ResultView의 사다리정보를 출력하는 메소드 호출
    resultView.printFullLadder(row: heightOfLadder, col: participants.count, names: names)
}
