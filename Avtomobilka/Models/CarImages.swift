import Foundation

struct CarImages: Codable {
	var id: Int
	var isPrimary: Bool
	var size: Int
	var index: Int
	var url: String
	var thumbnailUrl: String
	var image500: String
	var image100: String
	
	enum CodingKeys: String, CodingKey {
		case id 
		case isPrimary = "is_primary"
		case size
		case index
		case url
		case thumbnailUrl = "thumbnail_url"
		case image500
		case image100
	}
}
