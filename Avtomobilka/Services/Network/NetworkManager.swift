import Foundation
import Combine

private enum Urls {
	static let carsList = "http://am111.05.testing.place/api/v1/cars/list?page="
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
}
