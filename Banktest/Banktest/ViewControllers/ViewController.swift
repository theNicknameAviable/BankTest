//
//  ViewController.swift
//  Banktest
//
//  Created by Raul Bautista on 1/2/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    static let host: String = "https://gateway.marvel.com"
    var characterList: [MarvelResult] = []
    lazy var emptyLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 16)
        view.textAlignment = .center
        view.numberOfLines = 0
        view.text = NSLocalizedString("No Info", comment: "")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        table.estimatedRowHeight = 90
        table.dataSource = self
        table.delegate = self
        registerTableViewCells()
        fetchInfo()
    }
    
    func reloadData() {
        if characterList.isEmpty {
            showEmptyView()
        } else {
            hideEmptyView()
        }
        table.reloadData()
    }
    
    
    
    func fetchInfo() {
        
        let timeStamp = String(format: "%.f", Date().timeIntervalSince1970)
        let publicKey = "1de4fe3d3a6a89ba1e61bb34889865f1"
        let privateKey = "8074772204a5fa9445ca96c81837f2b6d85b546b"
        let hash = String(format: "%@%@%@", timeStamp, privateKey, publicKey)
        let hasMD5 = hash.md5()
        let auth = "?ts=\(timeStamp)&apikey=\(publicKey)&hash=\(hasMD5)"
        let url = "\(Self.host)/v1/public/characters\(auth)"
        
        AF.request(url)
            .responseDecodable(of: ResponseMarvel.self) {response in
            //aquí llega la respuesta del servidor.
                print(response.value)
                if let value = response.value {
                    //funciona y recarga
                    self.characterList = value.data.results
                } else {
                    // mostrar error
                }
                self.reloadData()
        }
        
    }

}

//MARK: - TABLE

extension ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as? CharacterCell
        cell?.character.text = "Character: \(characterList[indexPath.row].name)"

        if let celda = cell {
            return celda
        }
    return UITableViewCell()
        
    }
    
    func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "CharacterCell",bundle: nil)
        table.register(textFieldCell,forCellReuseIdentifier: "CharacterCell")
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return NSLocalizedString("Character", comment: "")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = characterList[indexPath.row]
        showCharacterDetail(response: item)
    }

}


//MARK: - Configuration
extension ViewController {
    
    func showEmptyView() {
        if !self.view.subviews.contains(emptyLabel) {
            self.view.insertSubview(emptyLabel, belowSubview: table)
            NSLayoutConstraint.activate([
                emptyLabel.widthAnchor.constraint(equalToConstant: 250),
                emptyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                emptyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                emptyLabel.heightAnchor.constraint(equalToConstant: 250)])
        }
    }
    
    func hideEmptyView() {
        if self.view.subviews.contains(emptyLabel) {
            emptyLabel.removeFromSuperview()
        }
    }
    
    func showCharacterDetail(response: MarvelResult) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "ViewControllerCharacter") as? ViewControllerCharacter else {return}
        detailViewController.character = response.name
        detailViewController.infoCharacter =  response.resultDescription
        present(detailViewController, animated: true, completion: nil)
    }
    
}
