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
        let fail = " "
        if let convertedString = userResponse{
            return convertedString
        }
        return fail
    }
    
    func convertInt (_ convertedString:String)->Int{
        let fail = 0
        if let convertedInt = Int(convertedString){
            return convertedInt
        }
        return fail
    }
}

struct InputMamber {
    func isString()->String{
        let fail = " "
        let userInput = UserInputManage()
        let optionalString = userInput.requestNumber
        let convertedString = userInput.removeOptional(optionalString)
        if convertedString == fail {
            return fail
        }
        return convertedString
    }
    
    func isInt (_ convertedString:String)->Int{
        let fail = 0
        let userInput = UserInputManage()
        let convertedInt = userInput.convertInt(convertedString)
        if convertedInt == fail {
            return fail
        }
        return convertedInt
    }
    func convertString()->String{
        let fail = " "
        let convertedString = isString()
        if convertedString == fail {
            print("입력할 값을 다시 확인하세요")
            return convertString()
        }
        return convertedString
    }
    func comvertInt(_ convertedString:String) -> Int {
        let fail = 0
        let convertedInt = isInt(convertedString)
        if convertedInt == fail {
            print("입력한 값을 다시 확인하세요, 정수를 입력해야 합니다")
            return userInputNumber()
        }
        return convertedInt
    }
    func userInputNumber()->Int{
        let convertedString = convertString()
        let convertedInt = comvertInt(convertedString)
        return convertedInt
    }
    
    func isoverOne(_ convertedInt:Int)->Int{
        let fail = 0
        guard convertedInt > 1 else {
            return fail
        }
        return convertedInt
    }
    
    func playerNumberCheck(_ overOne:Int)->Int{
        let fail = 0
        if overOne == fail {
            print("최소 플레이어수는 2명 입니다")
            return playerNumber()
        }
        return overOne
    }
    
    func ladderHeightCheck(_ overOne:Int)->Int{
        let fail = 0
        if overOne == fail {
            print("최소 사다리 높이는 2 입니다")
            return ladderHeight()
        }
        return overOne
    }
    
    func playerNumber()->Int{
        print("플레이어 수를 입력하세요")
        let playerNumber = playerNumberCheck(isoverOne(userInputNumber()))
        return playerNumber
    }
    
    func ladderHeight()->Int{
        print("사다리 높이를 입력하세요")
        let ladderHeight = ladderHeightCheck(isoverOne(userInputNumber()))
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



