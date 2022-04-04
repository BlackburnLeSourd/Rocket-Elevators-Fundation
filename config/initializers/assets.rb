# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
Rails.application.config.assets.precompile += %w( essentials.css )
Rails.application.config.assets.precompile += %w( layout.css )
Rails.application.config.assets.precompile += %w( header-1.css )
Rails.application.config.assets.precompile += %w( green.css )
Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( pack.css )
Rails.application.config.assets.precompile += %w( pe-icon-7-stroke.css )

Rails.application.config.assets.precompile += %w( jquery-3.3.1.min.js )
Rails.application.config.assets.precompile += %w( scripts.js )

# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w( quote_js.js )
Rails.application.config.assets.precompile += %w( quote_show.js )
Rails.application.config.assets.precompile += %w( index.js )
Rails.application.config.assets.precompile += %w( quote.css )
Rails.application.config.assets.precompile += %w( map.js )
Rails.application.config.assets.precompile += %w( map.css )
# Rails.application.config.assets.precompile += %w( indexslides.js )


