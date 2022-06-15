//
//  ViewController.swift
//  RestHub
//
//  Created by gustavo.salazar on 10/06/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let testGist = Gist(id: "", isPublic: true, description: "Hello World!",files: ["":File(content: "")])
        
        do{
            let gistData = try JSONEncoder().encode(testGist)
            let stringData = String(data: gistData, encoding: .utf8)
            print(stringData)
        } catch{
            print("encoding failed...")
        }
        
        DataService.shared.fecthGits {
            (result) in
            
            switch result {
                case .success(let gists):
                  //  print(json)
                for gist in gists{
                    print("\(gist)\n")
                }
            case .failure(let error):
                print(error)
            }
        }
    }


}

