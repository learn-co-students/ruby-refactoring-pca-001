require 'spec_helper'

describe "RubyRefactoring" do
  let(:alfi) { Dog.new("Alfi", "Springer Spaniel", "Steven Nunez") }
  let(:steven) { alfi.owner }

  describe "Dog" do
    describe '#name' do
      it 'returns the name of the dog' do
        expect(alfi.name).to eq("Alfi")
      end
    end

    describe '#bark' do
      it 'returns a bark' do
        expect(alfi.bark).to eq("Woof!")
      end
    end

    describe '#breed' do
      it 'returns the breed classification' do
        expect(alfi.breed).to eq("Springer Spaniel")
      end
    end

    describe '#owner' do
      it 'returns the Owner object' do
        expect(alfi.owner).to eq(steven)
      end

      it 'returns Owner when #class is called on #owner' do
        expect(alfi.owner.class).to eq(Owner)
      end
    end
  end

  describe "Owner" do
    describe '#name' do
      it 'returns the name' do
        expect(steven.name).to eq("Steven Nunez")
      end
    end

    describe '#dog' do
      it 'returns the dog object associated with the owner' do
        expect(steven.dog).to eq(alfi)
      end
    end

    describe '#walk' do
      it 'receives the #prepare_items method' do
        expect(steven).to receive(:prepare_items)
        steven.walk
      end

      it 'takes the dog on a walk' do
        steven.walk
        expect(steven.dog.leash).to eq(true)
        expect(steven.dog.plastic_bag).to eq(true)
      end
    end

    describe '#vet_checkup' do
      it 'receives the #prepare_items method' do
        expect(steven).to receive(:prepare_items)
        steven.vet_checkup
      end

      it 'takes the dog to the vet' do
        steven.vet_checkup
        expect(steven.dog.leash).to eq(true)
        expect(steven.dog.plastic_bag).to eq(true)
      end
    end

    describe '#prepare_items' do
      before(:each) do
        steven.prepare_items
      end

      it 'sets leash attribute to true' do
        expect(steven.dog.leash).to eq(true)
      end

      it 'sets plastic_bag attribute to true' do
        expect(steven.dog.plastic_bag).to eq(true)
      end
    end
  end
end
