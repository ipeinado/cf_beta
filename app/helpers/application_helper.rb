module ApplicationHelper
  def get_geojson(projects)
    geoJson = Array.new

    projects.each do |project|
      geoJson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [project.longitude, project.latitude]
        },
        properties: {
          name: project.title,
          project_id: project.id,
          address: project.address,
          city: project.city,
          province: project.province,
          country: project.country,
          description: project.description,
          logo: project.logo? ? project.logo.thumb.url : "",
          website: project.website? ? project.website : "",
          twitter: project.twitter? ? project.twitter : "",
          featured_picture: project.featured_picture? ? project.featured_picture.thumb.url : "",
          :'marker-color' => '#03C',
          :'marker-symbol' => 'star',
          :'marker-size' => 'medium'
        }
      }
    end
    return geoJson
  end
end
