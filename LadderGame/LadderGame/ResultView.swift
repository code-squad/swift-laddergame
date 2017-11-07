//
//  ResultView.swift
//  LadderGame
//
//  Created by YOUTH on 2017. 11. 6..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    
    //출력할 때 2차원배열의 값을 하나씩 꺼내와서 줄바꿈과 함께 출력, 마지막줄은 tagging된 사용자 이름 출력
    func printLadder(mainLadder: Array<Array<String>>, playersName:Array<String>) {
        for i in 0..<mainLadder.count {
            printOneLadder(mainLadder[i])
            print("")
        }
        for turn in 0..<playersName.count{
            print("",playersName[turn],"", separator:" ", terminator:"  ")
        }
        print("")
    }
    
    private func printOneLadder(_ oneLadder: Array<String>){
        for j in 0..<oneLadder.count {
            print(oneLadder[j], terminator: "")
        }
    }
    
}


