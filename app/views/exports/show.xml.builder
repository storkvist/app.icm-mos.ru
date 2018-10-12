xml.instruct!
xml.kits do
  @kits.each do |kit|
    xml.kit do
      xml.article kit.article
      xml.year kit.year
      xml.kit_description_en kit.kit_description_en
      xml.kit_description_ru kit.kit_description_ru
      xml.prototype_description_en kit.prototype_description_en
      xml.prototype_description_ru kit.prototype_description_ru
      xml.packaging_description_en kit.packaging_description_en
      xml.packaging_description_ru kit.packaging_description_ru
    end
  end
end
