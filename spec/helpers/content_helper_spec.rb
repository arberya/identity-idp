require 'rails_helper'

RSpec.describe ContentHelper do
  include ContentHelper

  describe '#split_tag' do
    context 'receives a string' do
      it 'returns an array delimited at the value given' do
        example_sentence = 'It is cloudy outside today.'
        split = split_tag(example_sentence, 'cloudy')
        expect(safe_join(split)).to eq(
          safe_join(['It is ', 'cloudy', ' outside today.'])
        )
      end

      it 'returns the same string if the delimiter is not present' do
        example_sentence = 'It is cloudy outside today.'
        split = split_tag(example_sentence, 'not in set')
        expect(safe_join(split)).to eq(safe_join([example_sentence]))
      end
    end

    context 'receives an array' do
      it 'returns an array delimited at the value given' do
        example_array = ['It is ', 'cloudy', ' outside today.']
        split = split_tag(example_array, 'outside')
        expect(safe_join(split)).to eq(
          safe_join(['It is ', 'cloudy', ' outside today.'])
        )
      end

      it 'returns the same array if that delimiter is not present' do
        example_array = ['It is ', 'cloudy', ' outside today.']
        split = split_tag(example_array, 'not in set')
        expect(safe_join(split)).to eq(safe_join(example_array))
      end
    end
  end
end
