//
//  LadderGame.swift
//  ladderGameStep3
//
//  Created by Choi Jeong Hoon on 2017. 11. 6..
//  Copyright © 2017년 JH Factory. All rights reserved.
//
import Foundation

struct LadderGame {
    // 1. 랜덤 불값 생성
    static func makeRandomBooleanValue () -> Bool {
        let randomNum = Int(arc4random_uniform(2))
        guard randomNum % 2 == 0 else { return false }
        return true
    }
    
    // 2. 랜덤 불값의 한줄 배열 만들기
    static func makeRandomInnerArray (inputNames: Array<String>) -> Array<Bool> {
        var firstArray = Array<Bool>()
        for _ in 0 ..< inputNames.count-1{
            firstArray.append(makeRandomBooleanValue())
        }
        return firstArray
    }
}
