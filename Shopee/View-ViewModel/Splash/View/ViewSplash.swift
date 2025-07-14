import SwiftUI

struct ViewSplash: View {
    @State private var movedDown = false
    @EnvironmentObject private var coordintor: RouteCoordinator
    @StateObject private var viewModel = ViewModelSplash(service: SplashAPIService())

    var body: some View {
        
        ZStack {
            if viewModel.moveToNextScreen {
                VStack {
                   if let url = URL(string: viewModel.getImage()) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .ignoresSafeArea()
                                default:
                                    EmptyView()
                            }
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        coordintor.navigate(to: .startScreen)
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchImage()
            
        }
    }
}

#Preview {
    ViewSplash()
        .environmentObject(RouteCoordinator())
}
