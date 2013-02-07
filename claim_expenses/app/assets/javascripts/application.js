// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require app
//= require plugins/dropdown
//= require plugins/bootstrap-buttons
//= require plugins/dottimeout

var App = {};

$(function(){
    App = {
        container: "section.container",
        containerEl: $("section.container"),
        addNotice: function(mesg){
          $("<div id='notice'/>").addClass("alert alert-success span10 mt-medium").html(mesg).prependTo(App.container);
          $.doTimeout(3000, function(){ 
                $('#notice').slideUp(); 
                $.doTimeout(2000, function(){ $('#notice').remove() }); 
           });
        }
    }
});

var Form = function(formObj){
     
     this.initialize = function(){
        this.form = formObj;
        this.objName = formObj.data('for');
        this.bindErrors();
        this.savedNotice();
     },
     this.bindErrors = function(){
       var self = this;
       this.form.bind("ajax:error", function(event, response, status, xhr){
            self.clearErrors();
            self.errors = $.parseJSON(response.responseText);
            self.displayErrors();
       });
     },
     this.clearErrors = function(){
        $("span.help-inline").fadeOut().remove(); 
     },
     this.displayErrors = function(){
        var self = this;
         $.each(self.errors, function(field, error){
              $input_field = $("#" + self.objName + "_" + field);
              $formatted_error = $("<span/>").addClass('help-inline').html(error[0]).insertAfter($input_field);;
              $input_field.closest("div.controls").append($formatted_error);
        });
     },
     this.savedNotice = function(){
         this.form.bind("ajax:success", function(event, response, status, xhr){
             App.addNotice(response.notice);
         });
     }
     
     this.initialize();
  
};











/*
===========================================================


   6 Event Callbacks
   
ajax:before – right before ajax call
ajax:loading – before ajax call, but after XmlHttpRequest object is created)
ajax:success – successful ajax call
ajax:failure – failed ajax call
ajax:complete – completion of ajax call (after ajax:success and ajax:failure)
ajax:after – after ajax call is sent (note: not after it returns)

===========================================================

*/

