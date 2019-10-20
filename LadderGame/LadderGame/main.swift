//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

class LadderGames{
    private var steps = 2
    private var players = 2
    private var ladders = Array<Array<Bool>>()
    func start(){
        print("사다리는 몇 층으로 할까요?")
        steps = Int(readLine() ?? "") ?? 1
        if(steps < 2){
            print("Error : 사다리는 2층 이상이어야 합니다.")
            steps = 2
            start()
            return
        }
        print("몇 명이 참여하나요?")
        players = Int(readLine() ?? "") ?? 2
        if(players < 2){
            print("Error : 최소 2명 이상 참가해주셔야 합니다.")
            players = 2
            start()
            return
        }
        make()
    }
    func make(){
        ladders.removeAll()
        for _ in 0 ..< steps {
            var row = Array<Bool>()
            for _ in 0 ..< players{
                row.append(arc4random_uniform(200) % 2 == 0)
            }
            ladders.append(row)
        }
        render()
    }
    func render(){
        ladders.forEach { row in
            print("|", terminator:"")
            row.forEach { (v) in
                print( v ? "-|" : " |", terminator:"")
            }
            print("")
        }
    }
}
LadderGames().start()
