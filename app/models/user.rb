class User < ActiveRecord::Base

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

#Setup a callback; a method that gets invoked at a particular point in the lifecycle of an Active Record Object
before_save { self.email = email.downcase }

#user.save will fail unless it meets this validation
validates :name, precense: true, length: { maximum: 50 }
validates :email, precense: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uiqueness: { case_sensitive: false }  #rails infers uniqueness: true implictly as well


#When this function is called it invokes the following functionality:
#1. grants the ability to save a securely hashed password_digest attribute(field) 
#2. A pair of virtual attributes (password and password_confirmation) upon object creation
#3. An authenticate method that returns the user when the password is correct

has_secure_password 


end
