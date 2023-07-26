import SwiftUI

struct PostCardInfoView: View {
	var postText: String
	var date: String
	var likesCount: Int
	var commentsCount: Int
	
	var body: some View {
		VStack(alignment: .leading) {
			Text(postText)
				.font(.caption)
				.fontWeight(.light)
				.multilineTextAlignment(.leading)
				.padding([.horizontal, .vertical], 10)
			
			HStack {
				Text(date)
					.foregroundColor(Color.black)
				
				Spacer()
				
				HStack {
					Image(systemName: "heart")
					Text(String(likesCount))
				}
				.padding(.horizontal)
				
				HStack {
					Image(systemName: "message")
					Text(String(commentsCount))
				}
			}
			.padding([.bottom, .horizontal])
		}
	}
}
