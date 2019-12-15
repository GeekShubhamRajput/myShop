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

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      product_hash = row.to_hash
      product = Product.find_or_create_by!(name: product_hash['Name'], price: product_hash['Price'], description: product_hash['Description'])
    end
  end

end
