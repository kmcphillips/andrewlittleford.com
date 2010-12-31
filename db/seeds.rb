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
    puts "Creating Galleries"

    Gallery.create! :name => "Publicity", :path => "publicity", :image => "gallery1.png", :sort_order => 0
    Gallery.create! :name => "Projects", :path => "projects", :image => "gallery3.png", :sort_order => 1
    Gallery.create! :name => "Performances", :path => "performances", :image => "gallery2.png", :sort_order => 2


    ## Users
    if Rails.env.development?
      puts "Deleting all Users"
      User.destroy_all
      puts "Creating test/test development User"
      User.create! :username => "test", :password_hash => User.encrypt("test")
    end

  end 
rescue => e
  puts "Error! Transaction rolled back"
  puts e.message
end
