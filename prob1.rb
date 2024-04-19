require 'httparty'
require 'json'

def fetch_most_starred_repo(username)
  url = "https://api.github.com/users/#{username}/repos"

  response = HTTParty.get(url)

  # Parse the JSON response
  repos = JSON.parse(response.body)

  most_starred_repo = nil

  repos.each do |repo|
    if most_starred_repo.nil? || repo['stargazers_count'] > most_starred_repo['stargazers_count']
      most_starred_repo = repo
    end
  end

  if most_starred_repo
    puts "Name: #{most_starred_repo['name']}"
    puts "Description: #{most_starred_repo['description']}"
    puts "Stars: #{most_starred_repo['stargazers_count']}"
    puts "URL: #{most_starred_repo['html_url']}"
  else
    puts "No repositories found or the user does not exist."
  end
end

fetch_most_starred_repo('octocat')
