class Comment < ActiveRecord::Base
  belongs_to :status

  def self.valid_params?(params)
    return  !params[:content].empty?
  end
end