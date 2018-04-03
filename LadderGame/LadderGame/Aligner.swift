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
        // 글자수 제한을 리턴받고 거기에 세로줄(+1), 거기에 사람이름의 글자수만큼 뺴준다. 결과값은 공백의 총합
        let padding = Limiter.nameLengthLimit()+1-personName.count
        // 왼쪽 공백수를 계산한다
        let leftPadding = Int(padding/2)
        // 오른쪽 공백수를 계산한다.
        let rightPadding = padding - leftPadding
        
        //계산된 값과 사람 이름을 조합하여 리턴한다
        return(String(repeating:LadderType.none.rawValue, count:leftPadding)+personName+String(repeating: LadderType.none.rawValue, count:rightPadding))
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
