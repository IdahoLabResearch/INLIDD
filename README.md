# INLIDD Dataset

## Lab Setup:
#### Users:
* proxmox ssh: root,INLhack3rboxes!
* administrator,targetbox102!
* domain_god,targetbox102!
* elliot,Password12345!
* darlene,Password12345!
* al,Password12345!

#### Architecture
All of the ISO's used are on proxmox. Each of the VM's (I probably forgot one or two) has a snapshot labeled b4malware, which 
was taken before any attacks were run against the system. The IP addresses below pertain to when the existing pcaps were taken, however all of the systems except the domain controler are using dhcp and so addresses may change.

#### Target AD Domain:
`192.168.70.4` Windows Domain Controler and mail server.

`192.168.70.107` Windows 2019 server, hosting file server.

`192.168.70.160` WIndows 10 Desktop.

`192.168.70.203` Windows 10 Desktop. Hosts the DVWA webserver.

`192.168.70.222` Ubuntu machine. Part of the active directory network, now dead.

`192.168.70.101` Replacement for the ubuntu machine mentioned above.

#### Attacker Machines:
`192.168.70.137` Kali box. Used for running many of the attacks.

`64.227.69.82` Sliver C2 machine (nowstudios.xyz)

`104.248.193.232` Caldera C2 machine

#### Random:
`192.168.70.215` gNB, most traffic should probably be removed.

`192.168.70.170` UE, sometimes used to connect to proxmox.

`192.168.70.3` ip of the proxmox server.

## Data & Preprocessing
The pcaps were edited using [this](https://github.com/Hannnah1/Edcap) program.
That same program was used to convert the packets to csv representations of important data. This was way faster than using scapy+pandas.

Included in this repo are two jupyter notebooks which show examples of how to access this data and put it into a common format.
DNS.ipynb - Retrieves the UIDs of flows containing DNS queries to nowstudios.xyz (Note this must be run before Flows.ipynb)
Flows.ipnb - Generates labels for the flow data in the zeek logs and then parses the packet files into those flows

The pcap files are located in `lab_dataset_captures`

The parsed pcap files as CSVs are located in `packetcsvs`

The unlabeled zeek logs created from the pcap files located in `zeeklogs`

To upload these files to github they had to be split into parts smaller than 2GB. this was done using `split`
To recreate the original files simply run `bash recreate_data.sh` in the project's root directory