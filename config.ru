require 'rack/rewrite'

use Rack::Rewrite do
  r301 %r{/(\d+)/(\d+)/(\d+)/(.*)}, lambda { |match, rack_env|
    year      = match[1]
    month     = match[2].rjust(2, '0')
    day       = match[3].rjust(2, '0')
    permalink = match[4]

    "http://edgecase.github.com/#{year}/#{month}/#{day}/#{permalink}.html"
  }

  r301 /.*/, 'http://edgecase.github.com/blog.html'
end

