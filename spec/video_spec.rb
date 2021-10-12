RSpec.describe Video do
  it "exist" do
    expect { Video }.to_not raise_error
  end

  it "can be initialized" do
    expect { Video.new("Jurrasic Park", "1 hour and 30 minutes", "Documentary", 5) }.to_not raise_error
  end
  context "readers and writers" do
    before(:all) do
      @video = Video.new('sample', 'sample', 'sample', 0)
    end
    it "can read and write a title" do
      @video.title = "Jurrasic Park"
      expect(@video.title).to eq("Jurrasic Park")
    end
    it "can read and write a duration" do
      @video.duration = "1 hour and 30 minutes"
      expect(@video.duration).to eq("1 hour and 30 minutes")
    end
    it "can read and write a genre" do
      @video.genre = "Documentary"
      expect(@video.genre).to eq("Documentary")
    end
    it "can read and write a rating" do
      @video.rating = 5
      expect(@video.rating).to eq(5)
    end
  end
  context "storing video objects" do
    before(:each) do
      @jurassic_park = Video.new("Jurrasic Park", "1 hour 30 mins", "Documentary", 5)
      @home_alone = Video.new("Home Alone", "1 hour 30 mins", "Documentary", 5)
    end

    after(:each) do
      Video.all.clear
    end

    it ".all returns an array of all of the video objects" do
      Video.all << @jurassic_park
      Video.all << @home_alone

      expect(Video.all).to eq([@jurassic_park, @home_alone])
    end
    it "#save saves an video object in the @@all array" do
      @jurassic_park.save
      @home_alone.save

      expect(Video.all).to eq([@jurassic_park, @home_alone])
    end
    it ".create saves and stores a video in the @@all array" do
      jurassic_park = Video.create("Jurrasic Park", "1 hour 30 mins", "Documentary", 5)
      home_alone = Video.create("Home Alone", "1 hour 30 mins", "Documentary", 5)

      expect(Video.all).to eq([jurassic_park, home_alone])
    end
  end
end