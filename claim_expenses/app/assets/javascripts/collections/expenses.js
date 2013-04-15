window.Expense  = window.Expense || {};

window.Expense.Collection = Backbone.Collection.extend({
  url : '/expenses',
  model: window.Expense.Model
});
