//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


// input
print("참여할 사람은 몇 명 인가요?")
let participant = Int(readLine() ?? "0")!

print("최대 사다리 높이는 몇 개인가요?")
let ladder_row = Int(readLine() ?? "0")!
let ladder_col = participant*2-1


var ladder: [[String]] = Array(repeating: Array(repeating: "", count: ladder_col), count: ladder_row)

var arr : [[Int]] = Array(repeating: Array(repeating: 1,count:5 ), count: ladder_row)

for i in 0..<ladder_row{
    for j in 0..<ladder_col {
        if(j%2 == 0){
            ladder[i][j] = "|"
        }else {
            ladder[i][j] = (arc4random_uniform(2)==0) ? "-" : " "
        }
    }
}

for i in 0..<ladder_row {
    for j in 0..<ladder_col{
        print(ladder[i][j], terminator: "")
    }
    print("")

}
