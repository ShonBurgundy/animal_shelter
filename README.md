# README

# _Animal Shelter Custom API_


#### By _**Sean VanLeeuwen**_

## Description

_A custom built api which will provide users with full CRUD functionality for animals. Displays the understanding of building custom api with custom end points_

## Specs

| Behavior      | Input        | Output  |
| ------------- |:-------------:| -----:|
|  Program will allow user to add animals & name | *add* Giraffe/Greg | Giraffe/Greg |
|  Program will allow user to update animals & name | *update* Dog/Not Greg | Dog/ Not Greg |
|  Program will allow user to delete animals | *delete* Giraffe | *DELETED* |
|  Program will allow user to search animals by species | *search* Dog | Dog: Batman, Dog: Superman |


## Setup/Installation Requirements

1. In the terminal, type 'git clone https://github.com/ShonBurgundy/animal_shelter'.
1. Install Ruby, instructions can be found here 'https://www.ruby-lang.org/en/documentation/installation/'
1. Enter the directory, with cd 'animal_shelter' 
1. Open the downloaded directory in a text editor of your choice.
  (VSCode, Atom, etc.) 
1. Run "bundle' in terminal to install gems
1. In terminal run  "rake db:create" , "rake db:migrate", "rake db:test:prepare", "rake db:seed", "rails s" to prepare your database and start the server.
1. Input localhost:3000 into browser to see live site
1. _PostMan Required_ Once the server loads open Postmate and in the address bar type 'http://localhost:' followed by the port your terminal generated with rails s.

## Endpoints

* In PostMan - GET request http://localhost:YOURPORTNUMBER/animals/ will return list of all animals
* If you would like to scope further. GET request http://localhost:YOURPORTNUMBER/animals/:id (:id should be specific id #)
* To search by Species. GET request http://localhost:YOURPORTNUMBER/animals/ In Key type species, In Value type Species you are searching for.
* To Add an Animal. POST request http://localhost:YOURPORTNUMBER/animals/ In Key type animal species, In Value type animal name.
* _FOR UPDATING AND DELETING INPUTTED ID MUST ALREADY EXIST OR THEY WILL FAIL!_
* To Update an Animal. PUT request http://localhost:YOURPORTNUMBER/animals/:id  (:id) should be replaced by existing animal id you would like to update. In Key type UPDATED animal species. In Value type UPDATED animal name.
* To Delete an Animal. DELETE request http://localhost:YOURPORTNUMBER/animals/:id  (:id) should be replaced by existing animal id you would like to delete.
* {
        "id": ,
        "species": ,
        "name": ,
        "created_at": ,
        "updated_at": 
    }

## Known Bugs

No Front End

## Support and contact details

_Sean VanLeeuwen's email:_
__seanbeloussow@yahoo.com

## Technologies Used

* _Ruby_
* _Rails_
* _Bootstrap_
* _Markdown_
* _Git_
* _PSQL_

### Gems Used

* _Launchy_
* _Faker_
* _Rspec_
* _Pry_
* _Shoulda-Matchers_
* _Jquery-Rails_
* _Capybara_
* _FactoryBot_
* _Rack-Throttle_

### License

**The MIT license**

Copyright (c) 2020 Sean VanLeeuwen
