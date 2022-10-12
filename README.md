# Modul1_Probstat_5025211152
Repository untuk Praktikum Modul 1 Probabilitas dan Statistika 2022 Informatika ITS

## 1. Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya.
#### a. Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ? (distribusi Geometrik)
```R
p = 0.20
n = 3
dgeom (x = n, prob = p)
```
Dengan keterangan, `p` adalah probabilitas keberhasilan dan `x` adalah jumlah kegagalan sebelum menemui sukses

Dimana didapatkan output 

![1a](https://user-images.githubusercontent.com/90272678/195225335-563ac305-198b-4df5-946f-29ddb157bf71.png)

#### b. mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 )

```R
mean(rgeom(n = 10000, prob = p) == 3)
```
Dengan keterangan, `p` adalah probabilitas keberhasilan dan `n` adalah jumlah data random yang di bangkitkan

Dimana didapatkan output 

![1b](https://user-images.githubusercontent.com/90272678/195226962-93d29987-24a4-4348-8cc3-7aa162694f45.png)

#### c. Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?

###### Nilai yang didapatkan dari nomor 1a adalah 0.1024, disisi lain, pada 1b didapatkan nilai yang tidak jauh beda dengan 1a, sehingga dapat disimpulkan bahwa perhitungan pada 1a mendekati hasil mean data random distribusi geometrik pada 1b

#### d. Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama

```R
library(dplyr)
library(ggplot2)

data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = p)) %>%
  mutate(Failures = ifelse(x == 3, 3, "other")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Histogram Distribusi Geometrik , Peluang gagal Sebelum Sukses Pertama, X = 3",
       x = "Jumlah gagal sebelum berhasil pertama kali",
       y = "Probabilitas") 

```
Dimana didapatkan output 

![1c](https://user-images.githubusercontent.com/90272678/195229275-8c28521f-9d8f-4551-921b-0b376fa9217e.png)

#### e. Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama

```R
#nilai rataan
nilai_rataan <- 1/p; nilai_rataan

#nilai varian
nilai_varian <- (1-p)/(p^2); nilai_varian
```
Dengan keterangan, `p` adalah probabilitas keberhasilan

Dimana didapatkan output 

![1e](https://user-images.githubusercontent.com/90272678/195229548-c7cf0a42-fdb2-45cc-afec-ab6718cd14f9.png)

