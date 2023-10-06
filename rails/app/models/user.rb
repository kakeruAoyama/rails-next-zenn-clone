# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :confirmable,:recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
