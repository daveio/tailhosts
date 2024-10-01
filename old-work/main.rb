require 'erb'
require 'csv'
require 'pp'

CSV.open('data.csv') do |csv|
  tmpl = File.open("tmpl.erb").read
  csv.each do |row|
    @shortname = row[0].gsub('dave-', '')
    @dnsname = row[6]
    @addrv4, @addrv6 = row[12].split(',')
    t = ERB.new(tmpl)
    t.run(binding)
  end
end
