import Foundation

struct CarUser: Codable {
	var id: Int
	var username: String
	var email: String?
	var about: String?
	var avatar: AuthorAvatar
	var autoCount: Int
	var mainAutoName: String
	
	enum CodingKeys: String, CodingKey {
		case id
		case username
		case email
		case about
		case avatar
		case autoCount = "auto_count"
		case mainAutoName = "main_auto_name"
	}
}
