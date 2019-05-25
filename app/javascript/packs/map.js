import 'mapbox-gl/dist/mapbox-gl.css';
import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';


const mapElement = document.getElementById('map');

const geolocate = new mapboxgl.GeolocateControl({
  positionOptions: {
      enableHighAccuracy: true
  },
  trackUserLocation: true,
  fitBoundsOptions: {maxZoom:8}
});

if ("geolocation" in navigator) { 
  navigator.geolocation.getCurrentPosition(position => { 
    if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = process.env.MAPBOX_API_KEY;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/akiltour/cjvp6zfpu07yu1cmh7m8wlc1w',
      center: [position.coords.longitude, position.coords.latitude],
      zoom: 8,
    });
  
    new mapboxgl.Marker()
      .setLngLat([position.coords.longitude, position.coords.latitude])
      .addTo(map);

    map.addControl(geolocate);
  }
  })};

