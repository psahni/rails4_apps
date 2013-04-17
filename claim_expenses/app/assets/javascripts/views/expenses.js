window.Expense = window.Expense || {};

window.Expense.ExpenseIndexView = Backbone.View.extend({

  initialize: function(){
    _.bindAll(this, 'render', 'test');  
      //this.template = JST['templates/index'];
      this.$el = $('#expense-main-page');
  },
  
  events:{
    "click button" : 'test'
  },
  render: function(){
       $ul = $('<ul/>').addClass('clear');
       this.collection.each(function(expense){
         var expenseView = new window.Expense.ExpenseView({model: expense});
         $ul.append(expenseView.render().el);
      }, this);
      this.$el.append($ul);
      return this;
  },
  
  test: function(){
    alert('submit');
  }
});

