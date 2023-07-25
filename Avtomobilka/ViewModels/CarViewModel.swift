import Combine

final class CarViewModel: ObservableObject {
	@Published var car: Car?
	@Published var error: Error?
//	@Published var carId = 1
	
	private  var cancelable = Set<AnyCancellable>()
	
	func fetchCarInformation(car id: Int) {
		print("ENTER")
		NetworkManager.shared.getCarInfo(for: id)
			.sink { [weak self] completion in
				switch completion {
				case .failure(let error):
					self?.error = error
					print("Error car \(error)")
				case .finished:
					break
				}
			} receiveValue: { [weak self] car in
				self?.car = car
				print(car.user)
			}
			.store(in: &cancelable)
	}
}
