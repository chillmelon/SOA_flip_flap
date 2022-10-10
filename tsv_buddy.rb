# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format

  attr_accessor :data

  @data = []

  def take_tsv(tsv)
    @data = []
    tsv_data = tsv.split("\n")
    keys = tsv_data[0].split("\t")
    tsv_data.shift
    tsv_data.each do |line|
      hash = {}
      item = line.split("\t")
      keys.each_index { |idx| hash[keys[idx]] = item[idx] }
      @data.push(hash)
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    result = String.new
    headers = @data.first.keys.join("\t")
    result << "#{headers}\n"
    @data.each do |item|
      line = String.new
      line << item.values.join("\t")
      result << "#{line}\n"
    end
    result
  end
end
