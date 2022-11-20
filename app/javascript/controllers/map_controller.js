import { Controller } from "@hotwired/stimulus"

class MapController extends Controller {
  static targets = ["map"]

  connect() {
    this.map = new kakao.maps.Map(this.mapTarget, this.options)
    this.appendMarker(33.450701, 126.570667)
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