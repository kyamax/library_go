class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '0 総記' },
    { id: 3, name: '1 哲学' },
    { id: 4, name: '2 歴史' },
    { id: 5, name: '3 社会科学' },
    { id: 6, name: '4 自然科学' },
    { id: 7, name: '5 技術・工学・工業' }
    { id: 8, name: '6 産業' }
    { id: 9, name: '7 芸術・美術' }
    { id: 10, name: '8 言語' }
    { id: 11, name: '9 文学' }
    { id: 12, name: 'F 絵本' }
  ]

  include ActiveHash::Associations
  has_many :books

end
