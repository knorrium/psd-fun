require 'psd'
require 'awesome_print'

# Sample file taken from
# http://johnoconnorphoto.blogspot.com/2010/01/free-download-example-psd-file.html

PSD.open('files/John-OConnor_Spring-Reflections_example.psd') do |psd|
    ap psd.tree.to_hash
    psd.tree.children.each do |node|
        if node[:image].height === 0 or node[:image].width === 0
            puts "Skipping layer #{node[:name]}"
        else
            puts "Saving layer #{node[:name]}"
            node.save_as_png "output/#{node[:name]}.png"
        end
    end
end
