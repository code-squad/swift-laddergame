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
    
    var convertedString = " "
    var convertedInt = 0

    mutating func isString()->Bool{
        let optionalString = requestNumber
        convertedString = removeOptional(optionalString)
        if convertedString == " " {
            return false
        }
        return true
    }
    
    mutating func isInt ()->Bool{
        convertedInt = convertInt(convertedString)
        if convertedInt == 0 {
            return false
        }
        return true
    }
    
    mutating func userInputString() {
        var isString = self.isString()
        while !(isString) {
            print("값을 다시 확인하고 입력하세요")
            isString = self.isString()
        }
    }
    
    mutating func userInputInt() {
        userInputString()
        var isInt = self.isInt()
        while !(isInt) {
            print("입력한 값을 다시 확인하세요, 정수를 입력해야 합니다")
            userInputString()
            isInt = self.isInt()
        }
    }
    
    func isOverOne()->Bool{
        guard convertedInt > 1 else {
            return false
        }
        return true
    }
    
    mutating func playerNumber() {
        print("플레이어 수를 입력하세요")
        userInputInt()
        var isoverOne = self.isOverOne()
        while !(isoverOne) {
            print("최소 플레이어수는 2입니다, 플레이어수를 다시 입력해주세요")
            userInputInt()
            isoverOne = self.isOverOne()
        }
    }
    
    mutating func ladderHeight() {
        print("사다리 높이를 입력하세요")
        userInputInt()
        var isoverOne = self.isOverOne()
        while !(isoverOne) {
            print("최소 사다리 높이는 2입니다, 사다리 높이를 다시 입력해주세요")
            userInputInt()
            isoverOne = self.isOverOne()
        }
    }
    
    mutating func DrawInitMember()->(Int,Int){
        playerNumber()
        let playerNumber = convertedInt
        ladderHeight()
        let ladderHeight = convertedInt
        return (playerNumber,ladderHeight)
    }
}




