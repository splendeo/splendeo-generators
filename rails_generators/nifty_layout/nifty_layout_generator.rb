class NiftyLayoutGenerator < Rails::Generator::Base
  def initialize(runtime_args, runtime_options = {})
    super
    @name = @args.first || 'application'
  end
  
  def manifest
    record do |m|
      m.directory 'app/views/layouts'
      m.directory 'public/stylesheets'
      m.directory 'app/helpers'
      
      if options[:haml]
        m.directory 'public/stylesheets/sass'
        m.directory 'public/stylesheets/sass/blueprint-sass'
        m.directory 'public/stylesheets/sass/blueprint-sass/plugins'
        m.directory 'public/stylesheets/sass/blueprint-sass/plugins/buttons'
        m.directory 'public/stylesheets/sass/blueprint-sass/plugins/fancy-type'
        m.directory 'public/stylesheets/sass/blueprint-sass/plugins/link-icons'
        m.directory 'public/stylesheets/sass/blueprint-sass/plugins/rtl'

        m.file 'blueprint-sass/ie.sass',     'public/stylesheets/sass/blueprint-sass/ie.sass'
        m.file 'blueprint-sass/print.sass',  'public/stylesheets/sass/blueprint-sass/print.sass'
        m.file 'blueprint-sass/screen.sass', 'public/stylesheets/sass/blueprint-sass/screen.sass'
        m.file 'blueprint-sass/plugins/buttons/screen.sass',    'public/stylesheets/sass/blueprint-sass/plugins/buttons/screen.sass'
        m.file 'blueprint-sass/plugins/fancy-type/screen.sass', 'public/stylesheets/sass/blueprint-sass/plugins/fancy-type/screen.sass'
        m.file 'blueprint-sass/plugins/link-icons/screen.sass', 'public/stylesheets/sass/blueprint-sass/plugins/link-icons/screen.sass'
        m.file 'blueprint-sass/plugins/rtl/screen.sass',        'public/stylesheets/sass/blueprint-sass/plugins/rtl/screen.sass'

        m.template "layout.html.haml", "app/views/layouts/#{file_name}.html.haml"
        m.file     "stylesheet.sass",  "public/stylesheets/sass/#{file_name}.sass"
      else
        m.directory 'public/stylesheets/blueprint'
        m.directory 'public/stylesheets/blueprint/plugins'
        m.directory 'public/stylesheets/blueprint/plugins/buttons'
        m.directory 'public/stylesheets/blueprint/plugins/fancy-type'
        m.directory 'public/stylesheets/blueprint/plugins/link-icons'
        m.directory 'public/stylesheets/blueprint/plugins/rtl'

        m.file 'blueprint/ie.css',     'public/stylesheets/blueprint/ie.css'
        m.file 'blueprint/print.css',  'public/stylesheets/blueprint/print.css'
        m.file 'blueprint/screen.css', 'public/stylesheets/blueprint/screen.css'
        m.file 'blueprint/plugins/buttons/screen.css',    'public/stylesheets/blueprint/plugins/buttons/screen.css'
        m.file 'blueprint/plugins/fancy-type/screen.css', 'public/stylesheets/blueprint/plugins/fancy-type/screen.css'
        m.file 'blueprint/plugins/link-icons/screen.css', 'public/stylesheets/blueprint/plugins/link-icons/screen.css'
        m.file 'blueprint/plugins/rtl/screen.css',        'public/stylesheets/blueprint/plugins/rtl/screen.css'

        m.template "layout.html.erb", "app/views/layouts/#{file_name}.html.erb"
        m.file     "stylesheet.css",  "public/stylesheets/#{file_name}.css"
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
