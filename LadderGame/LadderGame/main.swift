//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

let people_cnt = Int(arc4random_uniform(3)) + 2
let ladder_cnt = Int(arc4random_uniform(5)) + 1
let ladder = [[Bool]](repeating:Array(repeating:true, count: people_cnt),count:ladder_cnt)
print("참여자의 수 :",people_cnt)
print("사다리의 높이 :",ladder_cnt)

for row in ladder {
    print("|",terminator:"")
    for col in row[...(row.count-2)] {
        print(col && Bool.random() ? "-|" : " |", terminator:"")
    }
    print("")
}
