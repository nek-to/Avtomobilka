import Foundation

struct CarsListItem: Codable {
	var id: Int
	var forSale: Int
	var brandName: String
	var modelName: String
	var engineName: String
	var year: Int
	var price: Int?
	var brandId: Int
	var modelId: Int
	var engineId: Int
	var transmissionId: Int
	var placeId: String
	var name: String
	var image: String
	var thumbnail: String
	var cityName: String
	var countryName: String
	var transmissionName: String
	var engineVolume: String
	var placeName: String
	var images: [CarImages]
	var engine: String
	
	enum CodingKeys: String, CodingKey {
		case id
		case forSale = "for_sale"
		case brandName = "brand_name"
		case modelName = "model_name"
		case engineName = "engine_name"
		case year
		case price
		case brandId = "brand_id"
		case modelId = "model_id"
		case engineId = "engine_id"
		case transmissionId = "transmission_id"
		case placeId = "place_id"
		case name
		case image
		case thumbnail
		case cityName = "city_name"
		case countryName = "country_name"
		case transmissionName = "transmission_name"
		case engineVolume = "engine_volume"
		case placeName = "place_name"
		case images
		case engine
	}
}
