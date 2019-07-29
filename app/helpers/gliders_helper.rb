module GlidersHelper
  def show_glider_svg(glider)
    File.open("app/assets/glider.svg.erb", 'rb') do |file|
      ERB.new(file.read).result_with_hash(glider: glider).html_safe
    end
  end
end
