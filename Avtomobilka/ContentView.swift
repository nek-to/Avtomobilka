import SwiftUI

struct ContentView: View {
	@ObservedObject var viewModel = CarsListViewModel()
    @StateObject var carViewModel = CarViewModel()
	@StateObject var postViewModel = PostCarViewModel()
	
	@State private var selectedCarId: Int?
	
	var body: some View {
		NavigationStack {
            Text("Avtomobilka")
                .font(.title)
                .fontWeight(.bold)
            
			ScrollView(.vertical) {
				LazyVStack {
					ForEach(viewModel.carsList, id: \.id) { car in
						NavigationLink(
							destination: CarScreen(viewModel: carViewModel, postsViewModel: postViewModel)
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
							if car.id == viewModel.carsList.last?.id {
								viewModel.fetchMoreCarsInList()
							}
						}
					}
				}
				
				if viewModel.isLoading {
					ProgressView()
						.progressViewStyle(.circular)
						.padding(.all)
				}
			}
		}
		.onAppear {
			viewModel.fetchCarsList()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
