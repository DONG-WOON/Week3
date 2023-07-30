//
//  ShoppingTableViewCell.swift
//  Week3
//
//  Created by 서동운 on 7/29/23.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    
    static let identifier = "ShoppingTableViewCell"
    var boughtItem: (Bool) -> Void = { (IsBought) in }
    var favoriteItem: (Bool) -> Void = { (IsFavorite) in }
    
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        cellBackgroundView.rounded(cornerRadius: 5)
        
        
        // 버튼의 .selected 상태를 토글하면 백그라운드의 색이 변하는데, 이 색을 고정해두도록 하고, selected상태를 변경하는게 효율적인지, 아니면 그때그때 image를 변경하는게 좋을지.
        
        checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        
        favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .selected)
    }
    
    override func prepareForReuse() {
        checkButton.isSelected = false
        favoriteButton.isSelected = false
        nameLabel.text = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func checkButtonDidTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        boughtItem(sender.isSelected)
    }

    @IBAction func favoriteButtonDidTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        favoriteItem(sender.isSelected)
    }
    
    func updateCell(with shoppingItem: ShoppingItem) {
        checkButton.isSelected = shoppingItem.isBought
        favoriteButton.isSelected = shoppingItem.isFavorited
        nameLabel.text = shoppingItem.name
    }
}
