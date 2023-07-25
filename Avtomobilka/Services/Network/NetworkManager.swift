import Foundation
import Combine

private enum Urls {
	static let carsList = "http://am111.05.testing.place/api/v1/cars/list?page="
	static let car = "http://am111.05.testing.place/api/v1/car/"
//	static let carPosts = "http://am111.05.testing.place/api/v1/car/"
}

class NetworkManager: ObservableObject {
	static let shared = NetworkManager()
	
	func getCarsList(for page: Int) -> AnyPublisher<[CarsListItem], Error> {
		let buildedUrl = Urls.carsList + String(page)
		guard let url = URL(string: buildedUrl) else {
			return Fail(error: NSError(domain: "Error", code: -1)).eraseToAnyPublisher()
		}
		return URLSession.shared.dataTaskPublisher(for: url)
			.map {
				$0.data
			}
			.decode(type: [CarsListItem].self, decoder: JSONDecoder())
			.receive(on: RunLoop.main)
			.eraseToAnyPublisher()
	}
	
	func getCarInfo(for id: Int) -> AnyPublisher<Car, Error> {
		let buildedUrl = Urls.car + String(id)
		print(buildedUrl)
		guard let url = URL(string: buildedUrl) else {
			return Fail(error: NSError(domain: "Error", code: -1)).eraseToAnyPublisher()
		}
		return URLSession.shared.dataTaskPublisher(for: url)
			.map {
				$0.data
			}
			.decode(type: Car.self, decoder: JSONDecoder())
			.receive(on: RunLoop.main)
			.eraseToAnyPublisher()
	}
	
	func getCarPosts(for id: Int) -> AnyPublisher<PostsForCar, Error> {
        let buildedUrl = Urls.car + String(id) + String("/posts")
        print(buildedUrl)
		guard let url = URL(string: buildedUrl) else {
			return Fail(error: NSError(domain: "Error", code: -1)).eraseToAnyPublisher()
		}
		return URLSession.shared.dataTaskPublisher(for: url)
			.map {
				$0.data
			}
			.decode(type: PostsForCar.self, decoder: JSONDecoder())
			.receive(on: RunLoop.main)
			.eraseToAnyPublisher()
	}
}
