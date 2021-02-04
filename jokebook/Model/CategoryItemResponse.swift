//
//  CategoryItemResponse.swift
//  jokebook
//
//  Created by Muhammad Riaz on 04/02/2021.
//

import Foundation

class JokeItems: Codable {

  enum CodingKeys: String, CodingKey {
    case type
    case setup
    case id
    case punchline
  }

  var type: String?
  var setup: String?
  var id: Int?
  var punchline: String?

  init (type: String?, setup: String?, id: Int?, punchline: String?) {
    self.type = type
    self.setup = setup
    self.id = id
    self.punchline = punchline
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decodeIfPresent(String.self, forKey: .type)
    setup = try container.decodeIfPresent(String.self, forKey: .setup)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    punchline = try container.decodeIfPresent(String.self, forKey: .punchline)
  }

}
