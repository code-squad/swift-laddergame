//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

enum Component: String {
    case connect = "-"
    case blank = " "
    case bothsides = "|"
}

func makeLadder(maximumPeople: Int, maximumLayer: Int) -> [[Component]] {
    var ladder: [[Component]] = [[]]
    ladder[0].append(Component.bothsides)
    
    for _ in 1..<maximumPeople {
        ladder[0].append(Component.blank)
        ladder[0].append(Component.bothsides)
    }
    for _ in 1..<maximumLayer {
        ladder.append(ladder[0])
    }
    return ladder
}

func connectLadder(ladder: [[Component]], maximumLayer: Int, maximumPeople: Int) -> [[Component]] {
    var ladderConnect = ladder
    
    for row in 0..<maximumLayer {
        for colunm in stride(from: 1, to: (maximumPeople * 2 - 1), by: 2)
        {
            if Bool.random() {
                ladderConnect[row][colunm] = Component.connect
            }
        }
        
    }
    return ladderConnect
    
}

func main(){
    print("참여할 사람은 몇 명 인가요 ?")
    guard let maximumPeople = Int(readLine()!) else { return }
    print("최대 사다리 높이는 몇 개 인가요 ?")
    guard let maximumLayer = Int(readLine()!) else { return }
    var ladder = makeLadder(maximumPeople: maximumPeople, maximumLayer: maximumLayer)
    ladder = connectLadder(ladder: ladder, maximumLayer: maximumLayer, maximumPeople: maximumPeople)
    
    for row in ladder {
        for column in row {
            print(column.rawValue, terminator: "")
        }
        print()
    }
}
main()
