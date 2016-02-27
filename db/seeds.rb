[
{ name: "イズムの功過", price: 1000 }, { name: "一夜", price: 1200 }, { name: "永日小品", price: 1500 }, { name: "薤露行", price: 800 }, { name: "学者と名誉", price: 500 }, { name: "硝子戸の中", price: 700 }, { name: "虚子君へ", price: 1000 }, { name: "草枕", price: 1200 }, { name: "虞美人草", price: 1500 }, { name: "ケーベル先生", price: 800 }, { name: "こころ", price: 500 }, { name: "三四郎", price: 700 },
].each_with_index do |book, index|
  Book.create(name: book[:name], price: book[:price])
end
