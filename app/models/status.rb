class Status < ActiveHash::Base
  self.data = [ {id: "nil", name: "---" },
    {id: 1, name: "未開封新品同様"},
    {id: 2, name: "開封済み未使用美品、問題なく使用できる"},
    {id: 3, name: "キズあり、問題なく使用できる"},
    {id: 4, name: "美品、性能に問題アリ"},
    {id: 5, name: "キズあり、性能に問題アリ"}
  ]
end