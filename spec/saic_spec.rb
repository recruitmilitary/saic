# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe SAIC do
  describe SAIC::Job do
    describe ".all" do
      it 'should fetch jobs from all pages' do
        SAIC::Job.all.size.should == 51
      end
    end

    describe "instance" do
      before do
        @jobs = SAIC::Job.all
        @job  = @jobs.first
      end

      it 'should extract the title' do
        @job.title.should == "Course Instructor"
      end

      it 'should extract the location' do
        @job.location.should == "Mclean, VA, United States"
      end

      it 'should parse out the city from location' do
        @job.city.should == "Mclean"
      end

      it 'should parse out the state from location' do
        @job.state.should == "VA"
      end

      it 'should parse out the country from location' do
        @job.country.should == "United States"
      end

      it 'should extract the posted date' do
        @job.posted_date.should == Date.new(2010, 3, 11)
      end

      it 'should extract the url' do
        @job.url.should == "https://cp-its-rmprd.saic.com/main/careerportal/Job_Profile.cfm?/0KG1Z60K52WZ7KH4HYJFM2O349TPWXV7HZ71W0S1GMW0NEYCSY2YPZE0EPF7WS2WJEE9UKAJVYBFADU0PIEWWJI8O7KNPHTJV6HVN1MUG57TWJJL9ITSO778SOMOA29UHWDZSMKLTKNPB7MUVG3IOATSR0BYTSR0C6HHAF40"
      end

      it 'should extract the id' do
        @job.id.should == "169193"
      end

      it 'should extract the description' do
        @job.description.should == %Q{SAIC is a FORTUNE 500® scientific, engineering, and technology applications company that uses its deep domain knowledge to solve problems of vital importance to the nation and the world, in national security, energy and the environment, critical infrastructure, and health. For more information, visit www.saic.com. SAIC: From Science to Solutions®\nThe Mission Integration Unit of SAIC is searching for a Course Instructor to support a program onsite in McLean, VA. The opening is contingent right now. An active TS/SCI is required in order to be considered for this position. This is a part-time position that may turn into a full-time one.\nThis position is for Analysis 101, the IC’s foundation course on critical thinking and structured analysis. Instructors teach in teams of two or three, depending on the size of each class.  This course involves lectures, exercises, guest speakers, and one site visit. Analysis 101 is two weeks long and 18 sessions a year are offered.  Content has been developed but the instructors are responsible for modifications and updates.  Instructors are expected to learn all content and be able to supplement the content with individual anecdotes and other professional experiences.  Emphasis in the course is on critical thinking and the analytic process, and not on writing, briefing or specific analytic tools.\nREQUIRED SKILLS:\nBachelor’s Degree in a related field. A minimum of five years IC experience and 8 years of related experience overall is also required. Successful applicants will possess experience working as an IC analyst. Good speaking, organizational, interpersonal, and facilitation skills; strong interest and passion for building the next generation of analysts; excellent working knowledge of the IC. Teaching experience and/or experience facilitating groups and running exercises\nDESIRED SKILLS:\nKnowledge of the IC and individual IC agencies.  Advanced degree desired.   Experience in teaching or practicing critical thinking and structured analysis.  Subject matter expertise in a geographic, current issue, or other IC domain is highly desired.  Familiarity with analytic techniques.}
      end
    end
  end
end
