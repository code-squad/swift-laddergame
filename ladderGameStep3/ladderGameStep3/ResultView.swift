//
//  ResultView.swift
//  ladderGameStep3
//
//  Created by Choi Jeong Hoon on 2017. 11. 6..
//  Copyright © 2017년 JH Factory. All rights reserved.
//

import Foundation

struct ResultView {
    var height = Int()
    var names = Array<String>()
    init(ladderGame: LadderGame) {
        height = ladderGame.height
        names = ladderGame.names
    }
    
    // 1. 랜덤 불값 생성
    func makeRandomBooleanValue () -> Bool {
        let randomNum = Int(arc4random_uniform(2))
        guard randomNum % 2 == 0 else { return false }
        return true
    }
    
    // 2. 랜덤 불값의 한줄 배열 만들기
    func makeRandomInnerArray () -> Array<Bool> {
        var firstArray = Array<Bool>()
        for _ in 0 ..< names.count-1 {
            firstArray.append(makeRandomBooleanValue())
        }
        return firstArray
    }
        
        
    func printOneLine (_ col: Int) -> String {
        var result = String()
        var inputArray = makeRandomInnerArray()
        for inner in 0 ..< inputArray.count {
            if inputArray[inner] == true {
                result += "-----"
            } else {
                result += "     "
            }
            result += "|"
        }
        return result
    }
    
    func printNames () {
        for name in names {
            print(name, terminator: " ")
        }
        
    }
    
    
    // 4. 사다리 전체 출력
    func printFullLadder (colOf: Int, rowOf: Int) {
        for _ in 0 ..< colOf-1 {
            print ("|", terminator: printOneLine(names.count))
            print ()
        }
   
        printNames()
        print ()
    }
}
