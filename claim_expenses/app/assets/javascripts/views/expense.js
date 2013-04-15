window.Expense  = window.Expense || {};


window.Expense.ExpenseView = Backbone.View.extend({
  
  tagName: 'li',
  initialize: function(){
    _.bindAll('render');
    this.template = JST['templates/expense'];
  },
  render: function(){
   console.log('this is expense view');
   this.$el.html(this.template(this.model.toJSON() ));
   return this;
  }
  
});
