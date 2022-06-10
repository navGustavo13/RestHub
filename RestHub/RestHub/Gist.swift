//
//  Gist.swift
//  RestHub
//
//  Created by gustavo.salazar on 10/06/22.
//

import Foundation


struct Gist: Codable {
    var id: String
    var isPublic: Bool
    var description: String
    
    enum CodingKeys : String, CodingKey{
        case id,description,isPublic = "public"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
    
        self.id = try container.decode(String.self, forKey: .id)
        self.isPublic = try container.decode(Bool.self, forKey: .isPublic)
        self.description = try container.decode(String.self, forKey: .description)
    }
}
