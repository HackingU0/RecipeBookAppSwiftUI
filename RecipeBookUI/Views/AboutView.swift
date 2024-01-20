import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("About RecipeBook")
                .font(.title)
                .padding()

            Text("Made by Lakeview Academy Blue Lions")
                .font(.headline)

            Spacer().frame(height: 20)

            Text("This is a demo version of the RecipeBook app, showcasing our skills in app development and design,and how technology can make people interested in something and how it can facilitate people's lives.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
        }
        .padding()
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
