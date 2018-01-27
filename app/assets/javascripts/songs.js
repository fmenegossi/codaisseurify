$(document).ready(function(){
  loadSongs();
  $("#delete-all-songs").bind("click", deleteAllSongs);
  $("#add-song-form").bind("submit", addSong);
});

function loadSongs(){
  let artistId = $("#artist-id").val();

  if(!artistId){
    return false;
  }

  $.ajax({
    type: "GET",
    contentType: "application/json",
    dataType: "json",
    url: `/api/artists/${artistId}/songs`,
  })
  .done(function(songs){
    console.log(songs);

    let parentDiv = $("#artist-songs");
    parentDiv.html("");

    $.each(songs, function(index, value){
      let divRow = $('<div class="row artist-item"></div>');

      let divTitle = $('<div class="col-md-8"></div>')
        .html(value.title);

      let divAction = $('<div class="col-md-4 text-right"></div>');

      let deleteButton = $('<button href="#" class="action-icon"></button>')
        .attr('value', value.id)
        .attr('id', `song-${value.id}`)
        .bind("click", deleteSong)
        .html('<i class="fa fa-trash-o action-icon" alt="Delete"></i>');

      divAction.append(deleteButton);
      divRow.append(divTitle);
      divRow.append(divAction)
      parentDiv.append(divRow);
    })
  });
}

function deleteSong(){
  event.preventDefault();

  let artistId = $("#artist-id").val();
  let songId = $(this).val();

  // if(!confirm("Do you really want to delete this song?")){
  //   return false;
  // }

  $.ajax({
    type: "DELETE",
    contentType: "application/json",
    dataType: "json",
    url: `/api/artists/${artistId}/songs/${songId}`
  })
  .done(function(){
    loadSongs();
  });

}

function deleteAllSongs(){
  // if(!confirm("DESTROY ALL THESE BEAUTIFUL SONGS?")){
  //   return false;
  // }

  let artistId = $("#artist-id").val();

  $.ajax({
    type: "DELETE",
    contentType: "application/json",
    dataType: "json",
    url: `/api/artist/${artistId}/songs`
  }).done(function(){
    loadSongs();
  });
}

function addSong(){
  event.preventDefault();

  let title = $("#song-title").val();
  let song = { title: title };
  let artistId = $("#artist-id").val();

  $.ajax({
    type: "POST",
    contentType: "application/json",
    dataType: "json",
    url: `/api/artists/${artistId}/songs`,
    data: JSON.stringify(
      {
        song: song
      }
    )
  }).done(function(){
    $("#song-title").val(null);
    loadSongs();
  });
}
