//
//  ViewControllerCharacter.swift
//  Banktest
//
//  Created by Raul Bautista on 22/2/22.
//

import UIKit


class ViewControllerCharacter: UIViewController{

    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var descriptionCharacter: UILabel!
    var character: String? = ""
    var infoCharacter: String? = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printDescription()
    }
    
    func printDescription() {
        characterName.text = character
        descriptionCharacter.text = infoCharacter
    }
}
