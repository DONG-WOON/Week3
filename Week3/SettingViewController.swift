//
//  SettingViewController.swift
//  Week3
//
//  Created by 서동운 on 7/27/23.
//

import UIKit

enum Setting: CaseIterable {
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


class SettingViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return Setting.general.korean
        case 1: return Setting.personal.korean
        case 2: return Setting.etc.korean
        default: return nil
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Setting.titleCount
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: <#T##IndexPath#>)
//    }
}
