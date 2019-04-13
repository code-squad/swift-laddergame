import Foundation

func main() throws {
    
}

do {
    try main()
} catch InputError.invalidPlayerName {
    print("오류: 참여자 이름이 5글자보다 큽니다.")
} catch InputError.invalidNumberOfParticipants {
    print("오류: 참여자 수가 유효하지 않습니다.")
} catch InputError.invalidLadderHeight {
    print("오류: 사다리 높이가 유효하지 않습니다.")
} catch {
    print("예상치 못한 오류 발생: \(error)")
}

