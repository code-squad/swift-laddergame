//
//  ResultView.swift
//  ladderGameStep3
//
//  Created by Choi Jeong Hoon on 2017. 11. 6..
//  Copyright © 2017년 JH Factory. All rights reserved.
//

import Foundation

// 사다리를 생성하고 출력하는 구조체
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
        
    // 3. 한줄의 스트링으로 만들기
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
    
    // 4. 한줄스트링 생성함수를 사다린 높이만큼 반복하여 호출해서, 이름과 같이 전체 사다리 출력하는 함수
    func printFullLadder (colOf: Int, rowOf: Int) {
        for _ in 0 ..< rowOf {
            print ("|", terminator: printOneLine(names.count))
            print ()
        }
        printNames()
        print ()
    }
}
