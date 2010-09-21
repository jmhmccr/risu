# encoding: utf-8

module NessusDB

	# Templater class for generating a report from a erb template
	#
	# @author Jacob Hammack
	class Templater
		attr_accessor :template, :erb, :findings
		
		# Setups of the Templater class initalizing all of the variables
		#
		# @author Jacob Hammack
		def initialize(template, findings)
			@template = template
			@findings = findings
			@erb = ERB.new File.new(@template).read, nil, "%" #(@template)
		end
		
		# Generates a report based on the erb template
		#
		# @ returns [String] html output of the erb template
		# 
		# @author Jacob Hammack
		def generate
			begin
				html = @erb.result(@findings.get_binding)
								
				return html
			rescue => e
				puts "Error:" << e.message
			end
		end
	end
end