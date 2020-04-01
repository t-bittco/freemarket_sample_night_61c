class Charge < ActiveHash::Base
  self.data = [ {id: "nil", name: "---" },
    {id: 1, name: "出品者負担（送料込み）"},
    {id: 2, name: "購入者負担"}
  ]
end