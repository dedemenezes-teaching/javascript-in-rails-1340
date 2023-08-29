if @monument.persisted?
  json.inserted_item render(partial: 'monuments/monument', formats: [:html], locals: { monument: @monument })
  json.form render(partial: 'monuments/form', formats: [:html], locals: { monument: Monument.new })
else
   json.form render(partial: 'monuments/form', formats: [:html], locals: { monument: @monument })
end
