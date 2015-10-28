Bundler.require(:default)

guard 'shell' do
  watch(/book\/[^.].+\.org$/) {|files|
    `cask exec emacs --batch -l emacs.el -f org-publish-all`
  }
end

guard 'livereload' do
  watch(/public\/[^.].+\.html$/)
end

