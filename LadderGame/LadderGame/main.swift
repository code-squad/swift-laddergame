//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


typealias  Poles = [[String]]
typealias  Steps = [[String]]
typealias  DataOfLadder = [[String]]
typealias  FrameOfLadder = (Int,Int)

func ladderGame(){
    let userInput = input()
    let dataOfLadder : DataOfLadder = makeLadder(frameOfLadder: userInput)
    
    output(dataOfLadder: dataOfLadder)
}

func output(dataOfLadder:DataOfLadder){
    printLadder(dataOfLadder:dataOfLadder)
}

func printLadder(dataOfLadder:DataOfLadder){
    for line in dataOfLadder {
        printLine(line: line);
        print()
    }
}

func printLine(line:[String]){
    for unit in line {
        print(unit, separator: "", terminator: "")
    }
}

func input()->(FrameOfLadder){
    let numberOfPeople = getNumberOfPeople()
    let heightOfLadder = getHeightOfLadder()
    
    return (numberOfPeople,heightOfLadder)
}

func getNumberOfPeople() ->(Int){
    print("참여할 사람은 몇 명 인가요?")
    let input = readLine()!
    let numberOfPeople = safeUnwrap(target: input)
    
    return numberOfPeople
}

func getHeightOfLadder() ->(Int){
    print("최대 사다리 높이는 몇 개인가요?")
    let input = readLine()!
    let heightOfLadder = safeUnwrap(target: input)
    
    return heightOfLadder
}

func safeUnwrap(target:String)->(Int){
    guard let result = Int.init(target) else {
        print("올바른 입력이 아닙니다.")
        return 0
    }
    return result
}

func makeLadder(frameOfLadder:FrameOfLadder)->(DataOfLadder){
    let ladderFrame  = (frameOfLadder.0,frameOfLadder.1)
    let poles = makePole(ladderFrame: ladderFrame)
    let foots = makeSteps(ladderFrame: ladderFrame)
    let ladder = assemble(poles: poles, steps: foots)
    
    return ladder
    
}

func assemble(poles:Poles,steps:Steps)->(DataOfLadder){
    let width  = poles[0].count + steps[0].count
    let height = poles.count
    var ladder = [[String]]()
    for i in 0..<height{
        var line = [String]()
        for index in 0..<width {
            if(index % 2 == 0){
                line.append(poles[i][index/2])
            }else{
                line.append(steps[i][index/2])
            }
        }
        ladder.append(line)
    }
    
    return ladder
}

func makePole(ladderFrame:FrameOfLadder)->(Poles){

    let patterns = ["|"]
    let (width,height) = ladderFrame
    let poles  = filPatterns(frameOfLadder: (width,height), patterns:patterns)
    
    return poles
}



func makeSteps(ladderFrame:FrameOfLadder)->(Steps){
    let patterns = ["-"," "]
    let (width,height) = ladderFrame
    let steps  = filPatterns(frameOfLadder: (width-1,height), patterns: patterns)
    
    return steps
}

func filPatterns(frameOfLadder:FrameOfLadder,patterns:[String])->([[String]]){
    let dataOfLadder = filFrame(frameOfLadder: frameOfLadder,patterns: patterns)
    
    return dataOfLadder
}
func filFrame(frameOfLadder:FrameOfLadder,patterns:[String])->([[String]]){
    var lines = [[String]]()
    let (width,height) = frameOfLadder
    for _ in 0..<height{
        let line = filLine(width: width,patterns: patterns)
        lines.append(line)
    }
    return lines
}

func filLine(width:Int,patterns:[String])->([String]){
    var line = [String]()
    for _ in 0..<width{
        let unit = randomPattern(patterns: patterns)
        line.append(unit)
    }
    return line
    
}


func randomPattern(patterns:[String])->(String){
    let index = Int.random(in: 0..<patterns.count)
    let selected = patterns[index]
    
    return selected
}



ladderGame()

