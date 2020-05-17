data{
  int N;
  vector[N] sales;
}

parameters{
  real mu; // 平均
  real<lower=0> sigma; // 標準偏差
}

model{
  // 平均 mu、標準偏差 sigma の正規分布に従ってデータ得られたと家庭
  for (i in 1:N){
    sales[i] ~ normal(mu, sigma);
  }
}
