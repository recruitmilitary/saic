$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'saic'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|

end

require 'fakeweb'
FakeWeb.allow_net_connect = false
FakeWeb.register_uri(:get, "https://cp-its-rmprd.saic.com/main/careerportal/Job_List.cfm?/28HV6028GX72HHJCPALDDGY64A3PF1WVIXHJRL8BQZYJHT7RZ2HT2AX5LD30TSXQ1TLI3QEJQRW0VH8ZEGDPRKZVQAIZ18I9IFAKJE8ZWORN", :response => File.read(File.dirname(__FILE__) + "/fixtures/1.html"))
FakeWeb.register_uri(:get, "https://cp-its-rmprd.saic.com/main/careerportal/Job_List.cfm?/3CAN7W3C9NUYFJQDXRLDKL567BUWS8XP4LFGTISXGRXFDFFWR1PYF2Y92UT7UX1N3RXXG7E3XYKWOAS2BJAGU2RZOU0E98CCVGU2JCJ97SS9XFMCZBS116K9UD47ZIXPBMU0ZCQ0ZIXDQTTRUKJ7G1M0Y8VISZSPD0S2Z9ZIOHTNJSVFJU5KRL6XCOUMWWA0RIZZ1PXF2HKVTJJMEUH9KJNCVGBWC9UXG0H0IP31PFSOOFHFZAOA9S", :response => File.read(File.dirname(__FILE__) + "/fixtures/2.html"))
FakeWeb.register_uri(:get, "https://cp-its-rmprd.saic.com/main/careerportal/Job_Profile.cfm?/0KG1Z60K52WZ7KH4HYJFM2O349TPWXV7HZ71W0S1GMW0NEYCSY2YPZE0EPF7WS2WJEE9UKAJVYBFADU0PIEWWJI8O7KNPHTJV6HVN1MUG57TWJJL9ITSO778SOMOA29UHWDZSMKLTKNPB7MUVG3IOATSR0BYTSR0C6HHAF40", :body => File.read(File.dirname(__FILE__) + "/fixtures/details.html"))
