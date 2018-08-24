RSpec.describe Merchant do
  describe "Validations" do
    it "is invalid without a name" do
      merchant = Merchant.new({})
      expect(merchant).to_not be_valid
    end
  end

  describe "Mapping" do
    it "creates a merchant with a name" do
      merchant = Merchant.create(name: "First Merchant")

      expect(merchant).to be_valid

      m = Merchant.find(merchant.id)
      expect(m.id).to equal merchant.id
    end
  end
end
