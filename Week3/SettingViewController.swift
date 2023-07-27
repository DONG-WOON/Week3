//
//  SettingViewController.swift
//  Week3
//
//  Created by 서동운 on 7/27/23.
//

import UIKit

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
