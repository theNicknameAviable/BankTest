//
//  ViewControllerCharacter.swift
//  Banktest
//
//  Created by Raul Bautista on 22/2/22.
//

import Foundation
import UIKit
import Alamofire


class ViewControllerCharacter: UIViewController{

    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var descriptionCharacter: UILabel!
    var character: String? = ""
    var infoCharacter: String? = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printDescription()
    }
    
    //its not a good idea
    func printDescription() {
        let marvelCharacter = Result.self
        switch descriptionCharacter {
        case 0:
            marvelCharacter?.name = self.character
            marvelCharacter.resultDescription.text = self.infoCharacter
        defautl: break
        }
    }
}
