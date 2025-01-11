
import SwiftUI
struct LaunchView: View {
    @Binding var isLoading: Bool
    @State private var rotation: Double = 0

    var body: some View {
        ZStack {
            
            Color(.white).ignoresSafeArea()  // Фон экрана загрузки
            
            Image("Logotip")
                .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
                
                .onAppear {
                    // Анимация: вращение бесконечно
                    withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                        rotation = 360
                    }

                    // Переход к основному экрану через 3 секунды
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.95) {
                        withAnimation {
                            isLoading = false
                        }
                    }
                }
        }
    }
}
