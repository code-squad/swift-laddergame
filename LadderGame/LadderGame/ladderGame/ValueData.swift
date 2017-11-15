//
//  ValueData.swift
//  ladderGame
//
//  Created by Choi Jeong Hoon on 2017. 11. 15..
//  Copyright © 2017년 JH Factory. All rights reserved.
//

import Foundation


struct ValueData {
    private (set) var names = Array<String>()
    private (set) var heightOfLadder = Int()
    
    init(_ names: Array<String>, heightOfLadder: Int) {
        self.names = names
        self.heightOfLadder = heightOfLadder
    }
    
}
