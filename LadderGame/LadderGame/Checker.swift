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
    /// 들어온 사람들이 2명 이상 13명 이하인지 체크
    private static func zeroPersonCheck(peopleList : Array<String>) -> Bool{
        guard peopleList.count >= 2 && peopleList.count <= 13  else {
            print("2명이상 13명이하를 입력해주세요")
            return false
        }
        return true
    }
    ///사람이름이 0글자인지 체크
    private static func zeroNameCheck(peopleList : Array<String>) -> Bool{
        for peoson in peopleList {
            guard peoson.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 else {
                print("이름이 입력되지 않았습니다.")
                return false
            }
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
        guard zeroPersonCheck(peopleList : peopleList) && checkNameLength(peopleList : peopleList) && zeroNameCheck(peopleList: peopleList) else {
            return nil
        }
        return peopleList
    }
    
    /// 입력받은 숫자가 진짜 숫자인지 체크
    static func checkCorrectNumber(inputNumber : String)->Int?{
        guard let number = Int(inputNumber) else {
            print("잘못된 사다리 숫자 입니다")
            return nil
        }
        return number
    }
    /// 입력받은 숫자가 1~13 인지 체크
    static func checkNumberSize(inputNumber : Int)->Bool{
        guard inputNumber >= 1 && inputNumber <= 13 else {
            print("사다리수는 1~13 만 가능합니다")
            return false
        }
        return true
    }
    /// 입력받은 숫자 전체 체크
    static func checkNumber(inputNumber : String)->Int?{
        guard let number = checkCorrectNumber(inputNumber: inputNumber) , checkNumberSize(inputNumber: number) else {
            return nil
        }
        return number
    }
}
