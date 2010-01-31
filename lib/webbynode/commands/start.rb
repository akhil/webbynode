module Webbynode::Commands
  class Start < Webbynode::Command
    
    add_alias "boot"
    
    requires_initialization!
        
    def execute
      api.webbies.each do |webby|
        if webby[1][:ip].eql?(git.parse_remote_ip)
          unless webby[1][:status].eql?("Active")
            puts "#{webby[0]} is starting up!"
            api.post("/webby/#{webby[1][:name]}/start")
          else
            puts "#{webby[0]} is already started up."
          end
        end
      end
    end
  end
end