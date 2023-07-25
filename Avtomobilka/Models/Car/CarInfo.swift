import Foundation

struct CarInfo: Codable, Identifiable {
	var id: Int
	var forSale: Int
	var brandName: String
	var modelName: String
	var year: Int
	var price: Int?
	var brandId: Int
	var modelId: Int
	var engineId: Int
	var transmissionId: Int
	var placeId: String?
	var name: String
	var cityName: String
	var countryName: String
	var transmissionName: String
	var placeName: String
	var images: [CarImages]
	var inSectionCount: Int
	var followersCount: Int
	var follow: Bool
	var engine: String
	var engineName: String
	var engineVolume: String
	var isModerated: Bool
	
	enum CodingKeys: String, CodingKey {
		case id
		case forSale = "for_sale"
		case brandName = "brand_name"
		case modelName = "model_name"
		case year
		case price
		case brandId = "brand_id"
		case modelId = "model_id"
		case engineId = "engine_id"
		case transmissionId = "transmission_id"
		case placeId = "place_id"
		case name
		case cityName = "city_name"
		case countryName = "country_name"
		case transmissionName = "transmission_name"
		case placeName = "place_name"
		case images
		case inSectionCount = "in_selection_count"
		case followersCount = "followers_count"
		case follow
		case engine
		case engineName = "engine_name"
		case engineVolume = "engine_volume"
		case isModerated = "is_moderated"
	}
}
