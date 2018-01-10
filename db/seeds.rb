Category.destroy_all
Dog.destroy_all
User.destroy_all
DogCategory.destroy_all
OrderDog.destroy_all
Order.destroy_all

DOGS = ["Fido", "Bubbles", "Fluffy", "Rover", "Max", "Wolf", "Jim", "Captain", "Cooper", "Rocky", "Bear", "Duke", "Luna", "Lola", "Lucy", "Molly", "Maggie", "Oliver", "Buddy", "Jack", "Bailey", "Daisy", "Sadie", "Bentley", "Winston", "Buster", "Romeo", "Ziggy", "Lucky", "Missy", "Chloe"]
CATEGORIES = ["Sporting Dogs", "Hounds", "Working Dogs", "Terriers", "Toys", "Non-Sporting", "Herding"]
BREED = ["German Shepard", "Labrador", "Beagle", "Golden Retriever", "Poodle", "Pug"]
SIZE = ["Small", "Medium", "Large"]
CAT_FRIENDLY = ["True", "False"]
GENDER = ["Male", "Female"]
USERNAME = ["user1", "user2", "user3", "user4", "user5", "user6", "user7", "user8", "user9", "user10"]
STATE = ["MN", "PA", "CO", "VA", "CA", "WI", "LA", "AZ", "GA", "FL"]
STATUS = ["Ordered", "Paid", "Canceled", "Completed"]
IMAGES = ["https://images.unsplash.com/photo-1502673530728-f79b4cab31b1?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1455103493930-a116f655b6c5?auto=format&fit=crop&w=1951&q=80",
          "https://images.unsplash.com/photo-1498511897286-4f0782ab697d?auto=format&fit=crop&w=1955&q=80",
          "https://images.unsplash.com/photo-1507146426996-ef05306b995a?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1477868433719-7c5f2731b310?auto=format&fit=crop&w=1953&q=80",
          "https://images.unsplash.com/photo-1447684808650-354ae64db5b8?auto=format&fit=crop&w=1947&q=80",
          "https://images.unsplash.com/photo-1456318456940-4da16c8fc9bc?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1446730853965-62433e868929?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1500063207684-5dac4525ad1c?auto=format&fit=crop&w=1953&q=80",
          "https://images.unsplash.com/photo-1468327704108-d11286640592?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1494870363241-b5225be3dada?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1489861464420-98e73bf2d186?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1452447224378-04c089d77aa4?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1488830006793-1fb328d93241?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1475954704693-ac6850a71ee0?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1478029973231-f42d99fe5c20?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1455380579765-810023662ea2?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1442605527737-ed62b867591f?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1489861464420-98e73bf2d186?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/uploads/1412433710756bfa9ec14/d568362b?auto=format&fit=crop&w=1955&q=80",
          "https://images.unsplash.com/photo-1502673530728-f79b4cab31b1?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1504347766966-539f130679e2?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1501751405784-6c8590d6b897?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1500879747858-bb1845b61beb?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1507144102046-97c4bd60afae?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1478029973231-f42d99fe5c20?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1455103493930-a116f655b6c5?auto=format&fit=crop&w=1951&q=80",
          "https://images.unsplash.com/photo-1447029080250-270ded608d91?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1499789853431-fcbf274f57b9?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1494870363241-b5225be3dada?auto=format&fit=crop&w=1950&q=80",
          "https://images.unsplash.com/photo-1494870363241-b5225be3dada?auto=format&fit=crop&w=1950&q=80"]
#create categories

CATEGORIES.each do |title|
  Category.create!(title: title)
end

#create dogs
count = 0
DOGS.each do |name|
  dog = Dog.create!(name: name, breed: BREED.sample, size: SIZE.sample, weight: rand(10..150), cat_friendly: CAT_FRIENDLY.sample, gender: GENDER.sample, description: "I LOVE HUMANS!", price: rand(50..200), image: IMAGES[count])
  rand(1..2).times do
    dog.categories << Category.all.sample
  end
  count += 1
  puts "Created #{dog.name}"
end

#create admin

User.create!(username: "admin", password: "admin54321", role: 1, name: "admin", address: "admin", city: "admin", state: "CO", zipcode: 12345)
puts "Created admin"
#create users

USERNAME.each do |username|
  User.create!(username: username, password: "user", role: 0, name: username, address: "user", city: "user", state: STATE.sample, zipcode: 12345)
  puts "Created #{username}"
end

User.all.each do |user|
  rand(1..5).times do
    order = user.orders.create!(address: user.address, purchaser: user.name, city: user.city, state: user.state, zipcode: user.zipcode, status: STATUS.sample)
    puts "Created Order #{order.id}"
  end
end

#create order_dogs

Order.all.each do |order|
  rand(1..3).times do
    order_dog = order.order_dogs.create(dog_id: Dog.all.sample.id, quantity: rand(1..3))
    puts "Created OrderDog #{order_dog.id}"
  end
end
