import SwiftUI

struct CarsListCard: View {
	var image: String
	var brand: String
	var model: String
	var year: Int
	var transmission: String
	
	var body: some View {
		VStack {
			VStack {
				AsyncImage(url: URL(string: image)) { image in
					image
						.resizable()
						.scaledToFill()
						.cornerRadius(15)
						.padding(.all)
				} placeholder: {
					ProgressView()
				}
				
				HStack {
					VStack(alignment: .leading) {
						Text("Бренд: \(brand)")
							.padding(.bottom, 3)
						
						Text("Модель: \(model)")
							.padding(.bottom, 3)
					}
					
					Spacer()
					
					VStack(alignment: .trailing) {
						Text("Год: \(String(year))")
							.padding(.bottom, 3)
						
						Text("Трансмиссия: \(transmission)")
							.padding(.bottom, 3)
					}
				}
				.padding([.bottom, .horizontal])
			}
		}
		.background(Color.white)
		.cornerRadius(25)
		.shadow(radius: 20)
		.padding(.horizontal)
	}
}


struct CarsListCard_Previews: PreviewProvider {
	static var previews: some View {
		CarsListCard(image: "http://am111.05.testing.place/uploads/user/37/auto/49/fc40ee0a0dbf97b2e504b2f48438a8ba_w500.jpg", brand: "Volkswagen", model: "Tiguan", year: 2018, transmission: "AT")
	}
}
