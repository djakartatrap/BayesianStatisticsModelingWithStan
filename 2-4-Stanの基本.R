# Title     : TODO
# Objective : TODO
# Created by: djakartatrap
# Created on: 2020/05/17

# ライブラリの読み込み
library(rstan)

# 計算の高速化
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

# 分析対象のデータ
file_beer_sales_1 <- read.csv("book-data/2-4-1-beer-sales-1.csv")

# StanでMCMCするためには、データをリスト型にしておく必要がある
# サンプルサイズ
sample_size <- nrow(file_beer_sales_1)
# List形式に変換
data_list <- list(sales = file_beer_sales_1$sales, N = sample_size)

# MCMCする
mcmc_result <- stan(
  file = "2-4-1-calc-mean-variance.stan",
  data = data_list,
  seed = 1,
  chains = 4,
  iter = 2000,
  warmup = 1000,
  thin = 1
)

# 結果の表示
print(
  mcmc_result,
  probs = c(0.025, 0.5, 0.975)
)

# 収束の確認
# 最低限行うべき収束のチェック方法
# n_eff は有効サンプルサイズ(有効サンプルサイズってどういう意味？)


