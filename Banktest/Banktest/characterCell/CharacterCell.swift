//
//  characterCell.swift
//  Banktest
//
//  Created by Raul Bautista on 14/2/22.
//

import UIKit

class CharacterCell: UITableViewCell {
  
    @IBOutlet weak var character: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        //character.textColor = .darkGray
        backgroundColor = .white
    }
}
