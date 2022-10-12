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
       y = "Probabilitas") +
  scale_fill_brewer(palette = "Pastel1")

```
Digunakan ggplot untuk merepresentasikan data.frame (kumpulan data sesuai dengan kasus yang diminta) kemudian akan di *highlight* pada kasus terkait

Dimana didapatkan output 

![1d](https://user-images.githubusercontent.com/90272678/195267750-6d9ac5cc-c542-4c0a-af1c-3b3094da6a64.png)

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

## 2. Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :
#### a. Peluang terdapat 4 pasien yang sembuh.

```R
n = 20
p = 0.2
x = 4
dbinom (x, n, p)
```
Dengan keterangan, `n` adalah jumlah pasien yang menderita Covid19, `p` adalah probabilitas keberhasilan, dan `x` adalah jumlah pasien yang sembuh 

Dimana didapatkan output 

![2a](https://user-images.githubusercontent.com/90272678/195267949-5619acbd-d206-4661-be3c-64b1d5bebb19.png)

#### b. Gambarkan grafik histogram berdasarkan kasus tersebut.

```R
library(dplyr)
library(ggplot2)

data.frame(x = 0:20, prob = dbinom(x = 0:20, size = 20, prob = 0.2)) %>%
  mutate(Sembuh = ifelse(x == 4, 4, "other")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Sembuh)) +
  theme_minimal()+
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0) +
  labs(title = "Histogram Distribusi Binomial Probabilitas dari X=4 Sembuh dari 20",
       x = "Sembuh (x)",
       y = "Probabilitas")+
  scale_fill_brewer(palette = "Pastel1")
```
Digunakan ggplot untuk merepresentasikan data.frame (kumpulan data sesuai dengan kasus yang diminta) kemudian akan di *highlight* pada kasus terkait

Dimana didapatkan output

![2b](https://user-images.githubusercontent.com/90272678/195273606-9ccd8659-5c87-42de-beaa-556c6914ae83.png)

#### c Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Binomial.

```R
#nilai rataan
nilai_rataan <- n*p; nilai_rataan

#nilai varian
nilai_varian <- n*p*(1-p); nilai_varian

```
Dengan keterangan, `n` adalah jumlah pasien yang menderita Covid19, `p` adalah probabilitas keberhasilan

Dimana didapatkan output

![2c](https://user-images.githubusercontent.com/90272678/195274223-8dd904f8-92be-41e8-8848-8b21dfbbdf07.png)

## 3. Diketahui data dari  sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)
#### a. Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?

```R
lambda = 4.5
x = 6
dpois(x, lambda)
```
Dengan keterangan, `lambda` adalah mean atau rata-rata historis, `x` adalah jumlah keberhasilan (bayi lahir di rumah sakit) pada interval tertentu (besok)

Dimana didapatkan output

![3a](https://user-images.githubusercontent.com/90272678/195275359-2200d25e-d954-47cb-881c-10027d676c6a.png)

#### b. simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini  selama setahun (n = 365)

```R
random_data <- data.frame('data' = rpois(365, 4.5))
random_data %>% ggplot() +
  geom_histogram(aes(x = data,
                     y = stat(count / sum(count)),
                     fill = data == 6),
                 binwidth = 1,
                 color = 'black',) +
  scale_x_continuous(breaks = 0:10) + 
  labs(x = 'Jumlah bayi yang lahir per periode',
       y = 'Proporsi',
       title = 'Histogram Kelahiran 6 Bayi di Rumah Sakit Selama Setahun') +
  scale_fill_brewer(palette = "Pastel1")

random_data %>% dplyr::summarize(six_babies = sum(random_data$data == 6) / n())
```
Digunakan `ggplot` untuk merepresentasikan `data.frame` (kumpulan data sesuai dengan kasus yang diminta) kemudian akan di *highlight* pada kasus terkait
`summarize` berfungsi untuk merangkum data menjadi satu data 

Dimana didapatkan output

![3bhisto](https://user-images.githubusercontent.com/90272678/195279325-f1440a3f-1aed-4ba2-8530-26ff3666b6f7.png)
![3bsummary_value](https://user-images.githubusercontent.com/90272678/195279374-87252ce3-9d66-44fd-860e-4ca1168479a3.png)

#### c dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan
###### Didapatkan hasil pada 3a adalah 0.1281201, sedangkan pada 3b didapatkan hasil yang mendekati, sehingga dapat ditarik kesimpulan bahwa perhitungan pada 3a mendekati simulasi terkait yang dilakukan pada soal 3b

#### d Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.

```R
#nilai rataan
nilai_rataan <- lambda; nilai_rataan

#nilai varian
nilai_varian <- lambda; nilai_varian
```

Dimana didapatkan output

![3d](https://user-images.githubusercontent.com/90272678/195280789-ad356d21-c76e-4df9-a65d-58c2a7ff248c.png)
