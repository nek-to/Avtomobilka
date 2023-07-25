import Combine

final class CarViewModel: ObservableObject {
	@Published var car: Car?
	@Published var error: Error?
	
	private  var cancelable = Set<AnyCancellable>()
	
	func fetchCarInformation(car id: Int) {
		NetworkManager.shared.getCarInfo(for: id)
			.sink { [weak self] completion in
				switch completion {
				case .failure(let error):
					self?.error = error
				case .finished:
					break
				}
			} receiveValue: { [weak self] car in
				self?.car = car
			}
			.store(in: &cancelable)
	}
    
    func reset() {
        car = nil
    }
}
