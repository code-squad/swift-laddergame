//
//  LadderInfo.swift
//  test2
//
//  Created by Mrlee on 2017. 10. 30..
//  Copyright © 2017년 Mrlee. All rights reserved.
//

import Foundation

struct LadderInfo {
    let horizLine: String = "-"
    let vertiLine: String = "|"
    let spaceLine: String = " "
    var components: [String] = [""]
    var frames: [[String]] = [[""]]
    var rowNumber: Int = 0
    var columnNumber: Int = 0
}
