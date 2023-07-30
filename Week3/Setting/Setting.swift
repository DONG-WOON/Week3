//
//  Setting.swift
//  Week3
//
//  Created by 서동운 on 7/29/23.
//

import Foundation

enum Setting: Int, CaseIterable {
    case general
    case personal
    case etc
    
    var korean: String {
        switch self {
        case .general: return "전체설정"
        case .personal: return "개인설정"
        case .etc: return "기타설정"
        }
    }
    
    static subscript(_ title: Setting) -> [String] {
        switch title {
        case .general: return  ["공지사항", "실험실", "버전정보"]
        case .personal: return  ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .etc: return ["고객센터/도움말"]
        }
    }
    
    static let titleCount = Self.allCases.count
}
