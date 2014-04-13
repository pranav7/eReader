require "mechanize"
require "nokogiri"

url = ARGV[0]
fp = File.new("wikilinks.txt", "w")

agent = Mechanize.new { |agent| agent.user_agent_alias = "Mac Safari" }

html = agent.get(url).body

html_doc = Nokogiri::HTML(html)

list_heading = html_doc.xpath("//h1")
list_heading.each { |i| fp.write(i.text + "\n\n\n") }

list = html_doc.xpath("//div//p")
list.each { |i| fp.write(i.text + "\n") }