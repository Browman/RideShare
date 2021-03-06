Given /the following locations exist/ do |rides_table|
	
	# p rides_table
	rides_table.hashes.each do |ride|

		Ride.create!(ride)
	end
	
	# Ride.all.each do |ride|
	# 	p ride
	# end
	# p Ride.all
	# p Ride.all
	
end


Then /^(?:|I )should only see the following counties: (.*)$/ do |counties|
	specified_counties = counties.split(', ')
	all_counties = Ride.all_NYcounties
	# p specified_counties
	# p all_counties
	#Ensure only valid counties are listed
	#specified_counties.each { |c| fail unless all_counties.include? c } 
	
	all_counties.each do |c|
		if specified_counties.include? c
			steps %Q{I should see "#{c}"}
		else
			steps %Q{I should not see "#{c}"} 
		end
	end
end

