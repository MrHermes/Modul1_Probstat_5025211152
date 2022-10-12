#1 a Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi  sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ? (distribusi Geometrik)
p = 0.20
n = 3
dgeom (x = n, prob = p)
#0.1024

#b mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 )
mean(rgeom(n = 10000, prob = p) == 3)


#c Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?
# Nilai yang didapatkan dari nomor 1a adalah 0.1024, disisi lain, pada 1b didapatkan nilai yang tidak jauh beda dengan 1a, sehingga dapat disimpulkan bahwa perhitungan pada 1a mendekati hasil mean data random distribusi geometrik pada 1b

#d Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama
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
  
#e Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik.

#nilai rataan
nilai_rataan <- 1/p; nilai_rataan
#5

#nilai varian
nilai_varian <- (1-p)/(p^2); nilai_varian
#20

#2 a Peluang terdapat 4 pasien yang sembuh.
# Jumlah pasien menderita COVID19 = 20, Peluang sembuh = 0.2
n = 20
p = 0.2
x = 4
dbinom (x, n, p)
#0.2181994

#b Gambarkan grafik histogram berdasarkan kasus tersebut.

#data distribusi binomial
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

#c Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Binomial.

#nilai rataan
nilai_rataan <- n*p; nilai_rataan
#4

#nilai varian
nilai_varian <- n*p*(1-p); nilai_varian
#3.2

#3 a Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?
lambda = 4.5
x = 6
dpois(x, lambda)
#0.1281201

#b simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini  selama setahun (n = 365)
library(dplyr)
library(ggplot2)

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

#c dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan
#Didapatkan hasil pada 3a adalah 0.1281201, sedangkan pada 3b didapatkan hasil yang mendekati, sehingga dapat ditarik kesimpulan bahwa perhitungan pada 3a mendekati simulasi terkait yang dilakukan pada soal 3b

#d Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.

#nilai rataan
nilai_rataan <- lambda; nilai_rataan
#4.5

#nilai varian
nilai_varian <- lambda; nilai_varian
#4.5

#4 a Fungsi Probabilitas dari Distribusi Chi-Square.
x = 2
v = 10
dchisq(x, v)
#0.007664155

#b Histogram dari Distribusi Chi-Square dengan 100 data random.
set.seed(100)
n = 100
chisquare_data <- rchisq(n, v)

hist(chisquare_data, breaks = 10, main = "Histogram Distribusi Chi-Square dari 100 Data Random")

#c Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Chi-Square.

#nilai rataan
nilai_rataan <- v; nilai_rataan

#nilai varian
nilai_varian <- 2*v; nilai_varian
#20

#5 a Fungsi Probabilitas dari Distribusi Exponensial 
lambda = 3

#diketahui bilangan acak berdistribusi exponential
#misalkan ada 10 bilangan random
set.seed(1)
dexp(rexp(10, lambda))

#b Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random
set.seed(1)

#membuat tampilan 2x2
par(mfrow=c(2,2))

hist(rexp(10, lambda), main = "Histogram Distribusi Exponensial untuk 10 Bilangan Random")
hist(rexp(100, lambda), main = "Histogram Distribusi Exponensial untuk 100 Bilangan Random")
hist(rexp(1000, lambda), main = "Histogram Distribusi Exponensial untuk 1000 Bilangan Random")
hist(rexp(10000, lambda), main = "Histogram Distribusi Exponensial untuk 10000 Bilangan Random")

#c Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3
set.seed(1)
n = 100
lambda = 3

#nilai rataan
mean(rexp(n, lambda))

#nilai varian
var(rexp(n, lambda))

#6 a Fungsi Probabilitas dari Distribusi Normal P(X1 ≤ x ≤ X2), hitung Z-Score Nya dan plot data generate randomnya dalam bentuk grafik. Petunjuk(gunakan fungsi plot()).
#Keterangan : 
#X1 = Dibawah rata-rata 
#X2 = Diatas rata-rata

# Terdapat 100 data dengan mean = 50 serta sd = 8
set.seed(1)
n = 100
mean_data = 50
sd_data = 8

data <- rnorm(n, mean_data, sd_data); data
rataan_data <- mean(data)

X1 <- floor(rataan_data); X1
X2 <- ceiling(rataan_data); X2

upper_prob <- pnorm(X2, mean_data, sd_data)
lower_prob <- pnorm(X1, mean_data, sd_data)
probability <- upper_prob - lower_prob ; probability

z_scores <- (data - rataan_data)/ sd(data); z_scores
par(mfrow=c(1,1))

#plot data generate random
plot (data)

#b Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan: 
#NRP_Nama_Probstat_{Nama Kelas}_DNhistogram
hist(data, breaks = 50, main = "5025211152_Frederick Hidayat_Probstat_A_DNhistogram")

#c Nilai Varian (σ²) dari hasil generate random nilai Distribusi Normal.
var(data)