//
//  InputView.swift
//  LadderGame
//
//  Created by Eunjin Kim on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    private var nameOfPlayers: String = ""
    private var heightForLadder: Int = 0
        
    mutating func prompt() {
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        if let nameOfPlayers = readLine() {
            self.nameOfPlayers = nameOfPlayers
        } else {
            print("사람 이름 입력 error")
        }
        print("최대 사다리 높이는 몇 개인가요?")
        if let heightForLadder = readLine() {
            self.heightForLadder = Int(heightForLadder)!
        } else {
            print("사다리높이 입력 error")
        }
    }
    
    func getNameOfPlayers() -> String {
        return nameOfPlayers
    }
    
    func getHeightForLadder() -> Int{
        return heightForLadder
    }
}
