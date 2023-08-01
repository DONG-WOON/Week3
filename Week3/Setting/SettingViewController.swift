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
        guard let section = Setting(section: section) else { return nil }
        return section.korean
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Setting.sectionCount
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Setting(section: section) else { return 0 }
        return Setting[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Setting(section: indexPath.section) else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingViewCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = Setting[section][indexPath.row]
        
        cell.contentConfiguration = content
        
        return cell
    }
}
