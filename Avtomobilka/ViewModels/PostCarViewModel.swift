import Combine

final class PostCarViewModel: ObservableObject {
	@Published var carPost: PostsForCar?
//	@Published var isLoading = false
	@Published var error: Error?
	
	private var cancelable = Set<AnyCancellable>()
	
    func fetchCarPostsInformation(car id: Int) {
		NetworkManager.shared.getCarPosts(for: id)
			.sink { [weak self] completion in
				switch completion {
				case .failure(let error):
					self?.error = error
				case .finished:
					break
				}
			} receiveValue: { [weak self] carPost in
				self?.carPost = carPost
			}
			.store(in: &cancelable)
	}
    
    func reset() {
        carPost = nil
    }
}
