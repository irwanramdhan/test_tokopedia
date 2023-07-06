class TokpedRequirement
    include DataMagic
    DataMagic.load 'tokped.yml'
  
    def load_tokped(user_details)
      data_for "tokped/#{user_details}"
    end
  end
  