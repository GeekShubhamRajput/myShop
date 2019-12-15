class Product < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) } 


  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 },
                    presence: true

  def self.to_csv
    header = ['Name', 'Description', 'Price']
    CSV.generate(options={}) do |csv|
      csv << header
    end
  end

end
