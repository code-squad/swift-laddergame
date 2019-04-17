//
//  Util.swift
//  LadderGame
//
//  Created by 이동영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum ErrorType:String,Error{
    case wrongInput = "입력형식이 맞지않습니다"
    case outOfRange = "숫자범위가 벗어났습니다"
    case longName = "이름의 길이가 5글자를 초과하였습니다."
    case emptyValue = "입력이 없습니다."
    
}
func alertErrorMessage(type:ErrorType? = nil ){
    print("=======================================================")
    print("               ❗️\(type?.rawValue ?? "예기치못한 오류입니다." )❗️")
    print("                     재시작합니다")
    print("=======================================================")
}



