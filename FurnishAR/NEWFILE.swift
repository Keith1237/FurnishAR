import SwiftUI

struct NEWFILE: View {
    @ObservedObject private var viewModel = userViewModel()
     
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                VStack(alignment: .leading) {
                    // Load image from URL
                    AsyncImage(url: URL(string: user.imageUrl)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    } placeholder: {
                        // Placeholder while loading
                        ProgressView()
                            .frame(width: 100, height: 100)
                    }
                    
                    Text(user.name).font(.title)
                    Text(user.surname).font(.subheadline)
                }
                .padding()
            }
            .navigationBarTitle("Users")
            .onAppear {
                self.viewModel.fetchData()
            }
        }
    }
}
 
struct NEWFILE_Previews: PreviewProvider {
    static var previews: some View {
        NEWFILE()
    }
}
