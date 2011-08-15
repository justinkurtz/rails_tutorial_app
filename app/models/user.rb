class User < ActiveRecord::Base
  attr_accessible :name, :email
  
  
  email_regex = %r{
     ^ # Start of string

     [0-9a-z] # First character
     [0-9a-z.+_]+ # Middle characters
     [0-9a-z] # Last character

     @ # Separating @ character

     [0-9a-z] # Domain name begin
     [0-9a-z.-_]+ # Domain name middle
     [0-9a-z] # Domain name end

     $ # End of string
   }xi # Case insensitive
   
  validates :name, :presence => true,
                   :length => { :maximum => 50 }
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false}
  
end
