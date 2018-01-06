<p align="center">
  <img src="https://image.ibb.co/jhTWew/dog_logo.jpg" alt="Adop Shop logo"/>
</p>



# Adop Shop

[![forthebadge](http://forthebadge.com/images/badges/made-with-ruby.svg)](http://forthebadge.com)
[![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com)

A platfrom to allow users to adopt dogs from around the world. The scope of this project was based on [Little Shop](https://www.google.com) and fufils [these](https://www.google.com) user stories.



## Getting Started


These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Ensure you have rails installed, if not:

```
gem install rails 
```

### Installing

To get up and running in your browser clone this repo 

Install the dependenices

```
bundle install 
```

Create the database

```
rails db:create
```

Run the migrations

```
rails db:migrate
```

Start the server

```
rails server
```

Visit localhost:3000 in your browser to start exploring our pets

## Running the tests

Install the dependencies

```
bundle install
```

Run rspec

```
rspec
```


### Test Example

Each test ensures working functionality for a particular user story. 

```
describe "a visitor visits dog index page" do
  it "a user can see all dogs" do
    category = create(:category)
    dog1 = create(:dog, category_id: category.id)
    dog2 = create(:dog, category_id: category.id)

    visit dogs_path

    expect(page).to have_content("#{dog1.name}")
    expect(page).to have_content("#{dog1.breed}")
    expect(page).to have_content("#{dog1.price}")
    expect(page).to have_content("#{dog2.name}")
    expect(page).to have_content("#{dog2.breed}")
    expect(page).to have_content("#{dog2.price}")
  end
end
```

## Deployment

Login to your heroku account

```
heroku login
```

Commit to git

```
git init
git add .
git commit -m "init"
```

Create your heroku app

```
heroku create
```

Deploy your code

```
git push heroku master
```


## Built With

* [Rails](https://github.com/rails/rails) 
* [Bootstrap](https://github.com/twbs/bootstrap-rubygem) 


## Versioning

Version 1.0

## Authors

* **Tyler Marshall** [contact](https://github.com/tylermarshal)
* **Nico Lewis** [contact](https://github.com/nico24687)
* **Young Jung** [contact](https://github.com/seoulstice)



## License

This project is licensed under the MIT License 

