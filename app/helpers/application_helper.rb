module ApplicationHelper
    def stylesheet_exists?(stylesheet)
      Rails.application.assets_manifest.assets[stylesheet] || Rails.application.assets.find_asset(stylesheet).present?
    end

    # Method to set active class for the current page
    def nav_link_to(name, path, options = {})
      class_name = current_page?(path) ? 'nav-item selected-item' : 'nav-item'
      link_to name, path, options.merge(class: class_name)
    end
  end  