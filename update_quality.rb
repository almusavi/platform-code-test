require 'award'

def update_quality(awards)
  awards.each do |award|
    award = first_check(award)
    award = second_check(award)
  end
end

def first_check(award)
  if award.name != 'Blue First' && award.name != 'Blue Compare' 
    if award.quality > 0
      if award.name != 'Blue Distinction Plus' && award.name != 'Blue Star'
        award.quality -= 1
      elsif award.name == 'Blue Star'
        award.quality -= 2
      end
    end
  else
    if award.quality < 50
      award.quality += 1
      if award.name == 'Blue Compare'
        if award.expires_in < 11
          if award.quality < 50
            award.quality += 1
          end
        end
        if award.expires_in < 6
          if award.quality < 50
            award.quality += 1
          end
        end
      end
    end
  end
  award
end

def second_check(award)
  if award.name != 'Blue Distinction Plus'
    award.expires_in -= 1
  end
  if award.expires_in < 0
    if award.name != 'Blue First'
      if award.name != 'Blue Compare'
        if award.quality > 0
          if award.name != 'Blue Distinction Plus' && award.name != 'Blue Star'
            award.quality -= 1
          elsif award.name == 'Blue Star'
            award.quality -= 2
          end
        end
      else
        award.quality = award.quality - award.quality
      end
    else
      if award.quality < 50
        award.quality += 1
      end
    end
  end
  award
end

