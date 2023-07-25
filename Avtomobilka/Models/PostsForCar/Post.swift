import Foundation

struct Post: Codable {
	var id: Int
	var text: String
	var likeCount: Int
	var createdAt: String
	var commentCount: Int
	var postImage: String?
	var author: PostAuthor
	
	enum CodingKeys: String, CodingKey {
		case id
		case text
		case likeCount = "like_count"
		case createdAt = "created_at"
		case commentCount = "comment_count"
		case postImage = "img"
		case author
	}
}
