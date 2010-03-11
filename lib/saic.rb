require 'open-uri'
require 'mechanize'

module SAIC
  class Job
    BASE_URI = "https://cp-its-rmprd.saic.com/main/careerportal/"
    SEARCH_URI = BASE_URI + "Job_List.cfm?/28HV6028GX72HHJCPALDDGY64A3PF1WVIXHJRL8BQZYJHT7RZ2HT2AX5LD30TSXQ1TLI3QEJQRW0VH8ZEGDPRKZVQAIZ18I9IFAKJE8ZWORN"

    def self.all
      parse(SEARCH_URI)
    end

    def self.parse(uri)
      agent = Mechanize.new
      page = agent.get(SEARCH_URI)

      page_links = page.search(".Rmax_RegularText td a")
      current_page_link = page_links.search(".Rmax_LinkBold").first
      current_page_number = current_page_link.text.to_i
      last_page_link = page_links[-2] # last entry is blank
      last_page_number = last_page_link.text.to_i

      jobs = []

      jobs.push(*parse_jobs(page))
      page_links.pop # remove last item it's just an arrow
      page_links.each_with_index do |page_link, idx|
        next if idx == 0 # skip first page, we're already on it
        page = agent.get(BASE_URI + page_link['href'])
        jobs.push(*parse_jobs(page))
      end

      jobs
    end

    def self.parse_jobs(page)
      jobs = []
      odd_job_rows  = page.search(".Rmax_JobListRow1")
      even_job_rows = page.search(".Rmax_JobListRow0")
      job_rows = odd_job_rows + even_job_rows

      job_rows.each do |job_row|
        tds = job_row.search("td")
        job = SAIC::Job.new
        job.title = strip_whitespace tds[0].text
        job.location = strip_whitespace tds[1].text
        split_location = job.location.split(", ")
        job.city = split_location[0]
        job.state = split_location[1]
        job.country = split_location[2]
        job.posted_date = Date.parse tds[2].text
        job.url = BASE_URI + tds[0].at("a")['href']
        jobs << job
      end
      jobs
    end

    def self.strip_whitespace(text)
      text.strip.gsub(/^[\302\240|\s]*|[\302\240|\s]*$/, '')
    end

    attr_accessor :title, :location, :city, :state, :country, :posted_date, :url

    def id
      doc.at("table.Rmax_RegularText").search("tr")[5].search("td")[1].text
    end

    def description
      SAIC::Job.strip_whitespace doc.at("table.Rmax_RegularText").search("tr")[11].search("td")[1].text
    end

    private
    def doc
      @doc ||= Nokogiri::HTML(open(url))
    end
  end
end
