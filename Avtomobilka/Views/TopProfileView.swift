import SwiftUI

struct TopProfileView: View {
    var thumbnail: String
    var avatar: String
    var followers: Int
    var autoCount: Int
    
    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: URL(string: thumbnail)) { image in
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
        .frame(height: 350)
    }
}

struct TopProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TopProfileView(thumbnail: "http://am111.05.testing.place/uploads/user/31/auto/31/96361891be0582b6527e4dcd04f346f8_w500.jpg", avatar: "http://am111.05.testing.place/uploads/user/31/avatars/Lcc4gjvRVpJ8RT1A9p77ezRizZjA5FsxxTiwadgH.jpg", followers: 7, autoCount: 2)
    }
}

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
