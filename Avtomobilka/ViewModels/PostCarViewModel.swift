import Combine

final class PostCarViewModel: ObservableObject {
	@Published var carPost: PostsForCar?
	@Published var isLoading = false
	@Published var error: Error?
	@Published var carId = 0
	
	private var cancelable = Set<AnyCancellable>()
	
	func fetchCarPostsInformation() {
		NetworkManager.shared.getCarPosts(for: carId)
			.sink { [weak self] completion in
				switch completion {
				case .failure(let error):
					self?.error = error
					print("ERROR \(error)")
				case .finished:
					break
				}
			} receiveValue: { [weak self] carPost in
				self?.carPost = carPost
				print(carPost)
			}
			.store(in: &cancelable)
	}
}
