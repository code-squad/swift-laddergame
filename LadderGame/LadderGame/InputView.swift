//
//  InputView.swift
//  LadderGame
//
//  Created by 이동영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView{
    
    public func ask(question:Question) throws ->(String){
        print(question.rawValue)
        guard let input = readLine() else {
            throw 
        }
        return input
    }
   
}
enum Question:String,CaseIterable{
    case aboutNameOfPlayers = "참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)"
    case aboutHeightOfLadder = "최대 사다리의 높이는 몇 개 인가요?"
}
