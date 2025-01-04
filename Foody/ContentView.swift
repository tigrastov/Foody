

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("Снимок экрана 2025-01-03 в 20.31.54")
                //.imageScale(.large)
                //.foregroundStyle(.tint)
           
        }
        .padding()
        .overlay {
            Text("Foodikal")
                .font(.system(size: 60)).foregroundStyle(.white)
        }
    }
}

#Preview {
    ContentView()
}
