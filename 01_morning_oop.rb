def wakeup
  adam = Person.new('adam')
  bronco = Dog.new('bronco')

  adam.get_up

  clothes = Closet.get_pajamas
  adam.put_on(clothes)

  coffee = Coffee.make
  adam.drink(coffee)

  bronco.take_out_for_pee(adam)
  bronco_breakfast = DogFood.prepare(:breakfast)
  bronco.eat(bronco_breakfast)

  adam.use_washroom

  bronco.walk_with(adam, 15.mins)

  primary_series = AshtangaYoga.series(:primary)
  adam.perform(primary_series)

  adam.shower
  breakfast = Meal.prepare(:breakfast)
  adam.eat(breakfast)

  work_location = Work.get_location
  adam.go_to(work_location)
end



class Person
  def initialize(name); end
  def put_on(clothes); end
  def drink(liquid); end
  def eat(food); end
  def use_washroom; end
  def perform(excercise); end
end

class Closet
  def self.get_pajamas; end
  def self.get_dog_walking_clothes; end
  def self.get_work_clothes; end
end

class Coffee
  def self.make; end
end

class Dog
  def initialize(name); end
  def take_out_for_pee(person); end
  def eat(meal); end
end

class DogFood
  def self.prepare(meal_type); end
end

class Meal
  def self.prepare(meal_type); end
end

class AshtangaYoga
  def self.series(type); end
end

class Work
  def self.get_location; end
end
