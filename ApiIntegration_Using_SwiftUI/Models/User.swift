

import Foundation
struct User : Codable {
	let id : String?
	let updated_at : String?
	let username : String?
	let name : String?
	let total_likes : Int?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case updated_at = "updated_at"
		case username = "username"
		case name = "name"
		case total_likes = "total_likes"

	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		username = try values.decodeIfPresent(String.self, forKey: .username)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		total_likes = try values.decodeIfPresent(Int.self, forKey: .total_likes)
	}

}
