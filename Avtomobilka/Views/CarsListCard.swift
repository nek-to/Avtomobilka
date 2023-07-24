import SwiftUI

struct CarsListCard: View {
	var image: [CarImages]
	var brand: String
	var model: String
	var year: Int
	var transmission: String
	
	var body: some View {
		VStack {
			ScrollView(.horizontal, showsIndicators: false) {
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
			
			HStack {
				VStack(alignment: .leading) {
					HStack {
						Text("Бренд:")
							.padding(.bottom, 3)
							.foregroundColor(Color.gray)
						
						Text(brand)
							.padding(.bottom, 3)
					}
					
					HStack {
						Text("Модель:")
							.padding(.bottom, 3)
							.foregroundColor(Color.gray)
						
						Text(model)
							.padding(.bottom, 3)
					}
				}
				
				Spacer()
				
				VStack(alignment: .trailing) {
					HStack {
						Text("Год:")
							.padding(.bottom, 3)
							.foregroundColor(Color.gray)
						
						Text(String(year))
							.padding(.bottom, 3)
					}
					
					HStack {
						Text("КП:")
							.padding(.bottom, 3)
							.foregroundColor(Color.gray)
						
						Text(transmission)
							.padding(.bottom, 3)
					}
				}
			}
			.padding([.bottom, .horizontal])
		}
		.background(Color.white)
		.cornerRadius(25)
		.shadow(radius: 8)
		.padding(.horizontal)
	}
}
