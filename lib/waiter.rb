class Waiter
    @@all = []
    attr_accessor :name , :yoe
    def initialize(name ,yoe)
        @name = name
        @yoe = yoe
        @@all << self
    end
    def self.all
        @@all
    end 
    def new_meal(customer,total,tip)
        Meal.new(self , customer , total , tip)
    end
    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end 
    def best_tipper
        htip = meals.max do |a ,b|
            a.tip <=> b.tip
        end
        htip.customer
    end
  

end