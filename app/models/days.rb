class Days < ActiveHash::Base
  self.data = [ {id: "nil", name: "---" },
    {id: 1, name: "1日"},
    {id: 2, name: "2〜3日"},
    {id: 3, name: "4〜5日"},
    {id: 4, name: "6〜7日"}
  ]
end