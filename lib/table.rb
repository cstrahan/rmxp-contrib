class Table
  def dimensions
    if @dimensions.nil?
      @dimensions = 1
      @dimensions = 2 if self.ysize > 1
      @dimensions = 3 if self.zsize > 1
    end
    
    @dimensions
  end
  
  def yaml_items
    items = {}
    0.upto xsize do |x|
      0.upto ysize do |y|
        0.upto zsize do |z|
          key = [x] if dimensions == 1
          key = [x,y] if dimensions == 2
          key = [x,y,z] if dimensions == 3

          item = self[*key]
          items[key] = item
        end
      end
    end
    
    items
  end 
  
  def to_yaml_properties
    @yaml_items = yaml_items
    ["@yaml_items"]
  end
end