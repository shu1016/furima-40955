FactoryBot.define do
  factory :order_delivery do
    post_code             {"111-1234"}
    region_id             {Region.where.not(id: 1).sample.id}
    city                  {"横浜市"}
    address               {"青山町1-1-1"}
    building              {"第一ビル"}
    tel_number            {"09011112222"}
    token                 {"tok_abcdefghijk00000000000000000"}
  end
end
