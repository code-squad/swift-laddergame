//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


typealias   Input = (Int,Int)
typealias LadderFrame = (Int,Int)
typealias  Poles = [[String]]
typealias  Steps = [[String]]
typealias  Ladder = [[String]]
typealias  Line = [String]

func ladderGame(){
    let userInput = input()
    let ladderData : Ladder = makeLadder(userInput: userInput)
    
    output(ladderData: ladderData)
    
}

func output(ladderData:Ladder){
    for line in ladderData {
        for unit in line {
            print(unit, separator: "", terminator: "")
        }
        print()
    }
    
}

func input()->(LadderFrame){
    
    
    let numberOfPeople =  getNumberOfPeople()
    let ladderHeight = getLadderHeight()
    
    return (numberOfPeople,ladderHeight)
}


func getNumberOfPeople() ->Int{
    print("참여할 사람은 몇 명 인가요?")
    let input = readLine()!
    let numberOfPeople = safeUnwrap(target: input)
    
    return numberOfPeople
}

func getLadderHeight() ->Int{
    print("최대 사다리 높이는 몇 개인가요?")
    let input = readLine()!
    let height = safeUnwrap(target: input)
 
    return height
}

func safeUnwrap(target:String)->Int{
    guard let result = Int.init(target) else {
        print("올바른 입력이 아닙니다.")
        return 0
    }
    return result
}



func makeLadder(userInput:Input)->(Ladder){
    let ladderFrame  = (userInput.0,userInput.1)
    let poles = makePole(ladderFrame: ladderFrame)
    let foots = makeFoot(ladderFrame: ladderFrame)
    let ladder = assemble(poles: poles, foots: foots)
    
    return ladder
    
}

func assemble(poles:Poles,foots:Steps)->Ladder{
    let width  = poles[0].count + foots[0].count
    let height = poles.count
    var ladder = [[String]]()
    for i in 0..<height{
        var line = [String]()
        for index in 0..<width {
            if(index % 2 == 0){
                line.append(poles[i][index/2])
            }else{
                line.append(foots[i][index/2])
            }
        }
        ladder.append(line)
    }
    
    return ladder
}

func makePole(ladderFrame:LadderFrame)->(Poles){
    let patterns = ["|"]
    let (width,height) = ladderFrame
    let poles  = fillPattern(ladderFrame: (width,height), patterns:patterns)
    
    return poles
}

func makeFoot(ladderFrame:LadderFrame)->(Steps){
    let patterns = ["-"," "]
    let (width,height) = ladderFrame
    let foots  = fillPattern(ladderFrame: (width-1,height), patterns: patterns)
    
    return foots
}

func fillPattern(ladderFrame:LadderFrame,patterns:[String])->[[String]]{
    let (width,height) = ladderFrame
    var lines = [[String]]()
    for _ in 0..<height{
        var line = [String]()
        for _ in 0..<width{
            let  unit = randomPattern(patterns: patterns)
            line.append(unit)
        }
        lines.append(line)
    }
    
    return lines
}

func randomPattern(patterns:[String])->String{
    let random: UInt32 = arc4random_uniform(UInt32(patterns.count))
    let index = Int(random)
    let selected = patterns[index]
    
    return selected
}

ladderGame()



