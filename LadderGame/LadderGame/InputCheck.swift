//
//  inputCheck.swift
//  LadderGame
//
//  Created by 김장수 on 2018. 10. 6..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

// 예외 처리하는 객체
struct InputCheck {
    // 이름 길이가 적당한지 확인하는 함수
    public func isValid(people: String) -> Bool {
        let people = people.split(separator: ",")        
        for person in people {
            if person.count > 5 || people.count < 3 {
                return false
            }
        }
        return true
    }
    
    // 사다리 높이가 적당한지 확인하는 함수
    public func isValid(height: Int) -> Bool {
        if height < 3 || height > 20 {
            return false
        }
        return true
    }
}
