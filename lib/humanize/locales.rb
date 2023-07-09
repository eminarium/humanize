module Humanize
  %w[az de en es fr id ms pt ru th tr tm jp vi].each do |locale|
    autoload locale.capitalize.to_sym, "humanize/locales/#{locale}.rb"
  end
end
