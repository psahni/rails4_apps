var ENTER_KEY = 13;

window.Expense = window.Expense || {};

window.Expense = {
  Collections: {},
  Models: {},
  Views: {},
  Routers:{},
  init:function(){
     new window.Expense.Routers();
     Backbone.history.start({});
  }
}


$(function(){
  Expense.init();
});




