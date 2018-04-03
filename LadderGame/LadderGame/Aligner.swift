//
//  Aligner.swift
//  LadderGame
//
//  Created by Yoda Codd on 2018. 4. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

/// 사람이름 정렬해주는 구조체
struct Aligner {
    /// 받은 이름을 사다리게임에 맞게 조절해서 문자열로 리턴
    private func alignNameFrom(personName : String) -> String {
        // 글자수를 기준으로 6칸에 위치를 조정해서 리턴
        switch personName.count {
        case 1 :
            return (String(repeating: " ", count: 2)+String(personName)+String(repeating: " ", count: 3))
        case 2 :
            return (String(repeating: " ", count: 2)+String(personName)+String(repeating: " ", count: 2))
        case 3 :
            return (String(repeating: " ", count: 1)+String(personName)+String(repeating: " ", count: 2))
        case 4 :
            return (String(repeating: " ", count: 0)+String(personName)+String(repeating: " ", count: 2))
        case 5 :
            return (String(repeating: " ", count: 0)+String(personName)+String(repeating: " ", count: 1))
        default :
            return String(personName)
        }
    }
    
    /// 검증끝난 이름리스트를 받아서 정렬 후 배열로 리턴
    func alignNameList(nameList : Array<String>) -> Array<String>{
        //리턴용 배열 선언
        var alignedNameList = Array<String>()
        // 입력받은 이름들을 정렬해서 배열에 추가한다
        for name in nameList {
            alignedNameList.append(alignNameFrom(personName: name))
        }
        return alignedNameList
    }
}
