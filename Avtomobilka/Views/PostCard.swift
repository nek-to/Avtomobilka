import SwiftUI

struct PostCard: View {
	var image: String
	var date: String
	var postText: String
	var likesCount: Int
	var commentsCount: Int
	
    var body: some View {
		VStack {
			VStack {
				AsyncImage(url: URL(string: image)) { image in
					image
						.resizable()
						.scaledToFill()
				} placeholder: {
					ProgressView()
				}
				.frame(height: 300)
				
				VStack {
					Text(postText)
						.font(.caption)
						.fontWeight(.light)
						.padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing], 5.0/*@END_MENU_TOKEN@*/)
					
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
					.padding(.horizontal)
				}
			}
		}
    }
}

struct PostCard_Previews: PreviewProvider {
    static var previews: some View {
        PostCard(image: "http://am111.05.testing.place/uploads/user/32/auto/32/post/45/be3705db6c580f82430279b6f75b4b93.jpg",
				 date: "2018-12-21", postText: "Добрый день, дорогие друзья! Как-то дождь пна улице, тоска зеленая. Решил пофантазировать…))))\r\nНе не, извращенцы, я не об этом)))))\r\nЯ о том, как бы мог выглядеть Лансер. И вот я нафантазировал…\r\nЖду комментариев!\r\nСпасибо, что заходите!", likesCount: 8, commentsCount: 1)
    }
}
