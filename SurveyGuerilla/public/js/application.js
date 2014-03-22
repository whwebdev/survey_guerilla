$(document).ready(function() {



  function QuestionView(){
    this.view = "<li><input type='text' placeholder='Question' name='survey[questions][][question]' /><span><button type='button' id='delete-question'>X</button></span></li>";
    this.renderQuestion = function(){
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


  function FormController(){

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
  $("form").on("click", function(event){
    if (event.target.id == 'new-option'){
      view = new OptionView();
      view.renderOption(event);
    }
    if (event.target.id == 'delete-option'){
      console.log($(event.target).parent().prev())
      $(event.target).parent().parent().remove();
    }

    if (event.target.id == 'delete-question'){
      console.log($(event.target).parent().parent())
      $(event.target).parent().parent().remove();
    }
  })
  // var whatIsIt = function(e) {
  //   console.log(e.target)
  // }

});
