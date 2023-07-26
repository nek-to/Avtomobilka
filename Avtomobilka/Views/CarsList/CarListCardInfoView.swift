import SwiftUI

struct CarListCardInfoView: View {
	var brand: String
	var model: String
	var transmission: String
	var year: Int
	
	var body: some View {
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
}
