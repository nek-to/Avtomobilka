import SwiftUI

struct CarScreen: View {
	@ObservedObject var viewModel: CarViewModel
	
	var body: some View {
		VStack {
			TopProfileView(
				thumbnail: viewModel.car?.carInfo.images.first?.url ?? "",
				avatar: viewModel.car?.user.avatar.url ?? "",
				followers: viewModel.car?.carInfo.followersCount ?? 0,
				autoCount: viewModel.car?.user.autoCount ?? 0
			)
			
			VStack {
				Text(viewModel.car?.user.username ?? "")
					.font(.largeTitle)
					.fontWeight(.bold)
					.multilineTextAlignment(.center)
				
				Text(viewModel.car?.user.email ?? "")
					.font(.callout)
					.fontWeight(.thin)
					.multilineTextAlignment(.center)
					.foregroundColor(Color.gray)
				
				Text(viewModel.car?.user.mainAutoName ?? "")
					.fontWeight(.bold)
					.padding(.bottom)
				
				if let aboutMe = viewModel.car?.user.about {
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
			Spacer()
		}
	}
}
