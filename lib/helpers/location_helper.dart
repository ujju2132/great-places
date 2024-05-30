const API_KEY = 'AIzaSyASPxkohrTzOzu91dIIdt8m_HDwufzS0N0';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double? latitude, double? longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude&$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&key=$API_KEY&signature=YOUR_SIGNATURE';
  }
}
