import SwiftUI

struct TopProfileView: View {
    var accountBackground: String
    var avatar: String
    var followers: Int
    var autoCount: Int
    
    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: URL(string: accountBackground)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .cornerRadius(20)
            }
            .frame(height: 100)
            .padding(.all)
            
            AvatarView(avatar: avatar)
                .offset(y: 135)
            
			AccountStatisticsView(followers: followers, autoCount: autoCount)
        }
        .frame(height: 350)
    }
}

struct TopProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TopProfileView(accountBackground: "http://am111.05.testing.place/uploads/user/31/auto/31/96361891be0582b6527e4dcd04f346f8_w500.jpg", avatar: "http://am111.05.testing.place/uploads/user/31/avatars/Lcc4gjvRVpJ8RT1A9p77ezRizZjA5FsxxTiwadgH.jpg", followers: 7, autoCount: 2)
    }
}
