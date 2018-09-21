//
//  ValidityCheck.swift
//  LadderGame
//
//  Created by 조재흥 on 2018. 9. 21..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ValidityCheck {
    func isValid(names:String) -> Bool {
        for i in names.split(separator: ",") {
            guard i.count <= 5 else {
                print("사람 이름의 최대 길이는 '5'입니다. 확인해주세요.")
                return false
            }
        }
        return true
    }

    func isValid(height:Int) -> Bool {
        guard height >= 2 else {
            print("사다리의 최소 높이는 '2' 입니다. 확인해주세요.")
            return false
        }
        return true
    }
}
