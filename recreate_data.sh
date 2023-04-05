cat data/lab_dataset_captures* > lab_dataset_captures.tar.gz
cat data/packetcsvs* > packetcsvs.tar.gz

cp data/zeeklogs.tar.gz .

tar xzvf lab_dataset_captures.tar.gz
tar xzvf packetcsvs.tar.gz
tar xzvf zeeklogs.tar.gz