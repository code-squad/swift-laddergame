//
//  Checker.swift
//  LadderGame
//
//  Created by Yoda Codd on 2018. 4. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

/// 입력값에 대한 검증하는 구조체
struct Checker {
    /// 들어온 사람들 목록에 내용이 있는지 체크
    private static func zeroCheck(peopleList : Array<String>) -> Bool{
        guard peopleList.count > 1 else {
            print("2명 이상을 입력해주세요")
            return false
        }
        return true
    }
    
    /// 입력받은 사람들이 5글자가 넘는지 체크
    private static func checkNameLength(peopleList : Array<String>) -> Bool{
        for person in peopleList {
            guard person.count <= Limiter.nameLengthLimit() else {
                print("이름이 \(Limiter.nameLengthLimit())자를 넘어갔습니다 - \(person)")
                return false
            }
        }
        return true
    }
    
    /// 입력받은 사람에 대한 전체적인 검사
    static func checkPeople(peopleList : Array<String>)->Array<String>?{
        guard zeroCheck(peopleList : peopleList) && checkNameLength(peopleList : peopleList) else {
            return nil
        }
        return peopleList
    }
    
    /// 입력받은 숫자가 진짜 숫자인지 체크
    static func checkNumber(inputNumber : String)->Int?{
        guard let number = Int(inputNumber) else {
            return nil
        }
        return number
    }
}
