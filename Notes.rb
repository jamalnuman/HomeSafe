# ORM - Objective Relational Model 
# Active Record allows one to communicate with a sequel database without having to use sequel code. Active Record will do the translational to sequel code. 
# -Rails is a gem on Macs and Linux machines
#rails g scaffold Pokemon name element...Pokemon is the model...name and element are the attributes and by default they are both strings...REMEMBER TO USE rake db:migrate
#classes allow you to create attributes and behaviors. Behaviors being methods. 
#use object_id to get the specific id number assigned to any object. such as person1.object_id. 
#to see all the instance variables for a class..use 'instance_variables'...person.instance_variables 
#attr_reader: def method
                  #@name
              #end

# attr_writer: def method_name=(name)
#               @name = name
#              end

# attr_accessor: is both a attr_writer and attr_reader

# 'self' keyword refers to the current object. similar to the "this" in JS

# @@count = 0
# def initialize    def self.how_many     
#   @@count += 1      @@count 
# end               end
# puts Person.how_many...this will return the amount of instances in the Person class

# With inheritance, the child class has access to the parent's methods. 

# Loops: for, while, until 
#  for i in 0..5            i = 7
#   puts i                  until i < 0 do
# end                       puts i 
#                           end
#                           -while has 'do' and 'end'

# Logic can be placed with the brackets #{} and only be used with double quotation marks.

# Using default values     def multiply (number1 = 5, number2 = 6)
#                               number1 * number2
#                           end
#                          -if no numbers are passed, then the default values are used 

# "yield" keywords allow a block of written code to be executed. 

# def method_name
#   puts "im in the method"
#   yield
#   puts "im back in the method"
# end
#   method_name {puts 'printing from the yield!'} => "im in the method", 'printing from the method', 'im back in the method'

# def yield_practice
#   p "in the method"
#   yield("jamal")
#   p 'back in the method'
# end
# yield_practice{ |x| puts "my name is #{x}"} => 'in the method', 'my name is jamal', 'back in the method'

# module: creating a module and allowing classes to use them 
#   module MyEnumerable
#         def example
#           some code
#         end

#         class Home
#           include MyEnumerable
#         end

# Rspec is a gem

# in the file include: 
# require_relative 'person'

# Rspec.describe Person do                    1) Write code to fail
#   it 'has a getter' do                      2) Write code to pass
#     p = Person.new                          3) then refactor the code
#     p.name = Kobe
#     expect(p.name).to eq("Kobe")
#   end
# end

# MVC Architecture

# The request will interact with the router. the router tells the request which controller to hit. the controller, based upon the url and verb, will direct it to a specific action. 

# The model talks to the database via active record. 

# migration files act like version control 

# p = Person.new, p.name = "jamal"...at this point, prior to the .save command...this is an instance of the Person class...to save this in the database...p.save is needed. 

# Person.create(name: "jamal", age: 37), the .create method does new and save together. 

# to prettify the data from the database, use the gem 'hirb'. bundle and then in irb require 'hirb' then Hirb.enable

# Player.find uses the id number by default to find the instance

# Player.find_by can use any other attribute in the model for a search. 

# How to know which migrations have executed: 
#   rake db:migrate.status
#   up have been executed and down have not

# To rollback a migration: 
#   rake db:rollback  

# validations allow user inputs to be correct prior to saving in the database. if not, then error messages regarding the data are sent 

# new validations can be seen executed on existing entries or new entries or both

# To check if data is valid prior to storing in the database use: 
#   p = Person.new
#   p.valid?
#   the response to this will be a boolean and will depend upon on the validations 

# validates :first_name, presence: true, on: :create
#   this is validation code for new entries...pre-existing entries can be updated without this validation being envoked. 

# to create custom validations: 
#   validate :first_name :first_name_starts_with_a_vowel
#                         def first_name_starts_with_a_vowel
#                           vowels = ['a', 'e', 'i', 'o','u']
#                           if !vowels.include?(first_name[0].downcase)
#                             erros.add(:first_name, "must start with a vowel")
#                           end
#                         end

# Association we learned: one to one: has_one and belongs_to 
#                         one to many: has_one and belong_to with the foreign key on the belongs_to
#                         many to many: has to have the 'join' / 'through' table

# in the erb files, html can be written, but Ruby needs skull tags. <% @player.each do |player|
#                                                                   <tr>
#                                                                   <td><%=player.first_name%>
#                                                                   </tr>
#                                                                   <%end%>

# instead of repeating logic in various actions within the controller, the repeated logic can be written in a private method and then called upon..much like helper methods. 
#     private 
#       def player_params
#         params.require(:player).permit(:first_name, :last_name)
#       end
#     end

#     def create
#       player = Player.new(player_params)
#       if player.save
#         redirect_to '/players'
#       else
#         some other message or action
#       end
#     end


# to see all the routes in the terminal, use: rake routes

# side note: REMEMBER the pluarilize method. 

# regex pattern for email: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

