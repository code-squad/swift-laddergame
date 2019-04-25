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
    
    mutating func checkUserInputInt() -> Bool {
        userInputString()
        guard isInt() else {
            return false
        }
        return true
    }
    
    mutating func userInputInt() {
        var checkUserInputInt = self.checkUserInputInt()
        while checkUserInputInt == false {
            print("입력한 값을 다시 확인하세요, 정수를 입력해야 합니다")
            checkUserInputInt = self.checkUserInputInt()
        }
    }
    
    func isOverOne()->Bool{
        guard convertedInt > 1 else {
            return false
        }
        return true
    }
    
    
    let playerNumberRequestMassage = "플레이어 수"
    let ladderHeightRequestMassage = "사다리 높이"
    
    mutating func checkNumber(_ RequestMassage : String) -> Bool {
        print(RequestMassage + "를 입력하세요")
        userInputInt()
        guard isOverOne() else{
            print("최소" + RequestMassage + "는 2입니다," + RequestMassage + "를 다시 입력해주세요")
            return false
        }
        return true
    }
    
    mutating func Number(_ RequestMassage : String) {
        var number : Bool
        repeat {
            number = self.checkNumber(RequestMassage)
        }
            while number == false
    }
    
    mutating func DrawInitMember()->(Int,Int){
        Number(playerNumberRequestMassage)
        let playerNumber = convertedInt
        Number(ladderHeightRequestMassage)
        let ladderHeight = convertedInt
        return (playerNumber,ladderHeight)
    }
}




