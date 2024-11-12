import SwiftUI


struct FaceView: View {
    var body: some View {
        ZStack() {
          HStack(spacing: 0) {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 135, height: 5)
              .background(Color(red: 0.07, green: 0.07, blue: 0.07))
              .cornerRadius(100)
          }
          .padding(EdgeInsets(top: 21, leading: 120, bottom: 8, trailing: 120))
          .frame(width: 375, height: 34)
          .offset(x: 0, y: 389)
          ZStack() {
            HStack(spacing: 0) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 64, height: 64)
                .background(
                  AsyncImage(url: URL(string: "https://via.placeholder.com/64x64"))
                )
            }
            .frame(width: 64, height: 64)
            Text("Face ID")
              .font(Font.custom("SF Pro Text", size: 17).weight(.semibold))
              .lineSpacing(22)
              .foregroundColor(.black)
            Text("Try Again")
              .font(Font.custom("SF Pro Text", size: 13))
              .lineSpacing(18)
              .foregroundColor(.black)
            VStack(spacing: 11) {
              Text("Try Face ID Again")
                .font(Font.custom("SF Pro Text", size: 17).weight(.semibold))
                .lineSpacing(22)
                .foregroundColor(Color(red: 0, green: 0.48, blue: 1))
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            .frame(height: 44)
            VStack(spacing: 11) {
              Text("Cancel")
                .font(Font.custom("SF Pro Text", size: 17))
                .lineSpacing(22)
                .foregroundColor(Color(red: 0, green: 0.48, blue: 1))
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            .frame(height: 44)
          }
          .frame(width: 270, height: 260)
          .overlay(
            Rectangle()
              .inset(by: 0.50)
              .stroke(Color(red: 0, green: 0.48, blue: 1), lineWidth: 0.50)
          )
          .offset(x: -0.50, y: 0)
          HStack(spacing: 113.50) {
            HStack(spacing: 0) {
              Text("19:27")
                .font(Font.custom("SF Pro Display", size: 15).weight(.medium))
                .foregroundColor(Color(red: 0.19, green: 0.19, blue: 0.19))
            }
            .padding(
              EdgeInsets(top: 2, leading: 29.50, bottom: 2, trailing: 113.50)
            )
            .frame(height: 22)
            HStack(alignment: .top, spacing: 5) {
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 17.10, height: 10.70)
                .background(
                  AsyncImage(url: URL(string: "https://via.placeholder.com/17x11"))
                )
              Rectangle()
                .foregroundColor(.clear)
                .frame(width: 15.40, height: 11.06)
                .background(
                  AsyncImage(url: URL(string: "https://via.placeholder.com/15x11"))
                )
              ZStack() {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 24.50, height: 11.50)
                  .background(
                    AsyncImage(url: URL(string: "https://via.placeholder.com/24x11"))
                  )
                  .offset(x: 0, y: 0)
                  .opacity(0.40)
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 18, height: 7.67)
                  .background(Color(red: 0.19, green: 0.19, blue: 0.19))
                  .cornerRadius(1.60)
                  .offset(x: -1.25, y: 0)
              }
              .frame(width: 24.50, height: 11.50)
            }
            .padding(EdgeInsets(top: 0.56, leading: 0, bottom: 0.94, trailing: 1))
            .frame(width: 68, height: 13)
          }
          .padding(EdgeInsets(top: 12, leading: 0, bottom: 10, trailing: 13.50))
          .frame(width: 375, height: 44)
          .offset(x: 0, y: -384)
        }
        .frame(width: 375, height: 812)
        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
        .cornerRadius(30)
    }
}

struct FaceView_Previews: PreviewProvider {
    static var previews: some View {
        FaceView()
    }
}
