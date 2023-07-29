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
        
        guard let section = Setting(rawValue: section) else { return nil }
        
        switch section {
        case .general: return Setting.general.korean
        case .personal: return Setting.personal.korean
        case .etc: return Setting.etc.korean
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Setting.titleCount
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = Setting(rawValue: section) else { return 0 }
        
        switch section {
        case .general: return 3
        case .personal: return 4
        case .etc: return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Setting(rawValue: indexPath.section) else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingViewCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = Setting[section][indexPath.row]
        
        cell.contentConfiguration = content
        
        return cell
    }
}
