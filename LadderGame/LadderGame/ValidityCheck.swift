//
//  ValidityCheck.swift
//  LadderGame
//
//  Created by 조재흥 on 2018. 9. 21..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ValidityCheck {
    private let maxLength = 5
    private let minHeight = 2
    
    func isValid(names:String) -> Bool {
        for i in names.split(separator: ",") {
            guard i.count <= maxLength else {
                print("사람 이름의 최대 길이는 '\(maxLength)'입니다. 확인해주세요.")
                return false
            }
        }
        return true
    }

    func isValid(height:Int) -> Bool {
        guard height >= minHeight else {
            print("사다리의 최소 높이는 '\(minHeight)' 입니다. 확인해주세요.")
            return false
        }
        return true
    }
}
