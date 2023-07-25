import SwiftUI

struct ContentView: View {
	@ObservedObject var viewModel = CarsListViewModel()
	
	var body: some View {
		ScrollView(.vertical) {
			LazyVStack {
				ForEach(viewModel.carsList, id: \.id) { car in
					CarsListCard(image: car.images,
								 brand: car.brandName,
								 model: car.modelName,
								 year: car.year,
								 transmission: car.transmissionName)
					.padding(.vertical, 5)
					.onAppear {
						if car.id == viewModel.carsList.last?.id {
							viewModel.fetchMoreCarsInList()
						}
					}
				}
				
				if viewModel.isLoading {
					ProgressView()
						.progressViewStyle(.circular)
						.padding(.all)
				}
			}
			.onAppear {
				viewModel.fetchCarsList()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
