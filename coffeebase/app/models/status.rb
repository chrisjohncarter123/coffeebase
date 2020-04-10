
class Status < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  def self.valid_params?(params)
    return !params[:title].empty? && !params[:content].empty?
  end
end