window.Expense = window.Expense || {};

window.Expense.ExpenseIndexView = Backbone.View.extend({

  tagName: 'ul',
  initialize: function(){
    _.bindAll(this, 'render');  
      //this.template = JST['templates/index'];
  },
  
  render: function(){
       this.collection.each(function(expense){
         var expenseView = new window.Expense.ExpenseView({model: expense});
         this.$el.append(expenseView.render().el);
      }, this);
      return this;
  }
});

