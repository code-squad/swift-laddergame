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
var boolArr : [[Bool]] = Array(repeating: Array(repeating: true,count:5 ), count: 3)

