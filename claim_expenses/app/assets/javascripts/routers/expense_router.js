window.Expense = window.Expense || {};

window.Expense.Routers = Backbone.Router.extend({
	
	routes: {
		'' : 'index'
	},
	
	
	initialize: function(){
		this.collection = new window.Expense.Collection;
		this.container = $("#expenses");
		this.collection.reset(this.container.data("expenses"));
	},

	


	index: function(){
		console.log("** Rendering index action ***");
		window.Expense.all = this.container.data('expenses');
		this.container.empty();
		/* PASS INTO VIEW*/
		var expenseView = new window.Expense.ExpenseIndexView({collection: this.collection});
		this.container.html(expenseView.render().el).fadeIn();
	}

});
