Category.destroy_all
Dog.destroy_all
User.destroy_all
DogCategory.destroy_all
OrderDog.destroy_all
Order.destroy_all

DOGS = ["Fido", "Bubbles", "Fluffy", "Rover", "Max", "Wolf", "Jim", "Captain", "Cooper", "Rocky", "Bear", "Duke"]
CATEGORIES = ["Sporting Dogs", "Hounds", "Working Dogs", "Terriers", "Toys", "Non-Sporting", "Herding"]
BREED = ["German Shepard", "Labrador", "Beagle", "Golden Retriever", "Poodle", "Pug"]
SIZE = ["Small", "Medium", "Large"]
CAT_FRIENDLY = ["True", "False"]
GENDER = ["Male", "Female"]

CATEGORIES.each do |title|
  Category.create!(title: title)
end
DOGS.each do |name|
  dog = Dog.create!(name: name, breed: BREED.sample, size: SIZE.sample, weight: rand(150), cat_friendly: CAT_FRIENDLY.sample, gender: GENDER.sample, description: "I LOVE HUMANS!", price: rand(200))
  dog.categories << Category.all.sample
  puts "Created #{dog.name}"
end
