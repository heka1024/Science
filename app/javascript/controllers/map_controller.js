import { Controller } from "@hotwired/stimulus"

class MapController extends Controller {
  static targets = ["map"]

  connect() {
    this.map = new kakao.maps.Map(this.mapTarget, this.options)
    this.clusterer = new kakao.maps.MarkerClusterer({
      map: this.map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
      averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
      minLevel: 10 // 클러스터 할 최소 지도 레벨
    });
    // this.appendMarker(33.450701, 126.570667)
  }

  loadMarkers() {
    const markers = fetch("/maps.json")
      .then(response => response.json())
      .then(data => data.map(({ latitude, longitude }) => this.buildMarker(latitude, longitude)))
      .then(markers => this.clusterer.addMarkers(markers))

      // .then(data => data.map(x => new kakao.maps.Marker({
      //   position: new kakao.maps.LatLng(x.latitude, x.longitude)
      // })))
      // .then(markers => {
      //   console.log(markers)
      //   return markers
      // })
      // .then(markers => this.clusterer.addMarkers(markers))
  }

  buildMarker(latitude, longitude) {
    return new kakao.maps.Marker({
      position: new kakao.maps.LatLng(latitude, longitude),
    })
  }

  appendMarker(latitude, longitude) {
    if (this.map === undefined) {
      return
    }

    new kakao.maps.Marker({
      position: new kakao.maps.LatLng(latitude, longitude),
      map: this.map
    })
  }

  get options() {
    return {
      center: new kakao.maps.LatLng(33.450701, 126.570667),
      level: 3
    }
  }
}

export default MapController