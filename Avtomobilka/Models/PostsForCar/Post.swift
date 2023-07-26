import Foundation
struct Post: Codable {
	var id: Int
	var text: String
	var likeCount: Int
	var createdAt: String
	var commentCount: Int
	var postImage: String?
	var author: PostAuthor
	var formattedDate: String?
	
	enum CodingKeys: String, CodingKey {
		case id
		case text
		case likeCount = "like_count"
		case createdAt = "created_at"
		case commentCount = "comment_count"
		case postImage = "img"
		case author
		case formattedDate
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		id = try container.decode(Int.self, forKey: .id)
		text = try container.decode(String.self, forKey: .text)
		likeCount = try container.decode(Int.self, forKey: .likeCount)
		commentCount = try container.decode(Int.self, forKey: .commentCount)
		postImage = try container.decodeIfPresent(String.self, forKey: .postImage)
		author = try container.decode(PostAuthor.self, forKey: .author)
		
		createdAt = try container.decode(String.self, forKey: .createdAt)
		formattedDate = Formatter.shared.formatCreatedAt(createdAt)
	}
}
