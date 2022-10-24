class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
    

  #shop_nameが存在しているかを確認するバリデーション
  #imageが存在しているかを確認するバリデーション
end
