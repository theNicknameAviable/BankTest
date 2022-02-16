//
//  characterCell.swift
//  Banktest
//
//  Created by Raul Bautista on 14/2/22.
//

import Foundation
import UIKit

class characterCell: UITableViewCell {
  
    @IBOutlet weak var character: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        character.textColor = .darkGray
        backgroundColor = .white
    }
}
