$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  list = []
  index = 0 
  while index < source.length do
    director_name = source[index][:name]
    list << director_name
    index += 1 
  end
  list
end

def total_gross(source)
  total = 0
  index = 0
  
  while index < list_of_directors(source).length do
    total += directors_totals(source)[list_of_directors(source)[index]]
    index += 1 
  end
  total 
end


