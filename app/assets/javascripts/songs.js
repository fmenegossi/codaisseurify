$(document).ready(function(){
  $(".delete-song").bind("click", deleteSong)
  $(".delete-all-songs").bind("click", deleteAllSongs)
});

function loadSongs(){
  let artistId = $("#artist-id").val();

  $.ajax({
    type: "GET",
    url: `/api/artists/${artistId}/songs`,
    
  });
}

function deleteSong(song){
  song.preventDefault();

  $.ajax({
    url: "api/song"
  });
}
