//
//  protocol.swift
//  LadderGame
//
//  Created by 이동영 on 11/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


protocol Healable{
    var 착한마음씨 : String { get }
    func heal()
}

struct Nurse : Healable{
    var 착한마음씨: String
    func heal() {
        print("주사로 치료합니다")
    }
}

struct Doctor : Healable {
    var 착한마음씨: String
    func heal() {
        print("수술로 치료합니다.")
    }
}


struct Grandma: Healable {
    var 착한마음씨: String
    func heal(){
        print("약손으로 치료합니다")
    }
}


struct Patient {
    let helper : Healable
}

let 환자 = Patient(helper: )



