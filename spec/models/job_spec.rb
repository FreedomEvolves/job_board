require 'rails_helper'  #spec_helper

RSpec.describe Job do
	valid_attributes = {city: 'Atlanta', 
				title: 'UX developer',
				category: 'fasdfaf',
				jobtype: 'freelance',
				description: 'this job sucks',
				how_to_apply: 'apply now',
				company_name: 'Bilbo Solutions'
				}

	it 'should exist' do
		expect(Job).not_to be_nil
	end

	specify '.new creates an instance of Job' do
		expect(Job.new).to(be_an_instance_of(Job))
	end

	specify '.save persists a job to database' do
		job = Job.new(valid_attributes)

		expect(job).to be_valid
		expect(job.save).to eq(true)
		expect(job).to be_persisted
	end

	describe 'mandatory attributes' do
		job = Job.new
		job.save
		specify 'company_name' do
			expect(job.errors[:company_name]).to include "can't be blank"
		end
		specify 'city' do
			expect(job.errors[:city]).to include "can't be blank"
		end
		specify 'title' do
			expect(job.errors[:title]).to include "can't be blank"
		end
		specify 'category' do
			expect(job.errors[:category]).to include "can't be blank"
		end
		specify 'jobtype' do
			expect(job.errors[:jobtype]).to include "can't be blank"
		end
		specify 'description' do
			expect(job.errors[:description]).to include "can't be blank"
		end
		specify 'how_to_apply' do
			expect(job.errors[:how_to_apply]).to include "can't be blank"
		end
	end

	describe 'Job.descend' do
		it 'returns a list of records in increasing chronological order' do
			Job.create(valid_attributes.merge(city: 'Boston'))
			Job.create(valid_attributes)

			expect(Job.descend.first.city).to eq "Atlanta"
			expect(Job.descend.last.city).to eq "Boston"
		end
	end
end