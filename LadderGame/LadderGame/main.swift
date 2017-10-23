//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

while(true){
    print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요):", terminator: " ")
    guard let ofNames = readLine() else{ break }
    print("최대 사다리 높이는 몇 개인가요?", terminator: " ")
    guard let ladderHeight = readLine() else{ break }
    
    // 사용자 입력값으로 사다리 출력 함수 호출.
    guard let game = InputView(participants: ofNames, with: ladderHeight).readyLadder() else { break }
    ResultView(of: game).drawLadder()
}

