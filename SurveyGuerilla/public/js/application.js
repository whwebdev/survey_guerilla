$(document).ready(function() {

  //Active tab selector
  switch (window.location.pathname) {
    case '/surveys':
      $("#menu ul li:nth-child(3)").addClass('pure-menu-selected');
      break;
    case '/surveys/new':
      $("#menu ul li:nth-child(2)").addClass('pure-menu-selected')
      break;
    case '/users/profile':
      $("#menu ul li:nth-child(1)").addClass('pure-menu-selected')
      break;
  }


  //Results page
  // $.ajax({
  //   type: "POST",
  //   dataType: "JSON",
  //   url: window.location.pathname,
  //   success: function(data) {
  //     console.log(data)
  //   }
  // });
  // $.jqplot('chartdiv', [
  //   [
  //     [1, 2],
  //     [3, 5.12],
  //     [5, 13.1],
  //     [7, 33.6],
  //     [9, 85.9],
  //     [11, 219.9]
  //   ]
  // ]);
  // var data = [
  //   ['Heavy Industry', 12],
  //   ['Retail', 9],
  //   ['Light Industry', 14],
  //   ['Out of home', 16],
  //   ['Commuting', 7],
  //   ['Orientation', 9]
  // ];



  // var plot1 = jQuery.jqplot('chartdiv', [data], {
  //   seriesDefaults: {
  //     // Make this a pie chart.
  //     renderer: jQuery.jqplot.PieRenderer,
  //     rendererOptions: {
  //       // Put data labels on the pie slices.
  //       // By default, labels show the percentage of the slice.
  //       showDataLabels: true
  //     }
  //   },
  //   legend: {
  //     show: true,
  //     location: 'e'
  //   }
  // });


  //Dynamic form generator

  function QuestionView() {
    this.view = "<li><input type='text' placeholder='Question' name='survey[questions][][question]' /><span><button type='button' id='delete-question'>X</button></span></li>";
    this.renderQuestion = function() {
      $("#question_list").append(this.view);
      $("#question_list > li").append("<ul class='options'>");
      $("#question_list > li").append("<li><input name='survey[questions][][options][]' placeholder='Option' type='text'></li>");
      $("#question_list > li").append("<li><input name='survey[questions][][options][]' placeholder='Option' type='text'></li>");
      $("#question_list > li").last().append("<li><button type='button' id='new-option'>Add new option</button></li></ul>");
      // $("#question_list").append("</ul>");
      // $("#question_list").append("</li>");
    }
  }

  function OptionView() {
    this.view = "<li><input placeholder='Option' type='text'></li>"
    this.renderOption = function(event) {
      $(event.target).parent().prev().append("<li><input name='survey[questions][][options][]' placeholder='Option' type='text'><span><button type='button' id='delete-option'>X</button></li>")
    }
  }


  function FormController() {

    this.addQuestion = function() {
      var view = new QuestionView();
      view.renderQuestion();
      // this.delegate();
    }.bind(this)

    this.addOption = function() {
      var view = new OptionView();
      view.renderOption();
    }
    this.sayHello = function() {
      console.log("hello")
    }
    // this.delegate = function(e) {
    //     $(".options").on("click", this.sayHello)
    // }.bind(this)

    this.bindAddQuestionEvent = function() {
      $("#new-question").on("click", this.addQuestion)
    }.bind(this)

  }


  // var newQ = new QuestionView();

  var controller = new FormController();
  controller.bindAddQuestionEvent();
  $("form").on("click", function(event) {
    if (event.target.id == 'new-option') {
      view = new OptionView();
      view.renderOption(event);
    }
    if (event.target.id == 'delete-option') {
      console.log($(event.target).parent().prev())
      $(event.target).parent().parent().remove();
    }

    if (event.target.id == 'delete-question') {
      console.log($(event.target).parent().parent())
      $(event.target).parent().parent().remove();
    }
  })
  // var whatIsIt = function(e) {
  //   console.log(e.target)
  // }


  //background stuff
  $(function() {
    $.vegas({
      src: '/img/background.jpg'
    });
    $.vegas('overlay', {
      src: '/vegas/overlays/8.png'
    });
  });
});
