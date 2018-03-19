//
//  ladderFrom.swift
//  LadderGame
//
//  Created by Jung seoung Yeo on 2018. 3. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

func makeLadderLineOutputFrom(ladderLine: Array<String>) -> String {
    
    var ladderLineFrom = ""
    
    for ladderLineValue in ladderLine {
        ladderLineFrom += ladderLineValue
    }
    return ladderLineFrom
}
