import Foundation


func main() throws {
    
    
    
    
    
    
    
}


do {
    try main()
} catch InputError.notNumber {
    print("오류: 숫자가 아님")
} catch InputError.invalidNumberOfParticipants {
    print("오류: 유효하지 않은 참여자 수")
} catch InputError.invalidLadderHeight {
    print("오류: 유효하지 않은 사다리 높이")
} catch {
    print("예상치 못한 오류: \(error)")
}

