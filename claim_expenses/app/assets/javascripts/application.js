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
//= require plugins/dropdown
//= require plugins/bootstrap-buttons


var Form = function(objName){
     
     this.initialize = function(){
        this.bindErrors();
     },
     this.bindErrors = function(){
       var self = this;
           
       $("form.remote_form").bind("ajax:error", function(event, response, status, xhr){
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
     }
     
     this.objName = objName;
     this.initialize();
  
};


