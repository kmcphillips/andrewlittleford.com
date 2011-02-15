begin
  ActiveRecord::Base.transaction do

    ## Blocks
    puts "Deleting all Blocks"
    Block.destroy_all
    puts "Creating Blocks"

    {"contact" => "/contact", "bio" => "/bio"}.each_pair do |k, v|
      b = Block.new :body => ""
      b.label = k
      b.path = v
      b.accepts_image = true if k = "contact"
      b.save!
    end


    ## Media
    puts "Deleting all Media"
    Media.destroy_all
    puts "Creating Media"
    
    Media::LABELS.each do |label|
      Media.create! :label => label
    end


    ## Galleries
    puts "Destroyin all Galleries and Images"
    Gallery.destroy_all
    Image.destroy_all
    puts "Creating Singleton Gallery"

    Gallery.create! :name => "Gallery", :path => "", :sort_order => 0

    ## Users
    if Rails.env.development?
      puts "Deleting all Users"
      User.destroy_all
      puts "Creating test/test development User"
      User.create! :username => "test", :password_hash => User.encrypt("test"), :name => "Andrew"
    end

  end 
rescue => e
  puts "Error! Transaction rolled back"
  puts e.message
end
