require 'spec_helper'

RSpec.describe Humanize, "tm locale" do
  before do
    Humanize.configure do |config|
      config.default_locale = :tm
    end
  end

  tests = [
    [8.15, 'sekiz bitin bir bäş'],
    [1002, 'müň iki'],
    [2001, 'iki müň bir'],
    [10_000, 'on müň']
  ]

  tests.each do |num, output|
    it "#{num} equals #{output}" do
      expect(num.humanize).to eql(output)
    end
  end

  context 'decimals: number' do
    it 'returns the decimals as whole numbers' do
      num = 8.15
      expect(num.humanize(decimals_as: :number)).to eq('sekiz bitin on bäş')
    end
  end

  describe 'when called on conceptual number' do
    it 'reads correctly' do
      inf = Float::INFINITY
      neg_inf = -inf
      nan = inf + neg_inf

      expect(inf.humanize).to eql('soňsuz')
      expect(neg_inf.humanize).to eql('minus soňsuz')
      expect(nan.humanize).to eql('näbelli san')
    end
  end
end
