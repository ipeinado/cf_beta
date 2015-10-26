require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @project = projects(:project1)
  end

  test "project should have a title" do
    @project.title = ""
    assert_not @project.valid?, message: "project should have a titles"
  end

  test "projects that are not geolocated should not be saved" do
    project2 = Project.new(title: "Project with no city", city: "tyuri", province: "alsir")
    assert_no_difference 'Project.count' do
      project2.save
    end
  end

end
