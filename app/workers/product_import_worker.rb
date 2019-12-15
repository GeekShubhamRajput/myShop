require 'open-uri'

class ProductImportWorker
  include Sidekiq::Worker

  def perform(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      product_hash = row.to_hash
      product = Product.find_or_create_by!(name: product_hash['Name'], price: product_hash['Price'], description: product_hash['Description'])
    end  
  end

end
