//
//  Case2.swift
//  Week3
//
//  Created by 서동운 on 7/29/23.
//

import Foundation

struct Case2: Hashable {
    
    enum Setting: Int, CaseIterable {
        
        static let sectionCount = Self.allCases.count
        
        case general
        case personal
        case etc
        
        var korean: String {
            switch self {
            case .general: return "전체설정"
            case .personal: return "개인설정"
            case .etc: return "기타"
            }
        }
        
        init?(section: Int) {
            self.init(rawValue: section)
        }
        
        var items: [String] {
            switch self {
            case .general: return  ["공지사항", "실험실", "버전정보"]
            case .personal: return  ["개인/보안", "알림", "채팅", "멀티프로필"]
            case .etc: return ["고객센터/도움말"]
            }
        }
    }
}
