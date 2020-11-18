require 'rails_helper'

RSpec.describe Sock do
  context "validations" do
    it "requires a unique first/last name combo" do
      Sock.create(first_name: 'Jane', last_name: 'Doe')

      sock = Sock.new(first_name: 'Jane', last_name: 'Doe')
      expect(sock).not_to be_valid

      sock.first_name = 'John'
      expect(sock).to be_valid
    end
  end

  context "#dirty!" do
    it "records date and time as `marked_dirty_at`" do
      sock = Sock.create(first_name: 'Jane', last_name: 'Doe')

      expect(sock.marked_dirty_at).to be_nil

      sock.dirty!
      expect(sock.marked_dirty_at).not_to be_nil
    end
  end

  context "#clean!" do
    it "clears date and time from `marked_dirty_at`" do
      sock = Sock.create(first_name: 'John', last_name: 'Smith')

      sock.dirty!
      expect(sock.marked_dirty_at).not_to be_nil

      sock.clean!
      expect(sock.marked_dirty_at).to be_nil
    end
  end

  context "#dirty?" do
    it "returns true when `marked_dirty_at` is set" do
      sock = Sock.new
      expect(sock).not_to be_dirty

      sock.marked_dirty_at = Time.current
      expect(sock).to be_dirty
    end
  end
end