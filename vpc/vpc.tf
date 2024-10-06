resource "aws_vpc" "emirvpc" {
  cidr_block = "192.168.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "emir_vpc"
    Owner = "emir"
  }
}


# instance_tenancy
# Varsayılan olarak "default" değeri, EC2 instance'larının paylaşımlı (shared) 
# bir altyapıda başlatılacağını gösterir. Alternatif olarak "dedicated" seçilirse, 
# instance'lar sadece sizin için ayrılmış fiziksel donanım üzerinde çalışır.


#  enable_dns_support
# Ne İşe Yarar: true olarak ayarlandığında, VPC içinde DNS çözümlemesi etkin hale gelir. 
# Bu, örneğin EC2 instance'larının IP adresleri yerine domain isimleriyle haberleşebilmesi 
# için gereklidir.

# Etkilediği Durum: DNS desteği kapalı olursa, VPC'deki kaynaklar yalnızca IP adresleri ile 
# haberleşebilir, bu da esnekliği azaltır.


#  enable_dns_hostnames
# Ne İşe Yarar: true olarak ayarlandığında, VPC'deki her instance bir DNS hostname alır. 
# Bu, özellikle AWS'nin iç DNS sistemi üzerinden isim çözümlemeleri yapılırken kullanışlıdır.

# Etkilediği Durum: Hostname'ler devre dışı bırakıldığında, EC2 instance'larının DNS üzerinden 
# isim çözümlemesi zorlaşır ve yalnızca IP adresleri ile erişim sağlanır.