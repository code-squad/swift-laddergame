//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

//print("참여자의 수:")
//var peoples = readLine()
//let people_cnt = Int(peoples ?? "") ?? 1
let people_cnt = arc4random_uniform(3) + 1

//print("사다리의 높이:")
//var ladders = readLine()
//let laders_cnt = Int(ladders ?? "") ?? 2
let ladder_cnt = arc4random_uniform(5) + 2

var ladder = Array<Array<Bool>>()

print("참여자의 수 :",people_cnt)
print("사다리의 높이 :",ladder_cnt)

for _ in 1...ladder_cnt {
    var ladder_row = Array<Bool>()
    for _ in 1...people_cnt {
        ladder_row.append(Bool.random())
    }
    ladder.append(ladder_row)
}
print(ladder)
for row in ladder {
    print("|",terminator:"")
    for col in row {
        print(col ? "-|" : " |", terminator:"")
    }
    print("")
}
