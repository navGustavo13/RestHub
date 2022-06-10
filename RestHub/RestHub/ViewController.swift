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

