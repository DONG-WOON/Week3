//
//  Case1.swift
//  Week3
//
//  Created by 서동운 on 9/16/23.
//

import Foundation

protocol Setting: Hashable {

    var id: UUID { get }
    static var headerTitle: String? { get }
    static var footerTitle: String?  { get }
    var title: String  { get }
    var subTitle: String?  { get }
    var imageName: String?  { get }
    var imageColor: String? { get }
}

struct Case1: Hashable {
    let setting: any Setting
    
    init(_ setting: any Setting) {
        self.setting = setting
    }
    
    static func == (lhs: Case1, rhs: Case1) -> Bool {
        return lhs.setting.id == rhs.setting.id
    }
}

extension Case1 {
    func hash(into hasher: inout Hasher) {
        hasher.combine(setting)
    }
}

enum ModeSetting: Int, Hashable, CaseIterable, Setting {
    
    case doNotDisturb
    case sleep
    case work
    case personal
    
    var id: UUID { return UUID() }
    
    static var headerTitle: String? {
        return "모드설정"
    }
    
    static var footerTitle: String? {
        return "집중 모드에서는 광고 및 알림 소리가 울리지 않습니다."
    }
    
    var title: String {
        switch self {
        case .doNotDisturb: return "방해 금지 모드"
        case .sleep: return "수면"
        case .work: return "업무"
        case .personal: return "개인 시간"
        }
    }
    
    var subTitle: String? {
        switch self {
        case .doNotDisturb: return "켬"
        case .personal: return "설정"
        case .work: return "09:00 ~ 06:00"
        default: return nil
        }
    }
    
    var imageName: String? {
        switch self {
            
        case .doNotDisturb:
            return "moon.fill"
        case .sleep:
            return "bed.double.fill"
        case .work:
            return "iphone"
        case .personal:
            return "person.fill"
        }
    }
    
    var imageColor: String? {
        switch self {
        case .doNotDisturb:
            return "purple"
        case .sleep:
            return "orange"
        case .work:
            return "green"
        case .personal:
            return "tintColor"
        }
    }
}

enum ShareSetting: Hashable, Setting {
    
    case share(Bool)
    
    var id: UUID { return UUID() }
    static var headerTitle: String? { return nil }
    static var footerTitle: String? {
        return "이 기기에서 집중모드를 켜면 사용자와의 다른 기기에서도 집중모드가 켜집니다"
    }
    var subTitle: String? { return nil }
    var imageName: String? { return nil }
    var imageColor: String? { return nil }
    
    var title: String {
        switch self {
        case .share: return "모든 기기에서 공유"
        }
    }
    
    var isShared: Bool {
        switch self {
        case .share(let bool):
            return bool
        }
    }
}
