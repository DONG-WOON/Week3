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
    ] {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var inputFieldBackgroundView: UIView!
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputFieldBackgroundView.rounded(cornerRadius: 5)
    }
    
    @IBAction func addButtonDidTapped(_ sender: UIButton) {
        guard let name = inputTextField.text else { return }
        
        shoppingList.append(ShoppingItem(isBought: false, isFavorited: false, name: name))
        inputTextField.text = nil
    }
    
    @objc
    func checkButtonDidTapped(_ sender: UIButton) {
        let indexPathOfCell = sender.tag
        shoppingList[indexPathOfCell].isBought.toggle()
    }
    
    @objc
    func favoriteButtonDidTapped(_ sender: UIButton) {
        let indexPathOfCell = sender.tag
        shoppingList[indexPathOfCell].isFavorited.toggle()
    }
}

extension ShoppingViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.identifier, for: indexPath) as? ShoppingTableViewCell else { return UITableViewCell() }
        let item = shoppingList[indexPath.row]
        print(indexPath)
        
        cell.checkButton.tag = indexPath.row
        cell.favoriteButton.tag = indexPath.row
        
        cell.checkButton.addTarget(self, action: #selector(checkButtonDidTapped), for: .touchUpInside)
        cell.favoriteButton.addTarget(self, action: #selector(favoriteButtonDidTapped), for: .touchUpInside)
        
        cell.updateCell(with: item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        shoppingList.remove(at: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
