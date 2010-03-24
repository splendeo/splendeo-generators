class SplendeoLayoutGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
    @name = @args.first || 'application'
  end
  
  def manifest
    record do |m|
      m.directory 'app/views/layouts'
      m.directory 'public/stylesheets'
      m.directory 'app/helpers'
      m.directory 'config/initializers'
      m.file 'initializers/formtastic.rb', 'config/initializers/formtastic.rb'
      
      if options[:haml]
        m.file 'sass/formtastic.sass', 'public/stylesheets/sass/formtastic.sass'
        m.file 'sass/formtastic_changes.sass', 'public/stylesheets/sass/formtastic_changes.sass'

        m.directory 'vendor/plugins/haml'
        m.directory 'public/stylesheets/sass'
        m.directory 'public/stylesheets/sass/blueprint'
        m.directory 'public/stylesheets/sass/blueprint/plugins'
        m.directory 'public/stylesheets/sass/blueprint/plugins/buttons'
        m.directory 'public/stylesheets/sass/blueprint/plugins/fancy-type'
        m.directory 'public/stylesheets/sass/blueprint/plugins/link-icons'
        m.directory 'public/stylesheets/sass/blueprint/plugins/rtl'

        m.file 'vendor/plugins/haml/init.rb', 'vendor/plugins/haml/init.rb'
        m.file 'sass/blueprint/ie.sass',     'public/stylesheets/sass/blueprint/ie.sass'
        m.file 'sass/blueprint/print.sass',  'public/stylesheets/sass/blueprint/print.sass'
        m.file 'sass/blueprint/screen.sass', 'public/stylesheets/sass/blueprint/screen.sass'
        m.file 'sass/blueprint/plugins/buttons/screen.sass',    'public/stylesheets/sass/blueprint/plugins/buttons/screen.sass'
        m.file 'sass/blueprint/plugins/fancy-type/screen.sass', 'public/stylesheets/sass/blueprint/plugins/fancy-type/screen.sass'
        m.file 'sass/blueprint/plugins/link-icons/screen.sass', 'public/stylesheets/sass/blueprint/plugins/link-icons/screen.sass'
        m.file 'sass/blueprint/plugins/rtl/screen.sass',        'public/stylesheets/sass/blueprint/plugins/rtl/screen.sass'

        m.template "layout.html.haml", "app/views/layouts/#{file_name}.html.haml"
        m.file     "sass/stylesheet.sass",  "public/stylesheets/sass/#{file_name}.sass"
      else
        m.file 'css/formtastic.css', 'public/stylesheets/formtastic.css'
        m.file 'css/formtastic_changes.css', 'public/stylesheets/formtastic_changes.css'
 
        m.directory 'public/stylesheets/blueprint'
        m.directory 'public/stylesheets/blueprint/plugins'
        m.directory 'public/stylesheets/blueprint/plugins/buttons'
        m.directory 'public/stylesheets/blueprint/plugins/fancy-type'
        m.directory 'public/stylesheets/blueprint/plugins/link-icons'
        m.directory 'public/stylesheets/blueprint/plugins/rtl'

        m.file 'css/blueprint/ie.css',     'public/stylesheets/blueprint/ie.css'
        m.file 'css/blueprint/print.css',  'public/stylesheets/blueprint/print.css'
        m.file 'css/blueprint/screen.css', 'public/stylesheets/blueprint/screen.css'
        m.file 'css/blueprint/plugins/buttons/screen.css',    'public/stylesheets/blueprint/plugins/buttons/screen.css'
        m.file 'css/blueprint/plugins/fancy-type/screen.css', 'public/stylesheets/blueprint/plugins/fancy-type/screen.css'
        m.file 'css/blueprint/plugins/link-icons/screen.css', 'public/stylesheets/blueprint/plugins/link-icons/screen.css'
        m.file 'css/blueprint/plugins/rtl/screen.css',        'public/stylesheets/blueprint/plugins/rtl/screen.css'

        m.template "layout.html.erb", "app/views/layouts/#{file_name}.html.erb"
        m.file     "css/stylesheet.css",  "public/stylesheets/#{file_name}.css"
      end
      m.file "helper.rb", "app/helpers/layout_helper.rb"
    end
  end
  
  def file_name
    @name.underscore
  end

  protected

    def add_options!(opt)
      opt.separator ''
      opt.separator 'Options:'
      opt.on("--haml", "Generate HAML for view, and SASS for stylesheet.") { |v| options[:haml] = v }
    end

    def banner
      <<-EOS
Creates generic layout, stylesheet, and helper files.

USAGE: #{$0} #{spec.name} [layout_name]
EOS
    end
end
