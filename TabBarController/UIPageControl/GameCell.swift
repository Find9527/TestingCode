//
//  GameCell.swift
//  UIPageControl
//
//  Created by Orange on 2021/6/10.
//

import UIKit

class GameCell: UITableViewCell {
    
    var game: Game! {
            didSet {
                gameNameLabel.text = game.name
                gameDetailLabel.text = game.detail
                gameImage.image = UIImage(named: game.pictureName)
            }
        }

    

    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var gameDetailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



