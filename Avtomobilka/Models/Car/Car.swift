import Foundation

struct Car: Codable {
	var carInfo: CarInfo
	var user: CarUser
	
	enum CodingKeys: String, CodingKey {
		case carInfo = "car"
		case user
	}
}

