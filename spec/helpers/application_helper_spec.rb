require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe "#notice_message" do
    it "return bootstrap alert-success html" do
      flash[:notice] = "notice message"
      expect(helper.notice_message).to match(/^<div class=\"alert alert-success alert-dismissable\"><button class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×<\/button>notice message<\/div>$/)
    end
    it "return bootstrap alert-danger html" do
      flash[:alert] = "notice message"
      expect(helper.notice_message).to match(/^<div class=\"alert alert-danger alert-dismissable\"><button class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×<\/button>notice message<\/div>$/)
    end
  end

  describe "#link_or_title" do
    it "return a string" do
      expect(helper.link_or_title("title", 15, false, nil)).to match(/^title$/)
    end
    it "return a link_to html" do
      expect(helper.link_or_title("title", 15, true, root_path)).to match(/^<a href=\"\/\">title<\/a>$/)
    end
  end

  describe "#strftime" do
    it "return a string" do
      expect(helper.strftime(Time.now)).to match(/^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2} 星期[0-9]$/)
    end
    it "return a length=0 string" do
      expect(helper.strftime("2015-09-01")).to match(/^$/)
    end
  end

  describe "#currency" do
    it "return a ^$, precision=2 html" do
      expect(helper.currency(123.45, 2)).to match(/^<span class=\"\">\$123.45<\/span>$/)
    end
    it "return a ^$, precision=0 html" do
      expect(helper.currency(123.45, 0)).to match(/^<span class=\"\">\$123<\/span>$/)
    end
    it "return a color red ^$ html" do
      expect(helper.currency(-123.45, 0)).to match(/^<span class=\"red\">-\$123<\/span>$/)
    end
  end

end
