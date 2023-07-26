import SwiftUI

struct StatisticsItems: View {
	@ObservedObject var carViewModel: CarViewModel
	
	var body: some View {
		VStack {
			Text(carViewModel.car?.user.username ?? "")
				.font(.largeTitle)
				.fontWeight(.bold)
				.multilineTextAlignment(.center)
			
			Text(carViewModel.car?.user.email ?? "")
				.font(.callout)
				.fontWeight(.thin)
				.multilineTextAlignment(.center)
				.foregroundColor(Color.gray)
			
			Text(carViewModel.car?.user.mainAutoName ?? "")
				.fontWeight(.bold)
				.padding(.bottom)
			
			if let aboutMe = carViewModel.car?.user.about {
				VStack {
					Text("Обо мне:")
						.padding(.bottom, 5)
					
					Text(aboutMe)
						.font(.caption)
						.fontWeight(.light)
				}
				.padding(.horizontal)
			}
		}
	}
}
