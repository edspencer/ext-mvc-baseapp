require 'find'
require 'script/plugin'

namespace :extmvc do
  
  desc "Concatenates JS files into one called solitaire-all.js"
  task :concatenate do
    files = ["Game.js", "MainWindow.js", "Deck.js", "Dealer.js", "Card.js", "Pack.js", "Stack.js", "SuitStack.js"]
    concatenated_filename = "javascripts/solitaire/solitaire-all.js"
    
    #remove old files, create blank ones again
    File.delete(concatenated_filename) and puts "Deleted old file" if File.exists?(concatenated_filename)
    FileUtils.touch(concatenated_filename)
    
    file = File.open(concatenated_filename, 'w') do |f|
      files.each do |i|
        f.puts(IO.read("javascripts/solitaire/#{i}"))
        f.puts("\n")
      end
    end
  end
  
  desc "Minifies a JS file using YUI Compressor"
  task :minify do
    minified_filename = "javascripts/solitaire/solitaire-min.js"
    FileUtils.rm(minified_filename) if File.exists?(minified_filename)
    
    system("java -jar ../yui-compressor/build/yuicompressor-2.4.jar javascripts/solitaire/solitaire-all.js -o #{minified_filename}")
  end
  
  desc "Prepares site for deployment (concatenates and minifies js code)"
  task :deploy do
    Rake::Task["extmvc:concatenate"].execute
    Rake::Task["extmvc:minify"].execute
  end
  
  namespace :plugin do
    
    desc "Takes 1 argument - the name of a dir inside plugins, or the name of a github repository url"
    task :install do
      dir = ENV['dir']
      Rake::Task["extmvc:plugin:install_assets"].execute
    end
    
    desc "Copies everything from the plugin's public folder into the main public folder"
    task :install_assets do
      ExtMVC::Plugin.new(ENV['git'] || ENV['dir']).install_assets
    end
    
    task :install_script_tags do
    
    end
    
    desc "Takes 1 argument - directory name.  Uninstalls everything from under public and removes include tags on indexdev.html.  Also deletes plugin dir"
    task :uninstall do
      Rake::Task["extmvc:plugin:uninstall_assets"].execute
      Rake::Task["extmvc:plugin:uninstall_script_tags"].execute
      Rake::Task["extmvc:plugin:delete_plugin"].execute
    end
    
    desc "Looks at files within vendor/plugins/PluginName/public, removes any of those files in the site's main public directory"
    task :uninstall_assets do
      ExtMVC::Plugin.new(ENV['git'] || ENV['dir']).uninstall_assets
    end
    
    task :uninstall_script_tags do
      
    end
    
    task :delete_plugin do
      
    end
  end
  
end