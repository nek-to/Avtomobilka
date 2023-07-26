import SwiftUI

struct AccountStatisticsView: View {
	var followers: Int
	var autoCount: Int
	
	var body: some View {
		HStack(alignment: .center) {
			VStack {
				Text("Подписчики")
				Text(String(followers))
					.font(.title)
					.fontWeight(.bold)
			}
			.padding(.horizontal)
			
			Spacer()
			
			VStack {
				Text("Автомобили")
				
				Text(String(autoCount))
					.font(.title)
					.fontWeight(.bold)
			}
			.padding(.horizontal)
		}
		.offset(y: 180)
	}
}
