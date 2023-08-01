//
//  ShoppingViewController.swift
//  Week3
//
//  Created by 서동운 on 7/29/23.
//

import UIKit

class ShoppingViewController: UITableViewController {
    
    var shoppingList: [ShoppingItem] = [
        ShoppingItem(isBought: true, isFavorited: false, name: "그립톡"),
        ShoppingItem(isBought: false, isFavorited: true, name: "화장품"),
        ShoppingItem(isBought: false, isFavorited: false, name: "제로콜라")
    ]
    
    @IBOutlet weak var inputFieldBackgroundView: UIView!
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        
        inputFieldBackgroundView.rounded(cornerRadius: 5)
    }
    
    @IBAction func addButtonDidTapped(_ sender: UIButton) {
        guard let name = inputTextField.text else { return }
        
        shoppingList.append(ShoppingItem(isBought: false, isFavorited: false, name: name))
        inputTextField.text = nil
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.identifier, for: indexPath) as? ShoppingTableViewCell else { return UITableViewCell() }
        
        cell.updateCell(with: shoppingList[indexPath.row])
        
        cell.boughtItem = { [weak self] isBought in
            self?.shoppingList[indexPath.row].isBought = isBought
        }
        
        cell.favoriteItem = { [weak self] isFavorite in
            self?.shoppingList[indexPath.row].isFavorited = isFavorite
        }
        
        return cell
    }
}
