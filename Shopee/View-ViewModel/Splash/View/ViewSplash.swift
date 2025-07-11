import SwiftUI

struct ViewSplash: View {
    @State private var movedDown = false
    @EnvironmentObject private var coordintor: RouteCoordinator
    @StateObject private var viewModel = ViewModelSplash(service: SplashAPIService())

    var body: some View {
        
        ZStack {
            BlurRevealImage(imageName: "100splash", animationDuration: 5.0)
                .scaledToFill()
                .ignoresSafeArea()

            Text(movedDown ? "Let's Get Started!" : "100pee Everything you need,\n Just a Tap Away")
                .multilineTextAlignment(.center)
                .font(.subheadline.bold())
                .padding(12)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white.opacity(0.7), lineWidth: 1)
                )
                .frame(maxWidth: 300)
                .onTapGesture {
                    if movedDown {
                        coordintor.navigate(to: .login)
                    }
                }
                .offset(y: movedDown ? 200 : 0)
                .animation(.easeInOut(duration: 1), value: movedDown)
        }
        .onAppear {
            viewModel.fetchImage()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                movedDown = true
            }
        }
    }
}

#Preview {
    ViewSplash()
        .environmentObject(RouteCoordinator())
}
