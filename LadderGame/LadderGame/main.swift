//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){
    // 입력받음
    guard let playerNames = InputView.input(msg: "참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요):") else { return }
    guard let ladderHeightString = InputView.input(msg: "최대 사다리 높이는 몇 개인가요?") else { return }
    
    // 전처리.
    let individualPlayers = InputView.splitNames(of: playerNames, with: ",")
    let ladderHeights = Int(ladderHeightString) ?? 0
    
    // 사용자 입력 문자열을 전처리하여 LadderGame 객체 생성.
    guard let thisGame = LadderGame.readyLadder(for: individualPlayers, with: ladderHeights) else { return }
    // 사용자 입력값으로 사다리 출력 함수 호출.
    ResultView.drawLadder(of: thisGame)
}

main()
