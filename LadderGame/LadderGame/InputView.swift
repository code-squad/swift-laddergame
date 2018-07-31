//
//  InputView.swift
//  LadderGame
//
//  Created by KIMMINSIK on 2018. 7. 29..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

//참여할 사람 입력 받기 -> InputView
struct InputView {
        let inputUserName = readLine()
    func inputUserData () -> Int {
        
        let names = inputUserName?.split(separator: ",").map{ String($0) }
        let namesSize = names?.count
        
        return namesSize!
    }
   
//사다리 높이 정하기 -> InputView
    func inputLadderLength () -> String {
        print("최대 사다리 높이는 몇 개인가요?")
        let inputMaxLadderNumber = readLine()
        return inputMaxLadderNumber!
        
    }
}
