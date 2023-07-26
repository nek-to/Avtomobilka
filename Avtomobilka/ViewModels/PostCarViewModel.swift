import Combine

final class PostCarViewModel: ObservableObject {
	enum Statement {
		case initialLoading
		case appendLoading
	}
	
	@Published var carPost: [Post]?
	@Published var isLoading = false
	@Published var error: Error?
	private var carId = 0
	private var page = 1
	
	private var cancelable = Set<AnyCancellable>()
	
	func fetchMoreCarPosts() {
		page += 1
		fetchCarPostsInformation(car: carId, .appendLoading)
	}
	
	func fetchCarPostsInformation(car id: Int, _ state: Statement = .initialLoading) {
		isLoading = true
		NetworkManager.shared.getCarPosts(for: id, page)
			.sink { [weak self] completion in
				switch completion {
				case .failure(let error):
					self?.error = error
				case .finished:
					break
				}
			} receiveValue: { [weak self] carPost in
				switch state {
				case .initialLoading:
					self?.carPost = carPost.posts
				case .appendLoading:
					self?.carPost?.append(contentsOf: carPost.posts ?? [Post]())
				}
				self?.carId = id
				self?.isLoading = false
			}
			.store(in: &cancelable)
	}
    
    func reset() {
        carPost = nil
		page = 1
    }
}
