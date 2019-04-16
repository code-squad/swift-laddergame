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
}

func createLadder(maximumPeople: Int, maximumLayer: Int) -> [[Component]] {
    let ladder = [[Component]](repeating: Array(repeating: Component.blank, count: maximumPeople - 1 ), count: maximumLayer )
    
    return ladder
}

func connectLadderRow(array: [Component]) -> [Component] {
    var beforeConnected = false
    var result:[Component] = array
    for colunm in 0..<array.count
    {
        guard !beforeConnected && Bool.random() else {
            beforeConnected = false
            continue
        }
        result[colunm] = Component.connect
        beforeConnected = true
    }
    
    return result
}

func connectLadder(ladder: [[Component]]) -> [[Component]] {
    var ladderConnect = ladder
    
    for row in 0..<ladder.count {
        ladderConnect[row] = connectLadderRow(array: ladder[row])
    }
    
    return ladderConnect
}

enum InputableVariableName: String {
    case maximumPeople = "참여할 사람은 몇 명 인가요 ?"
    case maximumLayer = "최대 사다리 높이는 몇 개 인가요 ?"
}

func inputmaximumPeople() -> (Int)? {
    guard let maximumPeople = Int(readLine()!) else { return nil }
    
    return maximumPeople
}

func inputmaximumLayer() -> (Int)? {
    guard let maximumLayer = Int(readLine()!) else { return nil }
    
    return maximumLayer
}

func printRowValue(rowValue: [Component]) {
    print(terminator: "|")
    for column in rowValue {
        print(column.rawValue, terminator: "|")
    }
}

func printOutputValue(ladder: [[Component]]) {
    for row in ladder {
        printRowValue(rowValue: row)
        print()
    }
}

func main(){
    print(InputableVariableName.maximumPeople.rawValue)
    guard let inputMaximumPeople = inputmaximumPeople() else { return }
    print(InputableVariableName.maximumLayer.rawValue)
    guard let inputMaximumLayer = inputmaximumLayer() else { return }
    var ladder = createLadder(maximumPeople: inputMaximumPeople, maximumLayer: inputMaximumLayer)
    ladder = connectLadder(ladder: ladder)
    printOutputValue(ladder: ladder)
}

main()
