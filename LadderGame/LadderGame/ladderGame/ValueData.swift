//
//  ValueData.swift
//  ladderGame
//
//  Created by Choi Jeong Hoon on 2017. 11. 15..
//  Copyright © 2017년 JH Factory. All rights reserved.
//

import Foundation

// 인풋뷰의 데이터 오브젝트, 인풋뷰에서 생성한 데이터를 갖고있음
struct ValueData {
    private (set) var names = Array<String>()
    private (set) var heightOfLadder = Int()
    
    init(_ names: Array<String>, _ heightOfLadder: Int) {
        self.names = names
        self.heightOfLadder = heightOfLadder
    }
    
}
