task sync: :environment do
  system('rsync -avzh --progress -e ssh rails@app.icm-mos.ru:~/app.icm-mos.ru/shared/storage ./')
end
