<h1>Books applicaton, back-end</h1>
<h3>Installation</h3>
<ul>
    <li>$ git clone https://github.com/AlexPurhalo/books-back.git</li>
    <li>$ cd books-back</li>
    <li>$ rbenv shell 2.3.1</li>
    <li>$ bundle install</li>
</ul>

<h3>Usage</h3>
<ul>
    <li>$ bundle exec rake db:migrate</li>
    <li>$ foreman start</li>
</ul>

<h3>Testing</h3>
<ul>
    <li>$ bundle exec rake db:migrate RACK_ENV=test</li>
    <li>$ rspec</li>
</ul>

<h3>Continuous Integration</h3>
<ul>
    <li><a href="https://travis-ci.org/AlexPurhalo/books-back">Travis CI for repository</a></li>
</ul>