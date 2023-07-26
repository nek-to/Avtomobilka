import SwiftUI

struct AvatarView: View {
	var avatar: String
	
	var body: some View {
		AsyncImage(url: URL(string: avatar)) { image in
			image
				.resizable()
				.scaledToFit()
				.frame(width: 100)
				.clipShape(Circle())
				.overlay {
					Circle().stroke(Color.white, lineWidth: 10)
				}
		} placeholder: {
			ProgressView()
		}
	}
}
