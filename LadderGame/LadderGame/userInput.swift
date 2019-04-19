//
//  userInput.swift
//  LadderGame
//
//  Created by 이희찬 on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct UserInputManage{
    
    var requestNumber : String? {
        return readLine()
    }
    
    func removeOptional (_ userResponse:String?)->String{
        if let convertedString = userResponse{
            return convertedString
        }
        return " "
    }
    
    func convertInt (_ convertedString:String)->Int{
        if let convertedInt = Int(convertedString){
            return convertedInt
        }
        return 0
    }
}

struct InputMamber {
    func isString()->String{
        let userInput = UserInputManage()
        let optionalString = userInput.requestNumber
        let convertedString = userInput.removeOptional(optionalString)
        if convertedString == " " {
            print("값을 입력하세요")
            return isString()
        }
        return convertedString
    }
    
    func isInt (_ convertedString:String)->Int{
        let userInput = UserInputManage()
        let convertedInt = userInput.convertInt(convertedString)
        if convertedInt == 0 {
            print("입력한 값을 다시 확인하세요, 정수를 입력해야 합니다")
            return isInt(isString())
        }
        return convertedInt
    }
    
    func userInputNumber()->Int{
        let convertedString = isString()
        let convertedInt = isInt(convertedString)
        return convertedInt
    }
    
    func overOne(_ convertedInt:Int)->Int{
        guard convertedInt > 1 else {
            return 0
        }
        return convertedInt
    }
    
    func playerNumberCheck(_ overOne:Int)->Int{
        if overOne == 0 {
            print("최소 플레이어수는 2명 입니다")
            return isInt(isString())
        }
        return overOne
    }
    
    func ladderHeightCheck(_ overOne:Int)->Int{
        if overOne == 0 {
            print("최소 사다리 높이는 2 입니다")
            return isInt(isString())
        }
        return overOne
    }
    
    func playerNumber()->Int{
        print("플레이어 수를 입력하세요")
        let playerNumber = playerNumberCheck(overOne(userInputNumber()))
        return playerNumber
    }
    
    func ladderHeight()->Int{
        print("사다리 높이를 입력하세요")
        let ladderHeight = ladderHeightCheck(overOne(userInputNumber()))
        return ladderHeight
    }
    
    func LadderGameBasicValueInitMamber()->Array<Int>{
        let playerNumber = self.playerNumber()
        let ladderHeight = self.ladderHeight()
        return [playerNumber,ladderHeight]
    }
}

struct LadderGameBasicValue {
    let playerNumber:Int //readLine()
    let ladderHeight:Int //readLine()
    
    var ladderWidthLength:Int {
        return ((playerNumber-1) * 2) + 1
    }
    
    lazy var ladders:[[Character]] =
        Array(repeating:Array(repeating: " ", count:ladderWidthLength), count: ladderHeight)
    
    var widthLadderNumber:Int {
        return Int(arc4random_uniform(UInt32(((playerNumber - 1) / 2) * ladderHeight)))
    }
    
    init (_ initMembers:Array<Int>){
        self.playerNumber = initMembers[0]
        self.ladderHeight = initMembers[1]
    }
}

struct Input {
    func playInput()->LadderGameBasicValue{
        let initMamber = InputMamber()
        let members = initMamber.LadderGameBasicValueInitMamber
        let ladderGameBasicValue = LadderGameBasicValue(members())
        return ladderGameBasicValue
    }
}



