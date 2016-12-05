Gem::Specification.new do |s|
  s.name        = 'monkey-business'
  s.version     = '1.0.3'
  s.date        = '2016-12-05'

  s.authors     = ['Chris Escue']
  s.email       = 'chris@escue.io'

  s.summary     = 'A simple Ruby client for version 3 of the SurveyMonkey API'
  s.description = 'Send requests to the Surveymonkey API from your Ruby scripts!'
  s.homepage    = 'https://github.com/cescue/monkey-business'
  s.license     = 'MIT'

  s.files         = Dir['lib/**/*.rb']
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.3.0'
end
