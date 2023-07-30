//
//  MoviewViewCell.swift
//  Week3
//
//  Created by 서동운 on 7/30/23.
//

import UIKit

class MoviewViewCell: UITableViewCell {
    
    static let identifier = "MoviewViewCell"
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func update(with movie: Movie) {
        posterImageView.image = UIImage(named: movie.title)
        titleLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate
        runtimeLabel.text = "\(movie.runtime / 60)시간 \(movie.runtime % 60)분"
        rateLabel.text = "\(movie.rate)점"
        overviewLabel.text = movie.overview
    }
}
