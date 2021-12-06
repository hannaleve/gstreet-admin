function locationTest() {

    navigator.geolocation.getCurrentPosition(handleLocation, handleError);

}

function handleLocation(position)  {

    var outDiv = document.getElementById("result");

    var posStr = "위도: " + position.coords.latitude + " / ";

    posStr += "경도: " + position.coords.longitude;

    outDiv.innerHTML = posStr;

    var latlng = new google.maps.LatLng(position.coords.latitude,

        position.coords.longitude);

    var mapOption = {

        zoom: 15,

        center: latlng,

        mapTypeControl: false,

        mapTypeId: google.maps.MapTypeId.ROADMAP

    };

    var map = new google.maps.Map(

        document.getElementById("mapCanvas"), mapOption);

    new google.maps.Marker({position : latlng, map : map, title : "here!!"});

}

function handleError(err) {

    var outDiv = document.getElementById("result");

    if(err.code == 1) {
        outDiv.innerHTML = "사용자가 위치정보 공유를 거부함";
    }

    else {
        outDiv.innerHTML = "에러발생 : " + err.code;

    }

}
