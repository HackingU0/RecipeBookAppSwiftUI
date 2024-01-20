import SwiftUI

struct RecipeCard: View {
    var recipe: Recipe
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Image(recipe.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 130)
                    .padding(10)
                .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y:4)
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(.ultraThinMaterial)
            .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 7) {
                Text(recipe.headline)
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text(recipe.title)
                    .font(.title3).bold()
                
                Text(recipe.ingredients.joined(separator: ", "))
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 40, alignment: .topLeading)
            }
        }.onAppear()
    }
}

struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCard(recipe: Recipe(title: "Vegetable Stir-Fry", headline: "Dinner",
                                  ingredients: ["Assorted vegetables", "Tofu", "Soy sauce", "Ginger", "Garlic", "Sesame oil"],
                                  instructions: "Start by preparing the vegetables. Wash and chop them into bite-sized pieces. Press the tofu to remove excess moisture and cut it into cubes. In a wok or large skillet, heat some sesame oil over medium-high heat. Add ginger and garlic, sautéing until fragrant. Add the tofu and stir-fry until it's golden and slightly crispy. Add the chopped vegetables and continue to stir-fry until they're tender yet still slightly crisp. Pour in some soy sauce for flavor and toss everything together. Your colorful vegetable stir-fry is now ready to be served. Enjoy it over steamed rice or noodles!",
                                  imageName: "stir_fry"))
        .preferredColorScheme(.dark)
    }
}
