

import Foundation
struct Images : Codable, Identifiable {
	let id : String?
	let created_at : String?
	let urls : Urls?
	let likes : Int?
	let user : User?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case created_at = "created_at"
		case urls = "urls"
		case likes = "likes"
		case user = "user"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		urls = try values.decodeIfPresent(Urls.self, forKey: .urls)
		likes = try values.decodeIfPresent(Int.self, forKey: .likes)
		user = try values.decodeIfPresent(User.self, forKey: .user)
	}

}
