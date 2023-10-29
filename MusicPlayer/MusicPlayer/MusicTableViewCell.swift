//
//  MusicTableViewCell.swift
//  MusicPlayer
//
//  Created by maple on 29/10/23.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(withCellViewModel cellViewModel: MusicListCellViewModel) {
        titleLabel.text = cellViewModel.title
        albumLabel.text = cellViewModel.album
        artistLabel.text = cellViewModel.artist
    }

}
