

window.Expense = window.Expense || {};

window.Expense.ExpenseIndexView = Backbone.View.extend({
  initialize: function(){
    _.bindAll(this, 'render', 'save');  
      //this.template = JST['templates/index'];
      this.$el           = $('#expense-main-page');
      this.$expense_form = $('form#new_expense');
  },
  events:{
    "click button" : 'save'
  },
  render: function(){
       $ul = $('<ul/>').addClass('clear expense-list');
       this.collection.each(function(expense){
         var expenseView = new window.Expense.ExpenseView({model: expense});
         $ul.append(expenseView.render().el);
      }, this);
      this.$el.append($ul);
      return this;
  },
  save: function(){
     var self = this, expense, response, expenseView ;
     this.$expense_form.unbind('ajax:success');
     this.$expense_form.bind('ajax:success', function(evt, res, status){
        response  = $.parseJSON(res.expense);
        expense     = new window.Expense.Model(response);
        expenseView = new window.Expense.ExpenseView({model: expense});                  
         $.doTimeout(200, function(){
            self.$el.find('ul.expense-list').prepend(expenseView.render().el);
            $('ul.clear li:first').hide().slideDown();  
            
            App.addNotice(res.notice);
            self.$expense_form[0].reset();     
        });     
     });
     
    

  }
});

