Bundler.require(:default)

guard 'shell' do
  watch(/^[^.].+\.adoc$/) {|files|
    `asciidoctor -r asciidoctor-diagram index.adoc -o public/index.html`
  }
end

guard 'livereload' do
  watch(/^[^.].+\.html$/)
end

