//
//  ShoppingTableViewCell.swift
//  Week3
//
//  Created by 서동운 on 7/29/23.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    
    static let identifier = "ShoppingTableViewCell"
    
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
    
    func updateCell(with shoppingItem: ShoppingItem) {
        checkButton.isSelected = shoppingItem.isBought
        favoriteButton.isSelected = shoppingItem.isFavorited
        nameLabel.text = shoppingItem.name
    }
}
