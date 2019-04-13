import Foundation

extension String {
    
    /// length 만큼 글자수를 늘리고 가운데 정렬합니다.
    func alignedToCenter(length: Int) -> String {
        let space = " "
        let numberOfSpacesToAdd = length - self.count
        let leadingSpaces = String(repeating: space, count: numberOfSpacesToAdd / 2)
        let trailingSpaces = String(repeating: space, count:  numberOfSpacesToAdd - leadingSpaces.count)
        return "\(leadingSpaces)\(self)\(trailingSpaces)"
    }
    
}

struct Player {
    
    //MARK: 속성
    let name: String
    let alignedName: String
    
    //MARK: 이니셜라이저
    init(name: String) {
        self.name = name
        alignedName = name.alignedToCenter(length: LadderGame.maximumNameLength)
    }
    
}



