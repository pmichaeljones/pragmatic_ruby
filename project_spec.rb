require_relative 'project'

describe Project do

  before do
        $stdout = StringIO.new
        @project = Project.new("Gym", 10, 1000)
        @initial = 10
        @goal = 1000
  end

  it "has a name" do
    expect(@project.name).to eq("Gym")
  end

  it "can increase funds" do
    initial = @project.initial
    @project.add_funds(10)
    expect(@project.initial).to eq(20)
  end

  it "can lose funding" do
    initial = @project.initial
    @project.sub_funds(9)
    expect(@project.initial).to eq(1)


  end


end
