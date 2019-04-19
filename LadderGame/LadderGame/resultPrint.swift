//
//  resultPrint.swift
//  LadderGame
//
//  Created by 이희찬 on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Output {
    func playPrint(ladders:[[Character]]){
        for i in ladders{
            print(String(i))
        }
    }
}
