import SwiftUI

struct CarsListCard: View {
	var image: [CarImages]
	var brand: String
	var model: String
	var year: Int
	var transmission: String
	
	var body: some View {
		VStack {
			ScrollView(.horizontal) {
				VStack {
					LazyHGrid(rows: [GridItem(.flexible())]) {
						ForEach(image, id: \.id) { imageUrl in
							AsyncImage(url: URL(string: imageUrl.thumbnailUrl)) { image in
								image
									.resizable()
									.cornerRadius(15)
									.aspectRatio(contentMode: .fit)
									.clipped()
							} placeholder: {
								ProgressView()
							}
						}
					}
				}
				.frame(height: 250)
				.padding(.all)
			}
			
			CarListCardInfoView(brand: brand, model: model, transmission: transmission, year: year)
		}
		.background(Color.white)
		.cornerRadius(25)
		.shadow(radius: 8)
		.padding(.horizontal)
	}
}
