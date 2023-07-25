import SwiftUI

struct CarScreen: View {
	var thumbnail: String
	var avatar: String
	var username: String
	var email: String
	var followers: Int
	var autoCount: Int
	var mainAuto: String
	var aboutMe: String?
	
    var body: some View {
		VStack {
			TopProfileView(thumbnail: thumbnail, avatar: avatar, followers: followers, autoCount: autoCount)
			
			VStack {
				Text(username)
					.font(.largeTitle)
					.fontWeight(.bold)
					.multilineTextAlignment(.center)
				
				Text(email)
					.font(.callout)
					.fontWeight(.thin)
					.multilineTextAlignment(.center)
					.foregroundColor(Color.gray)
				
				Text(mainAuto)
					.fontWeight(.bold)
					.padding(.bottom)
				
				if let aboutMe {
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
}

struct CarScreen_Previews: PreviewProvider {
    static var previews: some View {
        CarScreen(thumbnail: "http://am111.05.testing.place/uploads/user/31/auto/31/96361891be0582b6527e4dcd04f346f8_w500.jpg", avatar: "http://am111.05.testing.place/uploads/user/31/avatars/Lcc4gjvRVpJ8RT1A9p77ezRizZjA5FsxxTiwadgH.jpg",
				  username: "rishe", email:"rishe@tester.avtomobilka.com", followers: 7, autoCount: 2, mainAuto: "BMW 3 серия", aboutMe: "Привет тебе, читатель! Я Alex Oldman!\nИскренне надеюсь, что у тебя все в порядке.\nПо крайней мере я тебе этого желаю!\nА если интересно, чем занимаюсь я, так вот информация!\n\nБудь здоров, счастлив! Если смогу быть чем-то полезен, добро пожаловать!")
    }
}
