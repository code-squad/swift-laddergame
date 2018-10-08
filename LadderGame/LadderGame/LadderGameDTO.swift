//
//  LadderGameToResultViewDTO.swift
//  LadderGame
//
//  Created by 윤동민 on 2018. 10. 8..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGameDTO {
    var height : Int
    var names : [LadderPlayer]
    var ladder : [[LadderStep]]
    
    init(){
        height = 0
        names = []
        ladder = [[]]
    }
}
