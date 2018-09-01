require 'pstore'
require_relative 'persons.rb'

# array =[]
# h1 = Woman.new
# h2 = Woman.new
# h3 = Woman.new
# h4 = Woman.new
# h5 = Woman.new
hash1 = Hash.new
# hash1['name'] = "sally"
# puts hash1
data_page = PStore.new('pstore.pstore')
data_page.transaction do
  # data_page[:hash1] = hash1
  # puts hash1
  # puts data_page[:hash1]
# end
  hash1 = data_page[:hash]
end
puts hash1
# puts h1["name"]
# data_page = PStore.new('pstore.pstore')
# data_page.transaction


