//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


//사용자한테 입력받을 인원수와 사다리갯수(일단 입력->나중에 사용자가 입력하게끔 수정)
var peopleNum = 5
var ladderNum = 3

//랜덤한수
var randomNum = arc4random_uniform(500)


//Bool값을 받을 이중배열 생성
var boolArr : [[Bool]] = Array(repeating: Array(repeating: true,count:peopleNum-1 ), count: ladderNum)

//랜덤한 Bool값을 이중배열에 넣어줌
for a in 0..<3 {
    for b in 0..<peopleNum - 1 {
        let randomNum = arc4random_uniform(500)
        if randomNum % 2 == 1 {
            boolArr[a][b]=(true)
        }else {
            boolArr[a][b]=(false)
        }
    }
}
print(boolArr)
