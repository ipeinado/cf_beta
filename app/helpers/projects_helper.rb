module ProjectsHelper

  def get_geojson
    @projects = Project.all
    geoJson = Array.new

    @projects.each do |project|
      geoJson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [project.longitude, project.latitude]
        },
        properties: {
          name: project.title,
          address: project.address,
          city: project.city,
          province: project.province,
          country: project.country,
          description: project.description,
          :'marker-color' => '#03C',
          :'marker-symbol' => 'star',
          :'marker-size' => 'medium'
        }
      }
    end
    return geoJson
  end

end
