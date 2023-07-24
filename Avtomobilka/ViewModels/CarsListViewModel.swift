import Combine

final class CarsListViewModel: ObservableObject {
	@Published var carsList = [CarsListItem]()
	
	@Published var error: Error?
	
	private var cancelable = Set<AnyCancellable>()
	
	func fetchCarsList() {
		NetworkManager.shared.getCarsList()
			.sink { [weak self] completion in
				switch completion {
				case .failure(let error):
					self?.error = error
				case .finished:
					break
				}
			} receiveValue: { [weak self] carsListItem in
				self?.carsList = carsListItem
				print(carsListItem)
			}
			.store(in: &cancelable)
	}
}
