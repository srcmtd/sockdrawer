module SocksHelper
  def nav_link_attributes(*paths)
    active_page = paths.any? { |path| current_page? path }

    if active_page
      { 'class' => 'nav-link active', 'aria-current' => 'page' }
    else
      { 'class' => 'nav-link' }
    end
  end
end
