$(function() {
  $(".question_list").on("click",".add_response", function(event) {
    event.preventDefault();
    $(this).before("<li>Answer: <input type='text' name='survey[questions][][options][]'> <img src='/img/Military-Grenade-icon.png' class='delete_option'></li>");
  });

  var questionTemplate = "<li>Question: <input type='text' name='survey[questions][][question]'> <img src='/img/Military-Grenade-icon.png' class='delete_question'><ul><li>Answer: <input type='text' name='survey[questions][][options][]'> <img src='/img/Military-Grenade-icon.png' class='delete_option'></li><li>Answer: <input type='text' name='survey[questions][][options][]'> <img src='/img/Military-Grenade-icon.png' class='delete_option'></li><button class='add_response' type='button'>Add response</button></ul></li>";

  $(".add_question").on("click", function(event) {
    $(".question_list").append(questionTemplate);
  });

  $(".question_list").on("click", ".delete_option", function(event) {
    $(this).attr("src", "/img/boom.png");
    var explode = function(){$(this).parent().remove();}.bind(this);
    setTimeout(explode, 500);
  });

  $(".question_list").on("click", ".delete_question", function(event) {
    $(this).attr("src", "/img/boom.png");
    var explode = function(){$(this).parent().remove();}.bind(this);
    setTimeout(explode, 500);
  });

  $("form").on("submit", function(event) {
    $('body').css('background-color', 'black').fadeTo(500);
    $(".vegas-background").removeAttr("src").fadeTo(500);
    $("#main").hide();
    $("#fist").animate({width: '120%'}, 5000);
    $("#fist").fadeIn(2000);
    setTimeout(function(){return true;}, 1500);
  })

});
