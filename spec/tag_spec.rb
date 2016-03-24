describe Tag do

  let(:link){ double :Link}
  let(:link_tag){ double :LinkTag, create: nil }
  let(:tags){ 'music, noise'}
  subject(:tag){ described_class }


  describe '#self.create_tags' do
    it 'calls create method on LinkTag' do
      expect(link_tag).to receive(:create).twice
      tag.create_tags(link_tag, link, tags)
    end
    it 'calls create method on LinkTag' do
      expect(tag).to receive(:create).twice
      tag.create_tags(link_tag, link, tags)
    end
  end



end
