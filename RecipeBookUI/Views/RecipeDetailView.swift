import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView{
            ScrollView {
                VStack(alignment: .leading) {
                    VStack {
                        Image(recipe.imageName)
                            .resizable()
                            .scaledToFit()
                            .padding(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x:0, y: 4)
                    }
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    .padding()
                    
                    Text(recipe.headline)
                        .font(.title).bold()
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Instructions:")
                                .font(.title3).bold()
                                .padding(.vertical, 5)
                            Text(recipe.instructions)
                                .font(.body)
                                .foregroundColor(.white.opacity(0.7))
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Ingredients:")
                                .font(.title3).bold()
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: -20) {
                                    ForEach(Array(recipe.ingredients.enumerated()), id: \.element) { index, ingredinet in
                                        Text(ingredinet)
                                            .foregroundColor(.white.opacity(0.7))
                                            .padding(10)
                                            .background(.ultraThinMaterial)
                                            .cornerRadius(6)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            .frame(height: 100)
                        }
                    }
                    .frame(width: .infinity, height: 500, alignment: .bottomLeading)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                }
            }
            .background(.ultraThinMaterial)
            .navigationTitle(recipe.title)
            .navigationBarItems(trailing: Image(systemName: "xmark.circle.fill").onTapGesture {
                dismiss()
            })
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe(title: "Grilled Chicken Salad", headline: "Lunch",ingredients: ["Chicken breasts", "Mixed greens", "Cherry tomatoes", "Cucumbers", "Balsamic vinaigrette"],instructions: "Start by grilling the chicken breasts until they are cooked through and have nice grill marks. While the chicken is cooking, prepare the salad by washing and drying the mixed greens, slicing the cherry tomatoes, and chopping the cucumbers. Once the chicken is done, let it rest for a few minutes before slicing it. In a large bowl, toss the greens, tomatoes, and cucumbers together. Place the sliced grilled chicken on top. Drizzle the balsamic vinaigrette over the salad. Toss everything together gently to combine. Your delicious and healthy grilled chicken salad is ready to be enjoyed!",imageName: "chicken"))
            .preferredColorScheme(.dark)
    }
}
