module EventsHelper

  def deg_to_rad(degrees)
    degrees * Math::PI / 180
  end

  def haversine(lat_user, long_user, lat_sat, long_sat)
    radius = 6371000 # radius of Earth in meters
    rad_lat_user = deg_to_rad(lat_user)
    rad_lat_sat = deg_to_rad(lat_sat)
    delta_lat = deg_to_rad(lat_sat - lat_user)
    delta_long = deg_to_rad(long_sat - long_user)

    a = Math.sin(delta_lat/2) * Math.sin(delta_lat/2) +
            Math.cos(rad_lat_user) * Math.cos(rad_lat_sat) *
            Math.sin(delta_long/2) * Math.sin(delta_long/2);
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));

    kilometers = radius * c / 1000;
    miles = kilometers * 0.621371;
  end

  def close_by_sats(date, lat_user, long_user)
    lat_user = lat_user.to_f
    long_user = long_user.to_f
    @sats = Sat.where(date:date)
    @close_sats=[]

    @sats.each do |sat|
      distance = haversine(lat_user, long_user, sat.latitude, sat.longitude)

      if distance < 50
        @close_sats.push([sat, distance])
      end
    end
    @sorted_sats = @close_sats.sort {|a,b| a[1] <=> b[1]}
    @subset = []

    @sorted_sats.each do |sat|
      @subset.push(sat[0])
    end
    @subset
  end
end
