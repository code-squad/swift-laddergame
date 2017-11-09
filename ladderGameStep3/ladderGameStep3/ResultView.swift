//
//  ResultView.swift
//  ladderGameStep3
//
//  Created by Choi Jeong Hoon on 2017. 11. 6..
//  Copyright © 2017년 JH Factory. All rights reserved.
//

import Foundation
// 사다리를 출력하는 구조체
struct ResultView {
    private enum LadderElements: String {
        case verticalLine = "-----"
        case horizontalLine = "|"
        case whiteSpace = "     "
    }
    
   
    // 1. 한줄 사다리 생성
    private func printOneLine (_ countOfNames: Int) -> String {
        var result = String()
        var inputArray = LadderGame.makeRandomInnerArray(countOfNames)
        for inner in 0 ..< inputArray.count {
            if inputArray[inner] == true {
                result += LadderElements.verticalLine.rawValue
            } else {
                result += LadderElements.whiteSpace.rawValue
            }
            result += LadderElements.horizontalLine.rawValue
        }
        return result
    }
    
    // 2. 참가자 이름을 출력하는 메소드
      private func printNames (_ names: Array<String>) {
        for name in names {
            print(name, terminator: " ")
        }
    }
    
    // 3. 한줄스트링 생성함수를 사다린 높이만큼 반복하여 호출해서, 이름과 같이 전체 사다리 출력하는 함수
    func printFullLadder (row: Int, col: Int, names: Array<String>){
        for _ in 0 ..< row {
            print (LadderElements.horizontalLine.rawValue, terminator: printOneLine(col))
            print ()
        }
        printNames(names)
        print ()
    }
}
