# requirejs makes life a lot easier when dealing with more than one
# javascript file and any sort of dependencies, and loads faster.

# for more info on require config, see http://requirejs.org/docs/api.html#config
require.config
  paths:
    jquery: '//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.0/jquery.min'
    base64: '//cdnjs.cloudflare.com/ajax/libs/Base64/0.2.0/base64'
    underscore: '//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min'
    github: 'libs/github/github'

require ['jquery', 'underscore', 'base64', 'github'], ($) ->
  $ ->
    
    # ------------------------------------------
    # github setup
    # ------------------------------------------
    gh = new Github({
      token: "2ffa0e49126c090f237fd227d4f4cb61d96bcf49",
      auth: "oauth"
    }).getUser()
    
    # ------------------------------------------
    # populate user information
    # ------------------------------------------
    
    user = gh.show "nporteschaikin", (error, user) ->
      $('#gh-username').html "<a href='http://www.github.com/" + user.login + "'>" + user.login + "</a>"
    
    # ------------------------------------------
    # populate repositories list
    # ------------------------------------------
    
    repositories = gh.repos (error, repositories) ->
      
      elems = for number, repository of repositories
        
        break if number is "5"
        
        "<article>" +
          "<span class='name'>" + repository.name + "</span>" +
          "<span class='description'>" + repository.description + "</span>" +
          "<span class='language'>" + repository.language + "</span>" +
        "</article>"
      
      $('#gh-repositories').html elems
      
    
    # ------------------------------------------
    # get latest tracks listened to
    # ------------------------------------------
    
    $.getJSON "http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&limit=1&user=noahWAYkid&api_key=cf1cf34466c46abc49e0965c073b0ef2&format=json", (tracks) ->
      
      elems = for number, track of tracks
        console.log track
        "<article>" +
          "<span class='title'>" + repository.name + "</span>" +
          "<span class='artist'>" + repository.artist.text + "</span>"
        "</article>"
        
      $('#spotify-tracks').html elems