Bundler.require(:default)

guard 'shell' do
  watch(/^[^.].+\.adoc$/) {|files|
    `asciidoctor -r asciidoctor-diagram book.adoc`
  }
end

guard 'livereload' do
  watch(/^[^.].+\.html$/)
end

