import SwiftUI

struct ContentView: View {
	@ObservedObject var viewModel = CarsListViewModel()
	
    var body: some View {
		ScrollView(.vertical) {
				ForEach(viewModel.carsList, id: \.id) { car in
					CarsListCard(image: car.images,
									 brand: car.brandName,
									 model: car.modelName,
									 year: car.year,
									 transmission: car.transmissionName)
						.padding(.vertical, 5)
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
