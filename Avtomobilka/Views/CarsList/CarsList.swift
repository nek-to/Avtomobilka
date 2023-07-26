import SwiftUI

struct ContentView: View {
	@ObservedObject var carsListViewModel = CarsListViewModel()
    @StateObject var carViewModel = CarViewModel()
	@StateObject var postViewModel = PostCarViewModel()
	
	@State private var selectedCarId: Int?
	
	var body: some View {
		NavigationStack {
            Text("Автомобилка")
                .font(.title)
                .fontWeight(.bold)
            
			ScrollView(.vertical) {
				LazyVStack {
					ForEach(carsListViewModel.carsList, id: \.id) { car in
						NavigationLink(
							destination: CarScreen(carViewModel: carViewModel, postsViewModel: postViewModel)
								.onAppear {
									carViewModel.fetchCarInformation(car: car.id)
                                    postViewModel.fetchCarPostsInformation(car: car.id)
								},
							tag: car.id,
							selection: $selectedCarId
						) {
							CarsListCard(image: car.images,
										 brand: car.brandName,
										 model: car.modelName,
										 year: car.year,
										 transmission: car.transmissionName)
								.padding(.vertical, 5)
						}
						.onAppear {
							if car.id == carsListViewModel.carsList.last?.id {
								carsListViewModel.fetchMoreCarsInList()
							}
						}
					}
				}
				
				if carsListViewModel.isLoading {
					ProgressView()
						.progressViewStyle(.circular)
						.padding(.all)
				}
			}
		}
		.onAppear {
			carsListViewModel.fetchCarsList()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
