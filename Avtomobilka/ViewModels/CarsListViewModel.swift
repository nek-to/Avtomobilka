import Combine

final class CarsListViewModel: ObservableObject {
	@Published var carsList = [CarsListItem]()
	@Published var isLoading = false
	@Published var error: Error?
	private var page = 1

	private var cancelable = Set<AnyCancellable>()
	
	func fetchMoreCarsInList() {
		page += 1
		fetchCarsList()
	}
	
	func fetchCarsList() {
		isLoading = true
		NetworkManager.shared.getCarsList(for: page)
			.sink { [weak self] completion in
				switch completion {
				case .failure(let error):
					self?.error = error
					print(error)
				case .finished:
					break
				}
			} receiveValue: { [weak self] carsListItem in
				self?.carsList.append(contentsOf: carsListItem)
				self?.isLoading = false
				print("Loaded")
			}
			.store(in: &cancelable)
	}
}
