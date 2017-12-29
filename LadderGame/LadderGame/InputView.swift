//
//  InputView.swift
//  laddergame
//
//  Created by 김수현 on 2017. 12. 20..
//  Copyright © 2017년 김수현. All rights reserved.
//

import Foundation

struct InputView {
    
    func getNameOfPlayer() -> Array<String>? {
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        let inputStr = readLine()
        guard let inputPlayer = inputStr else { return nil }
        let player = inputPlayer.components(separatedBy: ",")
        return player
    }
    
    func getHeightOfLadder() -> Int {
        print("최대 사다리 높이는 몇 개인가요?")
        let inputHeightOfLadder = Int(readLine()!)
        guard let heightOfLadder = inputHeightOfLadder else { return 0 }
        return heightOfLadder
    }
}
