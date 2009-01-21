var MyApp = {};

/**
 * @class MyApp.OS
 * @extends Ext.ux.MVC.OS
 */
MyApp.OS = Ext.extend(Ext.ux.MVC.OS, {
  name:            "MyApp",
  usesHistory:     true,
  viewportBuilder: "leftmenu",
  
  getViewportBuilderConfig: function() {
    return {
      menu: {
        items: [
          this.router.linkTo({controller: 'posts', action: 'index'}),
          this.router.linkTo({controller: 'posts', action: 'new'  }),
          
          this.router.linkTo({controller: 'users', action: 'index'}),
          this.router.linkTo({controller: 'users', action: 'new'  })
        ]
      },
      useTabs: false,
      main: {
        items:  [
          {
            title: 'Welcome',
            html:  '<p>Welcome to the MyApp application</p>'
          }
        ]
      }
    };
  }
});

MyApp.OS = new MyApp.OS();