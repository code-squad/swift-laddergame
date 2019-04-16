//
//  InputView.swift
//  LadderGame
//
//  Created by jang gukjin on 12/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

/// 사용자의 입력을 받는 구조체
struct InputView {
    /// 사람과 사다리의 수를 입력받는 함수
    func inputCount(askText : CountQuestions)->String? {
        print(askText.rawValue)
        let inputText = readLine()
        
        return inputText
    }
}

struct DistinctNameAndHeight {
    /// 입력받은 사람의 이름을 판단하는 함수
    func inputName(inputText : String?) throws -> [LadderPlayer] {
        if inputText == nil { throw ErrorMessages.wrongInput}
        else {
            let invertStringNames = String(inputText!)
            let names = try errorJudgmentName(invertStringNames: invertStringNames)
            return names
        }
    }
    
    /// 입력받은 높이를 판단하는 함수
    func inputHeight(inputText : String?) throws -> Int {
        guard let height = Int(inputText ?? "0"), height > 1 else{
            throw ErrorMessages.outOfRange
        }
        return height
    }
    
    /// 플레이어의 글자수가 5를 넘는지 안 넘는지 판단하는 함수
    func errorJudgmentName(invertStringNames:String) throws -> [LadderPlayer]{
        var names = [LadderPlayer]()
        let devideStringNames = invertStringNames.split(separator: ",")
        for name in devideStringNames{
            if String(name).count>5 { throw ErrorMessages.wrongInput}
            names.append(LadderPlayer(player: String(name)))
        }
        if names.count > 5 || names.count < 2{
            throw ErrorMessages.outOfRange
        }
        return names
    }
}
