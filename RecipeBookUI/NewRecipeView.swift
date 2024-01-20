import SwiftUI
import Foundation

struct NewRecipeView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var recipeManager: RecipeManager
    @State var title = ""
    @State var headline = ""
    @State var ingredients = [String]()
    @State var newIngredient = ""
    @State var instructions = ""
    @State var imageName = ""

    // 预定义的图片名称列表
    let imageNames = ["beef", "chicken", "drink", "pizza", "rice", "salad", "salmon", "sechicken", "soup", "stir_fry"]

    var body: some View {
        Form {
            Section(header: Text("New Recipe")) {
                TextField("Title", text: $title)
                TextField("Headline", text: $headline)

                ForEach(ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                }

                HStack {
                    TextField("New Ingredient", text: $newIngredient)
                    Button("Add") {
                        if !newIngredient.isEmpty {
                            ingredients.append(newIngredient)
                            newIngredient = ""
                        }
                    }
                }

                TextField("Instructions", text: $instructions)

                // 添加图片选择器
                Picker("Select Image", selection: $imageName) {
                    ForEach(imageNames, id: \.self) { imageName in
                        Text(imageName).tag(imageName)
                    }
                }
            }

            Button("Add Recipe") {
                let newRecipe = Recipe(title: title, headline: headline, ingredients: ingredients, instructions: instructions, imageName: imageName)
                recipeManager.recipes.append(newRecipe)
                recipeManager.saveToUserDefaults()
                dismiss()
            }
        }
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView().preferredColorScheme(.dark)
    }
}
