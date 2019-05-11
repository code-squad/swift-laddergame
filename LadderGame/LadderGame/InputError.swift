import Foundation
enum InputError:Error {
    case isNotString
    case isNotInt
    case isMoreThanSix
    case isLessThanOne
    case unknownError
    
    var description: String{
        switch self{
        case .isNotString:
            return "잘못된 입력입니다. 문자열을 입력하세요."
        case .isMoreThanSix:
            return "이름의 최대 글자수는 5입니다."
        case .isLessThanOne:
            return "하나 이상을 입력해야 합니다."
        case .isNotInt:
            return "사다리 높이를 2이상의 정수로 입력하세요."
        case .unknownError:
            return "알 수 없는 에러 "
        }
    }
}
