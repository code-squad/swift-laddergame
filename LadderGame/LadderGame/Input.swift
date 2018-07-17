//
//  Input.swift
//  LadderGame
//
//  Created by 이동건 on 17/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    func readApplicants() -> [LadderPlayer]?{
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        guard let input = readLine() else { return [] }
        let applicants = input.split(separator: ",")
        return applicants.compactMap {LadderPlayer(name: String($0))}
    }
    
    func readLadderHeight()->Int? {
        print("최대 사다리 높이는 몇 개인가요?")
        guard let input = readLine() else { return nil }
        return Int(input)
    }
}
