/**
 * Defines all routes required for this application
 */
Ext.ux.MVC.Router.defineRoutes = function(map) {
  /**
   * Sets up REST-like urls for a given model or models:
   * 
   * map.resources('users');
   * 
   * Is equivalent to:
   * map.connect("users",           {controller: 'users', action: 'index'}); // #users
   * map.connect("users/new",       {controller: 'users', action: 'new'  }); // #users/new
   * map.connect("users/:id/edit/", {controller: 'users', action: 'edit' }); // #users/1/edit
   * map.connect("users/:id",       {controller: 'users', action: 'show' }); // #users/1
   * 
   * You can pass more than one model to a map.resources call, e.g.:
   *
   * map.resources('users', 'comments', 'pages', 'products');
   */
  
  //set up default routes
  map.connect(":controller/:action");
  map.connect(":controller/:action/:id");
};