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
    func isValid(people: String) -> Bool {
        let people = people.split(separator: ",")
        if people.count < 2 {
            print("2명 이상의 참가자를 입력해주세요.")
            return false
        }
        
        for person in people {
            if person.count > 5 {
                print("5자 이하의 이름을 입력해주세요.")
                return false
            }
        }
        return true
    }
    
    // 사다리 높이가 적당한지 확인하는 함수
    func isValid(height: Int) -> Bool {
        if height < 3 {
            print("3 이상의 높이를 입력해주세요.")
            return false
        }
        return true
    }
}
