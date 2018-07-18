//
//  Input.swift
//  LadderGame
//
//  Created by 이동건 on 17/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    static func readApplicants() -> [LadderPlayer]?{
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        guard let input = readLine() else { return [] }
        let applicants = input.split(separator: ",")
        // 한 사람이라도 5글자가 넘어서면 nil을 반환
        return checkValidApplicants(applicants) ? applicants.compactMap {LadderPlayer(name: String($0))} : nil
    }
    
    private static func checkValidApplicants(_ applicants: [String.SubSequence]) -> Bool{
        if applicants.contains(where: {String($0).count > 5}) {
            print("이름은 5자 이하로 입력해주세요.")
            return false
        }
        return true
    }
    
    static func readLadderHeight()->Int? {
        print("최대 사다리 높이는 몇 개인가요?")
        guard let input = readLine() else { return nil }
        return Int(input)
    }
}
