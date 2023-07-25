import Combine

final class CarViewModel: ObservableObject {
	@Published var car: PostsForCar?
	@Published var isLoading = false
	@Published var error: Error?
	@Published var carId = 0
	
	private var cancelable = Set<AnyCancellable>()
	
	func fetchCarInformation() {
		NetworkManager.shared.getCarPosts(for: carId)
			.sink { [weak self] completion in
				switch completion {
				case .failure(let error):
					self?.error = error
					print("ERROR \(error)")
				case .finished:
					break
				}
			} receiveValue: { [weak self] car in
				self?.car = car
				print(car)
			}
			.store(in: &cancelable)
	}
}
