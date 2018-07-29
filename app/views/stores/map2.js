function init() {

// 緯度経度の指定
  var latlng = new google.maps.LatLng(35.70564,139.751891);

  // マップの表示オプションを指定
  var options = {
  zoom: 15,
  center: latlng,
  mapTypeId: google.maps.MapTypeId.ROADMAP,
  };

  // 指定のタグにマップを表示
  var map = new google.maps.Map(document.getElementById("map"), options);

  // ピンを立てる
  new google.maps.Marker({
    position: latlng,
    map: map
  });
};

google.maps.event.addDomListener(window, 'load', init);
